import 'package:objectbox/objectbox.dart';

@Entity()
class UserAuthOB {
  @Id()
  int obxId;

  @Unique()
  int id;
  String email;
  String firstName;
  String lastName;
  String role;
  String? photo;
  @Unique()
  String firebaseUid;
  @Property(type: PropertyType.date)
  DateTime lastUpdated;

  UserAuthOB({
    this.obxId = 0,
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.role,
    this.photo,
    required this.firebaseUid,
    required this.lastUpdated,
  });
}