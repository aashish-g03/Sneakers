import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class Users {
  String id;
  String fullName;
  String email;
  String password;
  String phoneNumber;
  @JsonKey(name: 'profilePicPath', defaultValue: '')
  String profilePicture = '';
  Users({
    required this.id,
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    required this.password,
  });

  factory Users.fromJson(Map<String, dynamic> json) => _UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
