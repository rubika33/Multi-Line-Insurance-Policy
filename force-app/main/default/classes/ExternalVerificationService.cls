public class ExternalVerificationService {

    public class VehicleResponse {
        public String vin;
        public String model;
        public Integer year;
        public Boolean verified;
    }

    public static VehicleResponse verifyVehicle(String vin) {
        VehicleResponse response = new VehicleResponse();
        response.vin = vin;
        response.model = 'Honda City';
        response.year = 2024;
        response.verified = true;
        return response;
    }
}
