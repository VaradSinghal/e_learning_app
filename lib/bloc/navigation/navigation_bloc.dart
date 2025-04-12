import 'package:e_learning_app/bloc/navigation/navigation_event.dart';
import 'package:e_learning_app/bloc/navigation/navigation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationBloc extends Bloc<NavigationEvent,NavigationState>{
  NavigationBloc() : super(NavigationState(0)) {
    on<NavigateToTab>((event, emit) {
      emit(NavigationState(event.index));
    });
  }
}