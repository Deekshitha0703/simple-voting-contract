module voting_contract::SimpleVoting {
    use aptos_framework::signer;
    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;

    /// Struct representing a voting proposal
    struct Proposal has store, key {
        yes_votes: u64,      // Total token weight for yes votes
        no_votes: u64,       // Total token weight for no votes
        is_active: bool,     // Whether voting is still active
    }

    /// Struct to track if a user has already voted
    struct VoteRecord has store, key {
        has_voted: bool,
        proposal_owner: address,
    }

    /// Function to create a new voting proposal
    public fun create_proposal(creator: &signer) {
        let proposal = Proposal {
            yes_votes: 0,
            no_votes: 0,
            is_active: true,
        };
        move_to(creator, proposal);
    }

    /// Function to cast a vote with token weight
    public fun vote(
        voter: &signer, 
        proposal_owner: address, 
        vote_yes: bool, 
        token_amount: u64
    ) acquires Proposal, VoteRecord {
        let voter_addr = signer::address_of(voter);
        
        // Check if voter has already voted on this proposal
        if (exists<VoteRecord>(voter_addr)) {
            let vote_record = borrow_global<VoteRecord>(voter_addr);
            assert!(vote_record.proposal_owner != proposal_owner, 1); // Error: Already voted
        };

        // Borrow the proposal
        let proposal = borrow_global_mut<Proposal>(proposal_owner);
        assert!(proposal.is_active, 2); // Error: Proposal not active

        // Transfer tokens as voting weight (tokens are locked during vote)
        let vote_tokens = coin::withdraw<AptosCoin>(voter, token_amount);
        coin::deposit<AptosCoin>(proposal_owner, vote_tokens);

        // Record the vote
        if (vote_yes) {
            proposal.yes_votes = proposal.yes_votes + token_amount;
        } else {
            proposal.no_votes = proposal.no_votes + token_amount;
        };

        // Mark voter as having voted
        let vote_record = VoteRecord {
            has_voted: true,
            proposal_owner,
        };
        move_to(voter, vote_record);
    }
}