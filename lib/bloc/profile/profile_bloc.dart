import 'dart:async';
import 'package:e_learning_app/bloc/auth/auth_bloc.dart';
import 'package:e_learning_app/bloc/auth/auth_state.dart';
import 'package:e_learning_app/bloc/profile/profile_event.dart';
import 'package:e_learning_app/bloc/profile/profile_state.dart';
import 'package:e_learning_app/models/profile_model.dart';
import 'package:e_learning_app/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final AuthBloc _authBloc;
  final AuthRepository _authRepository;
  late final StreamSubscription<AuthState> _authSubscription;

  ProfileBloc({required AuthBloc authBloc, AuthRepository? authRepository})
    : _authBloc = authBloc,
      _authRepository = authRepository ?? AuthRepository(),
      super(const ProfileState()) {
    on<LoadProfile>(_onLoadProfile);
    on<UpdateProfileRequested>(_onUpdateProfileRequested);
    on<UpdateProfilePhotoRequested>(_onUpdateProfilePhotoRequested);

    _authSubscription = _authBloc.stream.listen((authState) {
      if (authState.userModel != null) {
        add(LoadProfile());
      }
    });

    if(_authBloc.state.userModel != null){
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
      );

      if (state.profile != null) {
        final updatedProfile = state.profile!.copyWith(
          fullName: event.fullName,
          photoUrl: event.photoUrl,
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

    try{
      emit(state.copywith(isLoading: true));
    } catch (e){}
  }

  @override
  Future<void> close() {
    _authSubscription.cancel();
    return super.close();
  }
}
