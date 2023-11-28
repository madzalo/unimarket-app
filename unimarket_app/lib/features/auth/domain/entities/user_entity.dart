import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? id;
  final String? token;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final String? roles;

  const UserEntity(
      {this.id,
      this.token,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.roles});

  @override
  List<Object?> get props {
    return [id, token, firstName, lastName, email, password, roles];
  }
}
