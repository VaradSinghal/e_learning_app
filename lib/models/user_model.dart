import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String email;
  final String? fullName;
  final String? photoUrl;
  final String? phoneNumber;
  final String? bio;
  final DateTime createdAt;
  final DateTime? lastLoginAt;
  final UserRole role;

  UserModel({
    required this.uid,
    required this.email,
    this.fullName,
    this.photoUrl,
    this.phoneNumber,
    this.bio,
    required this.createdAt,
    required this.lastLoginAt,
    required this.role,
  });

  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserModel(
      uid: doc.id,
      email: data['email'] ?? '',
      fullName: data['fullName'],
      photoUrl: data['photoUrl'],
      phoneNumber: data['phoneNumber'],
      bio: data['bio'],
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      lastLoginAt: (data['lastLoginAt'] as Timestamp?)?.toDate(),
      role: UserRole.values.firstWhere(
        (e) => e.name == data['role'],
        orElse: () => UserRole.student,
      ),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'email': email,
      'fullName': fullName,
      'photoUrl': photoUrl,
      'phoneNumber': phoneNumber,
      'bio': bio,
      'createdAt': Timestamp.fromDate(createdAt),
      'lastLoginAt': Timestamp.fromDate(lastLoginAt!),
      'role': role.name,
    };
  }
}

enum UserRole { student, teacher }
