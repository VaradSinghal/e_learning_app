import 'dart:async';
import 'package:e_learning_app/bloc/auth/auth_bloc.dart';
import 'package:e_learning_app/bloc/auth/auth_state.dart';
import 'package:e_learning_app/bloc/profile/profile_event.dart';
import 'package:e_learning_app/bloc/profile/profile_state.dart';
import 'package:e_learning_app/models/profile_model.dart';
import 'package:e_learning_app/repositories/auth_repository.dart';
import 'package:e_learning_app/services/cloudinary_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final AuthBloc _authBloc;
  final AuthRepository _authRepository;
  late final StreamSubscription<AuthState> _authSubscription;
  final CloudinaryService _cloudinaryService;

  ProfileBloc({
    required AuthBloc authBloc,
    AuthRepository? authRepository,
    CloudinaryService? cloudinaryService,
  }) : _authBloc = authBloc,
       _authRepository = authRepository ?? AuthRepository(),
       _cloudinaryService = cloudinaryService ?? CloudinaryService(),
       super(const ProfileState()) {
    on<LoadProfile>(_onLoadProfile);
    on<UpdateProfileRequested>(_onUpdateProfileRequested);
    on<UpdateProfilePhotoRequested>(_onUpdateProfilePhotoRequested);

    _authSubscription = _authBloc.stream.listen((authState) {
      if (authState.userModel != null) {
        add(LoadProfile());
      }
    });

    if (_authBloc.state.userModel != null) {
      add(LoadProfile());
    }
  }

  Future _onLoadProfile(LoadProfile event, Emitter<ProfileState> emit) async {
    try {
      emit(state.copywith(isLoading: true));
      final userModel = _authBloc.state.userModel;

      if (userModel != null) {
        final profile = ProfileModel(
          fullName: userModel.fullName ?? '',
          email: userModel.email,
          photoUrl: userModel.photoUrl,
          phoneNumber: userModel.phoneNumber,
          bio: userModel.bio,
          stats: const ProfileStats(
            coursesCount: 0,
            hoursSpent: 0,
            successRate: 0,
          ),
        );
        emit(state.copywith(isLoading: false, profile: profile));
      }
    } catch (e) {
      emit(state.copywith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> _onUpdateProfileRequested(
    UpdateProfileRequested event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      emit(state.copywith(isLoading: true));

      await _authRepository.updateProfile(
        fullName: event.fullName,
        photoUrl: event.photoUrl,
        phoneNumber: event.phoneNumber,
        bio: event.bio,
      );

      if (state.profile != null) {
        final updatedProfile = state.profile!.copyWith(
          fullName: event.fullName,
          photoUrl: event.photoUrl,
          phoneNumber: event.phoneNumber,
          bio: event.bio,
        );
        emit(state.copywith(isLoading: false, profile: updatedProfile));
      }
    } catch (e) {
      emit(state.copywith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> _onUpdateProfilePhotoRequested(
    UpdateProfilePhotoRequested event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      emit(state.copywith(isLoading: true));

      if (event.photoPath == null) {
        throw Exception('Photo path cannot be null');
      }
      final photoUrl = await _cloudinaryService.uploadImage(event.photoPath!, 'profile_pictures');

      add(UpdateProfileRequested(photoUrl: photoUrl));
      emit(state.copywith(isPhotoUploading: false));
    } catch (e) {
      emit(state.copywith(isPhotoUploading: false, error: e.toString()));
    }
  }

  @override
  Future<void> close() {
    _authSubscription.cancel();
    return super.close();
  }
}
