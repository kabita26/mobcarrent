class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  static const String baseUrl = "http://10.0.2.2:3001/";
  // static const String baseUrl = "http://localhost:3000/api/v1/";
//==============Auth Routes=================
  static const String login = "/login";
  static const String register = "/register";
  static const String getAllUsers = "/getAllUsers";
  static const String updateUser = "/updateUser";
  static const String deleteUser = "/deleteUser";
  static const String imageUrl = "http://10.0.2.2:3000/uploads/";

  static const String uploadImage = "auth/uploadImage";
  

}
