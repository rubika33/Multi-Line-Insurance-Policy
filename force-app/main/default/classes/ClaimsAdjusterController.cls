public with sharing class ClaimsAdjusterController {

    public class ClaimWrapper {
        @AuraEnabled public Id claimId;
        @AuraEnabled public String claimNumber;
        @AuraEnabled public String customerName;
        @AuraEnabled public String policyNumber;
        @AuraEnabled public String policyType;
        @AuraEnabled public Decimal claimAmount;
        @AuraEnabled public String severity;
        @AuraEnabled public String status;
        @AuraEnabled public String approvalStatus;

        public ClaimWrapper(Claim__c claim) {
            claimId = claim.Id;
            claimNumber = claim.Name;
            customerName = claim.Customer__r != null ? claim.Customer__r.Name : null;
            policyNumber = claim.Policy__r != null ? claim.Policy__r.Name : null;
            policyType = claim.Policy__r != null ? claim.Policy__r.Policy_Type__c : null;
            claimAmount = claim.Claim_Amount__c;
            severity = claim.Severity__c;
            status = claim.Status__c;
            approvalStatus = claim.Approval_Status__c;
        }
    }

    public class DashboardWrapper {
        @AuraEnabled public Integer totalClaims;
        @AuraEnabled public Integer pendingClaims;
        @AuraEnabled public Integer highPriorityClaims;
        @AuraEnabled public Decimal totalClaimAmount;
        @AuraEnabled public List<ClaimWrapper> claims;

        public DashboardWrapper() {
            totalClaims = 0;
            pendingClaims = 0;
            highPriorityClaims = 0;
            totalClaimAmount = 0;
            claims = new List<ClaimWrapper>();
        }
    }

    @AuraEnabled(cacheable=true)
    public static DashboardWrapper getClaimsDashboard() {
        DashboardWrapper result = new DashboardWrapper();
        Id currentUserId = UserInfo.getUserId();

        List<Claim__c> claimList = [
            SELECT Id, Name, Claim_Amount__c, Severity__c, Status__c,
                   Approval_Status__c, Customer__r.Name,
                   Policy__r.Name, Policy__r.Policy_Type__c
            FROM Claim__c
            WHERE Adjuster__c = :currentUserId
            ORDER BY CreatedDate DESC
        ];

        result.totalClaims = claimList.size();

        for (Claim__c claim : claimList) {
            result.claims.add(new ClaimWrapper(claim));

            if (claim.Status__c == 'Under Review') {
                result.pendingClaims++;
            }

            if (claim.Severity__c == 'High' || claim.Severity__c == 'Critical') {
                result.highPriorityClaims++;
            }

            if (claim.Claim_Amount__c != null) {
                result.totalClaimAmount += claim.Claim_Amount__c;
            }
        }

        return result;
    }
}
