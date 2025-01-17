import 'package:carrent/features/auth/data/model/auth_hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  // Initialize Hive database and register adapters
  Future<void> init() async {
    // Get the application documents directory for persistent storage
    var directory = await getApplicationDocumentsDirectory();
    var path = '${directory.path}/db_car_rental_system.db';
    Hive.init(path);

    // Register the UserModel adapter with Hive
    Hive.registerAdapter(AuthHiveModelAdapter());
  }

  // Save a new User during signup
  Future<void> signupUser(AuthHiveModel user) async {
    var box = await Hive.openBox<AuthHiveModel>('userBox');
    // Check if the username already exists before saving
    if (box.containsKey(user.username)) {
      throw Exception("Username already exists");
    }
    await box.put(user.username, user);
  }

  // Get User for login
  Future<AuthHiveModel?> loginUser(String username, String password) async {
    var box = await Hive.openBox<AuthHiveModel>('userBox');
    var user = box.get(username);

    // Check if the user exists and the password matches
    if (user != null && user.password == password) {
      return user;
    } else {
      // Return null or handle invalid login
      return null;
    }
  }

  // Clear all User data from the box (for logout or data reset)
  Future<void> clearAll() async {
    var box = await Hive.openBox<AuthHiveModel>('userBox');
    await box.clear();
  }

  // Close Hive box to release resources
  Future<void> close() async {
    await Hive.close();
  }

  // Get the Box instance for a specific type (AuthHiveModel)
  Future<Box<AuthHiveModel>> getBox() async {
    return await Hive.openBox<AuthHiveModel>('userBox');
  }
}
