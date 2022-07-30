import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignuoBloc extends Bloc<SignupEvent, SignuoState> {
  SignuoBloc() : super(SignuoInitial()) {
    on<SignupEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
