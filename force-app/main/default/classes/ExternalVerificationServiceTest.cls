@IsTest
public class ExternalVerificationServiceTest {

    @IsTest
    static void testVehicleVerification() {
        Test.startTest();
        ExternalVerificationService.VehicleResponse result =
            ExternalVerificationService.verifyVehicle('VIN123456');
        Test.stopTest();

        System.assertEquals('VIN123456', result.vin);
        System.assertEquals('Honda City', result.model);
        System.assertEquals(2024, result.year);
        System.assertEquals(true, result.verified);
    }
}
