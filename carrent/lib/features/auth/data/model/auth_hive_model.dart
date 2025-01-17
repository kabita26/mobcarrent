import 'package:carrent/app/constants/hive_table_constant.dart';
import 'package:carrent/features/auth/domain/entity/auth_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
part 'auth_hive_model.g.dart'; 

@HiveType(typeId: HiveTableConstant.studentTableId)
class AuthHiveModel extends Equatable {
  @HiveField(0)
  final String? userId;  // Change studentId to userId
  @HiveField(1)
  final String fName;
  @HiveField(2)
  final String lName;
  @HiveField(3)
  final String? image;
  @HiveField(4)
  final String phone;
  @HiveField(5)
  final String username;
  @HiveField(6)
  final String password;

  AuthHiveModel({
    String? userId,  // Change studentId to userId in the constructor
    required this.fName,
    required this.lName,
    this.image,
    required this.phone,
    required this.username,
    required this.password,
  }) : userId = userId ?? const Uuid().v4();  // Initialize userId with UUID if not provided

  // Initial Constructor
  const AuthHiveModel.initial()
      : userId = '',  // Change studentId to userId
        fName = '',
        lName = '',
        image = '',
        phone = '',
        username = '',
        password = '';

  // From Entity
  factory AuthHiveModel.fromEntity(AuthEntity entity) {
    return AuthHiveModel(
      userId: entity.userId,  // Change studentId to userId
      fName: entity.fName,
      lName: entity.lName,
      image: entity.image,
      phone: entity.phone,
      username: entity.username,
      password: entity.password,
    );
  }

  // To Entity
  AuthEntity toEntity() {
    return AuthEntity(
      userId: userId, 
      fName: fName,
      lName: lName,
      image: image,
      phone: phone,
      username: username,
      password: password,
    );
  }

  @override
  List<Object?> get props =>
      [userId, fName, lName, image, username, password];  
}
