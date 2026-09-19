class UserEntity {

  UserEntity({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.role,
    this.photo,
    required this.firebaseUid,
  });

  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String role;
  final String? photo;
  final String firebaseUid;

  String get fullName => '$firstName $lastName'.trim();
  bool get isAdmin => role == 'SUPER_ADMIN';
}