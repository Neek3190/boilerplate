// Model which will be required by the api to pass data from app to api with the params requireed to be add in form data or as query params.

class ContactRequestModel {
  String userId, location, phone, fullName, email, subject, city, message;

  ContactRequestModel({
    required this.userId,
    required this.location,
    required this.phone,
    required this.fullName,
    required this.email,
    required this.subject,
    required this.city,
    required this.message,
  });
}
