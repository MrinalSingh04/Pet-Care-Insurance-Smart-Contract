// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract PetCareInsurance {
    struct Pet {
        string name;
        string species;
        address owner;
        uint256 coverageAmount;
        bool insured;
    }

    struct Claim {
        uint256 petId;
        string issue;
        bool approved;
        bool paid;
    }

    uint256 public nextPetId = 1;
    uint256 public nextClaimId = 1;

    mapping(uint256 => Pet) public pets;
    mapping(uint256 => Claim) public claims;
    mapping(address => uint256) public premiumsPaid;

    address public admin;

    constructor() {
        admin = msg.sender;
    }

    // 🐾 Register a pet and set coverage amount
    function registerPet(string memory _name, string memory _species, uint256 _coverageAmount) external payable {
        require(msg.value > 0, "Must pay initial premium to register pet");

        pets[nextPetId] = Pet({
            name: _name,
            species: _species,
            owner: msg.sender,
            coverageAmount: _coverageAmount,
            insured: true
        });

        premiumsPaid[msg.sender] += msg.value;

        nextPetId++;
    }

    // 🩺 File a claim for a pet health issue
    function fileClaim(uint256 _petId, string memory _issue) external {
        Pet memory pet = pets[_petId];
        require(pet.insured, "Pet is not insured");
        require(msg.sender == pet.owner, "Only owner can file claim");

        claims[nextClaimId] = Claim({
            petId: _petId,
            issue: _issue,
            approved: false,
            paid: false
        });

        nextClaimId++;
    }

    // ✅ Admin approves claim (simulate oracle verification)
    function approveClaim(uint256 _claimId) external {
        require(msg.sender == admin, "Only admin can approve claims");
        Claim storage c = claims[_claimId];
        require(!c.approved, "Claim already approved");

        c.approved = true;
    }

    // 💸 Payout approved claim
    function payoutClaim(uint256 _claimId) external {
        Claim storage c = claims[_claimId];
        Pet storage pet = pets[c.petId];

        require(c.approved, "Claim not approved");
        require(!c.paid, "Claim already paid");

        c.paid = true;
        pet.insured = false; // insurance ends after payout

        payable(pet.owner).transfer(pet.coverageAmount);
    }

    // 📝 Pay monthly premium to maintain insurance
    function payPremium() external payable {
        require(msg.value > 0, "Must send some ETH");
        premiumsPaid[msg.sender] += msg.value;
    }

    // 🔹 View pet details
    function getPet(uint256 _petId) external view returns (Pet memory) {
        return pets[_petId];
    }

    // 🔹 View claim details
    function getClaim(uint256 _claimId) external view returns (Claim memory) {
        return claims[_claimId];
    }
}
