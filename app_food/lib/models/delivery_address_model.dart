class DeliveryAddressModel {
  String firstName;
  String lastName;
  String mobileNo;
  String scoiety;
  String street;
  String city;
  String pinCode;
  String addressType;

  DeliveryAddressModel({
    required this.addressType,
    required this.city,
    required this.firstName,
    required this.lastName,
    required this.mobileNo,
    required this.pinCode,
    required this.street,
    required this.scoiety,
  });
}