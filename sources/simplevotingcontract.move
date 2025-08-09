module voting_contract::SimpleVoting {
    use aptos_framework::signer;
    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;

    
    struct Proposal has store, key {
        yes_votes: u64,      
        no_votes: u64,      
        is_active: bool,    
    }

   
    struct VoteRecord has store, key {
        has_voted: bool,
        proposal_owner: address,
    }

   
    public fun create_proposal(creator: &signer) {
        let proposal = Proposal {
            yes_votes: 0,
            no_votes: 0,
            is_active: true,
        };
        move_to(creator, proposal);
    }

  
    public fun vote(
        voter: &signer, 
        proposal_owner: address, 
        vote_yes: bool, 
        token_amount: u64
    ) acquires Proposal, VoteRecord {
        let voter_addr = signer::address_of(voter);
        
       
        if (exists<VoteRecord>(voter_addr)) {
            let vote_record = borrow_global<VoteRecord>(voter_addr);
            assert!(vote_record.proposal_owner != proposal_owner, 1); 
        };

      
        let proposal = borrow_global_mut<Proposal>(proposal_owner);
        assert!(proposal.is_active, 2); 

        
        let vote_tokens = coin::withdraw<AptosCoin>(voter, token_amount);
        coin::deposit<AptosCoin>(proposal_owner, vote_tokens);

        
        if (vote_yes) {
            proposal.yes_votes = proposal.yes_votes + token_amount;
        } else {
            proposal.no_votes = proposal.no_votes + token_amount;
        };

        
        let vote_record = VoteRecord {
            has_voted: true,
            proposal_owner,
        };
        move_to(voter, vote_record);
    }
}
