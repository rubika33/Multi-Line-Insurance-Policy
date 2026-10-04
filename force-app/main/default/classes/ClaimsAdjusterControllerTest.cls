@IsTest
public class ClaimsAdjusterControllerTest {

    @IsTest
    static void testClaimsDashboard() {
        Account customer = new Account(Name = 'Test Customer');
        insert customer;

        Policy__c policy = new Policy__c(
            Policy_Type__c = 'Vehicle'
        );
        insert policy;

        Claim__c claim = new Claim__c(
            Customer__c = customer.Id,
            Policy__c = policy.Id,
            Adjuster__c = UserInfo.getUserId(),
            Claim_Amount__c = 75000,
            Severity__c = 'High',
            Status__c = 'Under Review',
            Approval_Status__c = 'Not Submitted'
        );
        insert claim;

        Test.startTest();
        ClaimsAdjusterController.DashboardWrapper result =
            ClaimsAdjusterController.getClaimsDashboard();
        Test.stopTest();

        System.assertEquals(1, result.totalClaims);
        System.assertEquals(1, result.pendingClaims);
        System.assertEquals(1, result.highPriorityClaims);
        System.assertEquals(75000, result.totalClaimAmount);
        System.assertEquals(1, result.claims.size());
    }
}
