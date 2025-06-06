import 'package:equatable/equatable.dart';

class ProfileModel extends Equatable {
  final String fullName;
  final String email;
  final String? phoneNumber;
  final String? photoUrl;
  final String? bio;
  final ProfileStats stats;

  const ProfileModel({
    required this.fullName,
    required this.email,
    this.phoneNumber,
    this.photoUrl,
    this.bio,
    required this.stats,
  });

  ProfileModel copyWith({
    String? fullName,
    String? email,
    String? phoneNumber,
    String? photoUrl,
    String? bio,
    ProfileStats? stats,
  }) {
    return ProfileModel(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      photoUrl: photoUrl ?? this.photoUrl,
      bio: bio ?? this.bio,
      stats: stats ?? this.stats,
    );
  }

  List<Object> get props => [
    fullName,
    email,
    phoneNumber ?? '',
    photoUrl ?? '',
    bio ?? '',
    stats,
  ];
}

class ProfileStats extends Equatable {
  final int coursesCount;
  final int hoursSpent;
  final double successRate;

  const ProfileStats({
    required this.coursesCount,
    required this.hoursSpent,
    required this.successRate,
  });

  @override
  List<Object?> get props => [
    coursesCount,
    hoursSpent,
    successRate,
  ];
}
