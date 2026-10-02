**# Multi-Line Insurance Policy and Claims Management System**

**## 📌 Project Overview**

The **Multi-Line Insurance Policy and Claims Management System** is a Salesforce project developed to manage different types of insurance policies and claims in one centralized system.

The system supports:

* Auto Insurance
* Property Insurance
* Life Insurance
* Policy creation and management
* Automatic premium calculation
* Claim creation and routing
* Claim approval
* Claims Adjuster dashboard
* Role-based access
* Salesforce Flow automation
* Apex development
* Lightning Web Components (LWC)

The main goal is to reduce manual work and make the insurance policy and claim process easier to manage.

---

**#  Project Objectives**

The project aims to:

1. Create a centralized Policy and Claim management system.
2. Support multiple insurance types.
3. Automate premium calculation.
4. Automate claim routing and approval.
5. Provide a dashboard for Claims Adjusters.
6. Control access based on user roles.
7. Improve claim processing using Salesforce automation.
8. Use Apex and LWC for advanced functionality.

---

# 🛠️ Technologies Used

| Technology               | Purpose                                   |
| ------------------------ | ----------------------------------------- |
| Salesforce               | Main development platform                 |
| Salesforce Objects       | Store Policy, Claim and Customer data     |
| Record Types             | Separate Auto, Property and Life policies |
| Field Sets               | Group policy-specific fields              |
| Salesforce Flow          | Automate business processes               |
| Screen Flow              | Collect and display information           |
| Record-Triggered Flow    | Automatically process records             |
| Approval Process         | Manage claim approvals                    |
| Apex                     | Backend business logic                    |
| SOQL                     | Retrieve Salesforce data                  |
| Lightning Web Components | Build the Claims Adjuster dashboard       |
| JavaScript               | LWC functionality                         |
| Git                      | Version control                           |
| GitHub                   | Project repository                        |

---

**#  System Architecture**

The overall system works like this:

```text
                         CUSTOMER
                            |
                            ↓
                    POLICY CREATION
                            |
              ┌─────────────┼─────────────┐
              ↓             ↓             ↓
            AUTO         PROPERTY        LIFE
              |             |             |
              └─────────────┼─────────────┘
                            ↓
                       POLICY RECORD
                            |
                            ↓
                    PREMIUM CALCULATION
                            |
                            ↓
                       ACTIVE POLICY
                            |
                            ↓
                      CLAIM CREATION
                            |
                            ↓
                    CLAIM ROUTING FLOW
                            |
                            ↓
                    CLAIMS ADJUSTER
                            |
                            ↓
                  LWC CLAIM DASHBOARD
                            |
                            ↓
                     CLAIM REVIEW
                            |
                            ↓
                    APPROVAL PROCESS
                            |
                    ┌───────┴───────┐
                    ↓               ↓
                 APPROVED         REJECTED
```

---

#  Project Modules

The project is divided into four main milestones:

```text
Milestone 1
Core Data Model & Policy Configuration
              ↓
Milestone 2
Policy & Claim Automation
              ↓
Milestone 3
Claims Adjuster LWC Dashboard
              ↓
Milestone 4
Advanced Claim Processing, Security & Testing
```

---

# 🚀 MILESTONE 1 — Core Data Model & Policy Configuration

## 1. Create Policy Custom Object

Create a custom object called:

```text
Policy
```

API Name:

```text
Policy__c
```

The Policy object stores information about insurance policies.

### Example Policy Fields

* Policy Number
* Customer
* Policy Type
* Premium
* Start Date
* End Date
* Status

---

## 2. Create Policy Record Types

Create three Record Types for the Policy object:

```text
Auto
Property
Life
```

This allows different types of insurance policies to have different fields and layouts.

### Policy Record Type Structure

```text
                 POLICY
                    |
        ┌───────────┼───────────┐
        ↓           ↓           ↓
      AUTO       PROPERTY      LIFE
```

---

## 3. Create Auto Field Set

Create a Field Set on the Policy object.

### Field Set Name

```text
Auto_Fields
```

Add:

* VIN
* Model Year

The Auto Field Set contains fields required for Auto Insurance.

---

## 4. Create Property Field Set

Create another Field Set.

### Field Set Name

```text
Property_Fields
```

Add:

* Square Footage

The Property Field Set contains information required for Property Insurance.

---

## 5. Create Policy Fields

Create the required fields in the Policy object.

Example:

| Field          | Purpose                     |
| -------------- | --------------------------- |
| Policy Number  | Identifies the policy       |
| Customer       | Links policy to customer    |
| Policy Type    | Identifies insurance type   |
| Premium        | Stores premium amount       |
| Start Date     | Policy start date           |
| End Date       | Policy expiry date          |
| Status         | Current policy status       |
| VIN            | Auto policy information     |
| Model Year     | Auto policy information     |
| Square Footage | Property policy information |

---

# 6. Create Claim Custom Object

Create a custom object:

```text
Claim
```

API Name:

```text
Claim__c
```

The Claim object stores insurance claim information.

### Example Claim Fields

* Claim Number
* Policy
* Customer
* Claim Amount
* Claim Type
* Claim Status
* Claim Date
* Claim Description
* Approval Status

---

# 7. Create Claim Record Types

Create Record Types for different claim categories.

Example:

```text
Auto Claim
Property Claim
Life Claim
```

This allows claims to be managed according to the type of insurance.

---

# 8. Create Claim Fields

Create the required fields on the Claim object.

| Field             | Purpose                  |
| ----------------- | ------------------------ |
| Claim Number      | Identifies the claim     |
| Policy            | Related insurance policy |
| Customer          | Related customer         |
| Claim Amount      | Amount requested         |
| Claim Type        | Type of claim            |
| Claim Status      | Current claim status     |
| Claim Date        | Date of claim            |
| Claim Description | Details of claim         |
| Approval Status   | Approval tracking        |

---

# 9. Create Auto Quoting Screen Flow

Create a Screen Flow called:

```text
AutoQuotingFlow
```

The purpose of this flow is to collect Auto Insurance information and create a draft Policy.

### Flow

```text
START
  ↓
Enter Auto Policy Details
  ↓
Validate Information
  ↓
Create Draft Policy
  ↓
END
```

The premium calculation will be added later in Milestone 2.

---

# 10. Create Policy Validation Rule

Create a Validation Rule on the Policy object.

The validation rule prevents invalid policy information from being saved.

Example validations can check:

* Required policy information
* Valid dates
* Required Auto information
* Required Property information

---

# ✅ Milestone 1 Result

At the end of Milestone 1, the system has:

```text
Policy Object
     |
     ├── Auto
     ├── Property
     └── Life

Claim Object
     |
     ├── Auto Claim
     ├── Property Claim
     └── Life Claim

AutoQuotingFlow
     |
     └── Creates Draft Policy
```

---

# 🚀 MILESTONE 2 — Complex Policy Insurance & Claim Routing Automation

Milestone 2 adds automation and Apex business logic.

---

# 1. Create PremiumCalculator Apex Class

Create an Apex class:

```text
PremiumCalculator
```

Purpose:

The class calculates the premium for a policy based on policy information.

### Basic Flow

```text
Policy Information
       ↓
PremiumCalculator
       ↓
Calculated Premium
```

The method accepts policy information and returns the calculated premium.

---

# 2. Connect PremiumCalculator to AutoQuotingFlow

Open:

```text
AutoQuotingFlow
```

After the **Create Records** element, add an **Action**.

Select the Apex action for:

```text
PremiumCalculator
```

### Action Label

```text
Calculate Premium Action
```

---

# 3. Pass Policy ID to Apex

The Flow uses:

```text
varPolicyId
```

Pass this variable to the Apex action.

```text
Policy Id = varPolicyId
```

This tells Apex which Policy needs premium calculation.

---

# 4. Store Calculated Premium

Create a Flow variable:

```text
varCalculatedPremium
```

Configuration:

| Setting        | Value                |
| -------------- | -------------------- |
| Resource Type  | Variable             |
| Data Type      | Currency             |
| Decimal Places | 2                    |
| API Name       | varCalculatedPremium |

The Apex action returns the calculated premium to this variable.

---

# 5. Update Policy with Premium

After the Apex Action, add:

**Update Records**

Label:

```text
Update Policy With Premium
```

Find the Policy using:

```text
Record ID = varPolicyId
```

Then update:

```text
Premium = varCalculatedPremium
```

### Final Auto Quoting Flow

```text
START
  ↓
Enter Policy Details
  ↓
Create Draft Policy
  ↓
Calculate Premium Action
  ↓
Update Policy With Premium
  ↓
END
```

---

# 6. Create Claim Record-Triggered Flow

Create a **Record-Triggered Flow** on the Claim object.

Use:

```text
After Save
```

The flow automatically runs when a Claim is created or updated.

### Purpose

The flow helps route claims based on business conditions such as:

* Claim amount
* Claim type
* Policy type
* Claim status
* Territory or state

### Basic Flow

```text
Claim Created/Updated
        ↓
Check Claim Information
        ↓
Determine Claim Routing
        ↓
Assign Claim
        ↓
Update Claim
```

---

# ✅ Milestone 2 Result

Milestone 2 provides:

* Apex premium calculation
* Automatic policy premium update
* Claim automation
* Claim routing

---

# 🚀 MILESTONE 3 — Claims Adjuster LWC Dashboard Development

Milestone 3 creates the user interface for Claims Adjusters.

---

# 1. Create ClaimsAdjusterController

Create an Apex class:

```text
ClaimsAdjusterController
```

Purpose:

Retrieve claims assigned to the logged-in Claims Adjuster.

The class uses **SOQL** to retrieve:

* Claim information
* Policy information
* Customer information

---

# 2. Create Wrapper Class

The Apex class should contain a Wrapper Class.

The Wrapper Class combines the required information into one response for the LWC.

Example:

```text
Claim
 +
Policy
 +
Customer
 +
Key Metrics
       ↓
Wrapper Class
```

---

# 3. Query Claims Using SOQL

The controller should retrieve Claims owned by the logged-in user.

The query should also retrieve related Policy and Customer information.

The purpose is to provide all required information to the dashboard without making unnecessary queries.

---

# 4. Create claimsDashboardLwc

Create a Lightning Web Component:

```text
claimsDashboardLwc
```

Purpose:

Display the Claims Adjuster's assigned claims.

The component should:

* Call Apex
* Use `@wire`
* Display claim information
* Display key metrics
* Filter claims on the client side

---

# 5. Create Claim Dashboard

The dashboard can display:

```text
+------------------------------------------------+
|          CLAIMS ADJUSTER DASHBOARD             |
+------------------------------------------------+
| Total Claims | Pending | Approved | Rejected   |
+------------------------------------------------+
| Search / Filter                                |
+------------------------------------------------+
| Claim 001 | Auto     | ₹50,000 | Pending      |
| Claim 002 | Property | ₹80,000 | Approved     |
| Claim 003 | Auto     | ₹25,000 | Review       |
+------------------------------------------------+
```

---

# 6. Implement Client-Side Filtering

Add filtering options such as:

* Claim Status
* Claim Type
* Claim Amount
* Policy Type
* Search by Claim Number

The filtering is performed on the data already received by the component.

---

# 7. Create claimTileLwc

Create another reusable LWC:

```text
claimTileLwc
```

Purpose:

Display one Claim at a time.

Example:

```text
+---------------------------+
| Claim: CLM-001            |
| Customer: John            |
| Policy: Auto              |
| Amount: ₹50,000           |
| Status: Pending           |
| Approval: Pending         |
+---------------------------+
```

---

# 8. Use claimTileLwc in Dashboard

The main dashboard uses the reusable Claim Tile component.

```text
claimsDashboardLwc
        |
        ├── claimTileLwc
        ├── claimTileLwc
        ├── claimTileLwc
        └── claimTileLwc
```

---

# ✅ Milestone 3 Result

At the end of Milestone 3:

* Claims Adjusters can see their claims.
* Related Policy information is displayed.
* Related Customer information is displayed.
* Claims can be filtered.
* Key claim metrics are displayed.
* Reusable LWC components are used.

---

# 🚀 MILESTONE 4 — Advanced Claim Processing, Security & Code Setup

Milestone 4 focuses on approval, security, testing and user access.

---

# 1. Add Approval Status Field

Modify the Claim object.

Create:

```text
Approval Status
```

Example values:

```text
Pending
Approved
Rejected
```

This field tracks the approval state of a claim.

---

# 2. Create Claim Approval Process

Configure an Approval Process for Claims.

The approval process contains **two sequential approval steps**.

### Step 1

Claim goes to:

```text
Senior Adjuster
```

### Step 2

After the Senior Adjuster approval:

```text
Department Manager
```

### Approval Flow

```text
Claim Submitted
       ↓
Senior Adjuster
       ↓
Department Manager
       ↓
Approved / Rejected
```

---

# 3. Create High-Value Claim Record-Triggered Flow

Create a **Record-Triggered Flow** on the Claim object.

Configure it to run:

```text
After Save
```

The Flow checks:

```text
Claim Amount > $50,000
```

If the condition is true:

```text
Claim
 ↓
Claim Amount > $50,000
 ↓
Submit for Approval
```

This automatically sends high-value claims into the approval process.

---

# 4. Create Approver Screen Flow

Create a Screen Flow that allows approvers to quickly review Claim information.

The Screen Flow can display:

* Claim Number
* Customer
* Policy
* Claim Amount
* Claim Type
* Claim Description
* Current Status
* Approval Status

The approver can select:

```text
Approve
```

or

```text
Reject
```

and enter comments.

### Screen Flow

```text
START
  ↓
Get Claim
  ↓
Display Claim Details
  ↓
Select Approve / Reject
  ↓
Enter Comments
  ↓
Update Claim / Process Decision
  ↓
END
```

The Screen Flow can be placed on the Claim Lightning Record Page so it can be accessed directly from a Claim record.

---

# 5. Create Apex Test Class

Create an Apex Test Class for:

```text
ClaimsAdjusterController
```

The test class should verify:

* Claim data retrieval
* Policy relationship
* Customer relationship
* Logged-in user claims
* Wrapper Class
* Claim filtering
* Different claim statuses
* Different claim amounts
* Different policy types
* Positive test cases
* Negative test cases

The project target is:

```text
95%+ Apex Code Coverage
```

---

# 6. Test Complex Claim Filtering

Create test data for multiple Claims.

Example:

```text
Claim 1 → Auto → Pending
Claim 2 → Auto → Approved
Claim 3 → Property → Pending
Claim 4 → Life → Rejected
```

Test whether the controller correctly retrieves and processes the required claims.

---

# 7. Test Data Retrieval

The test class should verify that:

```text
Claim
  ↓
Policy
  ↓
Customer
```

related information is correctly retrieved.

Also test the behavior when:

* No claims are available
* Multiple claims exist
* Claims have different statuses
* Claims have different owners

---

# 8. Configure Sharing Rules

Configure Salesforce sharing so Claims Adjusters only see Claims assigned to their appropriate territory or state.

Example:

```text
Territory: Tamil Nadu
        ↓
Tamil Nadu Adjusters
        ↓
Tamil Nadu Claims
```

Another territory should not automatically expose its claims to the adjuster.

Sharing configuration can use:

* Organization-Wide Defaults
* Role Hierarchy
* Sharing Rules
* Permission Sets
* Field-Level Security

---

# 9. Configure Permission Sets

Create separate Permission Sets for different user roles.

## Agent Permission Set

Agents should mainly have access to:

* Policy quoting
* Policy information
* Auto quoting flow
* Required policy data

Agents should not have full Claims Adjuster permissions.

---

## Adjuster Permission Set

Adjusters should have access to:

* Claims
* Claim records
* Claim dashboard
* Claim review
* Claim processing

---

## Manager Permission Set

Managers should have access to:

* Reports
* Dashboards
* Claim approvals
* Policy and claim reporting
* Management information





