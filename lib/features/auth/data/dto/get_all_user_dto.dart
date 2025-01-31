import 'package:car_rent/features/auth/data/model/auth_api_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_all_user_dto.g.dart';

@JsonSerializable()
class GetAllUserDto {
  final bool success;
  final int count;
  final List<AuthApiModel> data;

  GetAllUserDto({
    required this.success,
    required this.count,
    required this.data,
  });

  Map<String, dynamic> toJson() => _$GetAllUserDtoToJson(this);

  factory GetAllUserDto.fromJson(Map<String, dynamic> json) =>
      _$GetAllUserDtoFromJson(json);
}
