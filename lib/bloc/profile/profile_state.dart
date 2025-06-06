import 'package:e_learning_app/models/profile_model.dart';
import 'package:equatable/equatable.dart';

class ProfileState extends Equatable {
  final ProfileModel? profile;
  final bool isLoading;
  final String? error;
  final bool isPhotoUploading;


  const ProfileState({
    this.profile,
    this.isLoading = false,
    this.error,
    this.isPhotoUploading = false,
  });

  ProfileState copywith({
     
  ProfileModel? profile,
   bool? isLoading,
   String? error,
   bool? isPhotoUploading,
  }){
    return ProfileState(
      profile: profile ?? this.profile,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      isPhotoUploading: isPhotoUploading ?? this.isPhotoUploading,
    );
  }

  @override
  List<Object?> get props => [
        profile,
        isLoading,
        error,
        isPhotoUploading,
      ];
}
