class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);

  // ✅ Correct base URL for Android Emulator (10.0.2.2)
  static const String baseUrl = "http://10.0.2.2:3001/";

  // ============ Auth Routes =============
  static const String login = "/login";
  static const String register = "/register";
  static const String getAllUsers = "/getAllUsers";
  static const String updateUser = "/updateUser";
  static const String deleteUser = "/deleteUser";
  static const String uploadImage = "auth/uploadImage";
  static const String imageUrl = "http://10.0.2.2:3000/uploads/";

  // ============ Car Routes =============
  static const String carListings = "/carlisting";
  static const String searchCars = "/cars/search";
  static const String bookCar = "/cars/book";
  static const String processPayment = "/payment/checkout";

  // ============ Wishlist Routes (✅ New) =============
static const String getWishlist = "$baseUrl/";
  static const String addWishlist = "$baseUrl/add";
  static const String removeWishlist = "$baseUrl/remove/";
 
  static const String getAllBookings = "$baseUrl/checkout/all";
  static const String createBooking = "$baseUrl/checkout";
  static const String updateBooking = "$baseUrl/checkout";
  static const String deleteBooking = "$baseUrl/checkout";

}