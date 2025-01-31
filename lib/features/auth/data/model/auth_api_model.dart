import 'package:car_rent/features/auth/domain/entity/auth_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'auth_api_model.g.dart'; // Ensure this part directive exists

@JsonSerializable()
class AuthApiModel extends Equatable {
  @JsonKey(name: "_id")
  final String? id;
  final String email;
  final String? image;
  final String username;
  final String? password;

  const AuthApiModel({
    this.id,
    required this.email,
    this.image,
    required this.username,
    required this.password,
  });

  // auto generates the json values (From Json)
  factory AuthApiModel.fromJson(Map<String, dynamic> json) =>
      _$AuthApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthApiModelToJson(this);

  // To Entity
  AuthEntity toEntity() {
    return AuthEntity(
      userId: id,
      email: email,
      image: image,
      username: username,
      password: password ?? '',
    );
  }

  // From Entity
  factory AuthApiModel.fromEntity(AuthEntity entity) {
    return AuthApiModel(
      email: entity.email,
      image: entity.image,
      username: entity.username,
      password: entity.password,
    );
  }

  @override
  List<Object?> get props => [id, email, image, username, password];
}
