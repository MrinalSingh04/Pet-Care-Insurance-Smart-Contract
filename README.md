# 🐾 Pet Care Insurance Smart Contract

## **Overview**

The **Pet Care Insurance Contract** is a decentralized smart contract that allows pet owners to stake a monthly premium for insurance coverage. In the event of a verified health issue for the pet, the contract automatically pays out a predefined coverage amount.

Verification of health issues is simulated via an **oracle-like admin approval**, but can be integrated with real-world oracle networks (e.g., Chainlink) for production.

This contract aims to make pet insurance **transparent, automated, and trustless**.
 
--- 

## **What It Does**

- Allows **pet owners to register pets** and stake a monthly insurance premium.
- Owners can **file claims** for pet health issues.
- An **admin (or oracle)** approves claims, simulating vet/hospital verification.
- Upon approval, the **contract automatically pays out** the coverage amount to the owner.
- Maintains a record of all pets, premiums, and claims on-chain.

---

## **Why It’s Needed**

Traditional pet insurance has several limitations:

- **Slow claim process**: Often requires manual verification and paperwork.
- **Centralized trust**: Users depend on insurance companies for payouts.
- **Lack of transparency**: Policy terms and claim history are often opaque.

By using a smart contract:

- **Transparency**: All rules are on-chain; no hidden clauses.
- **Automation**: Claims are automatically paid once verified.
- **Trustless verification**: Oracles can verify claims without relying on a single authority.
- **Flexible**: Can integrate with crypto payments, NFTs, or tiered coverage models.

---

## **Key Features**

- **Pet Registration**: Store pet name, species, owner, and coverage amount.
- **Premium Staking**: Pay monthly premiums to maintain insurance.
- **Claim Filing**: Owners can submit claims for health issues.
- **Oracle/Admin Verification**: Approve claims to ensure legitimacy.
- **Automated Payout**: Transfer coverage amount automatically to owner.
- **Insurance Lifecycle**: Insurance ends after a payout or can be renewed via premium payments.

---

## **How It Works (Flow)**

1. **Register Pet**: Owner sends ETH and pet details to register the pet with coverage amount.
2. **Pay Premium**: Owner maintains active insurance by paying monthly premiums.
3. **File Claim**: Owner submits a claim describing the pet’s health issue.
4. **Approve Claim**: Admin or oracle verifies the claim and approves it.
5. **Payout**: Contract automatically transfers coverage amount to the pet owner.
6. **End Insurance**: Pet insurance ends after payout.

---

## **Usage Example**

1. Deploy contract with admin wallet.
2. Register a pet by sending ETH as premium.
3. File a claim if a health issue occurs.
4. Admin approves the claim.
5. Owner receives automatic payout from the contract.

---

## **Benefits**

- Faster, transparent, and automated pet insurance.
- Reduces dependency on central insurance companies.
- Provides verifiable, tamper-proof records of claims and payouts.
- Encourages better pet healthcare and accountability.

---

## **Tech Stack**

- Solidity 0.8.x
- Ethereum-compatible blockchain (e.g., Hardhat local node, Polygon Mumbai testnet)

---

## **License**

MIT License
