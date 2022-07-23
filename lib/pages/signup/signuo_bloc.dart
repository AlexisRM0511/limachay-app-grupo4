import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'signuo_event.dart';
part 'signuo_state.dart';

class SignuoBloc extends Bloc<SignuoEvent, SignuoState> {
  SignuoBloc() : super(SignuoInitial()) {
    on<SignuoEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
