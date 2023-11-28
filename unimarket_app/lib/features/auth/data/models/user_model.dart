import 'package:unimarket_app/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    final String? id,
    final String? token,
    final String? firstName,
    final String? lastName,
    final String? email,
    final String? password,
    final String? roles,
  }) : super(
            id: id,
            token: token,
            firstName: firstName,
            lastName: lastName,
            email: email,
            password: password,
            roles: roles);

  factory UserModel.fromJson(Map<dynamic, dynamic> map) {
    return UserModel(
      id: map['_id'] ?? "",
      token: map['token'] ?? "",
      firstName: map['firstName'] ?? "",
      lastName: map['lastName'] ?? "",
      email: map['email'] ?? "",
      password: map['password'] ?? "",
      roles: map['roles'] ?? "",
    );
  }

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
        id: entity.id,
        token: entity.token,
        firstName: entity.firstName,
        lastName: entity.lastName,
        email: entity.email,
        password: entity.password,
        roles: entity.roles);
  }
}
