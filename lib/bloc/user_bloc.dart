import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../Models/models.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<initEvent>((event, emit) => emit(SetState(event.user)));

    on<emailEvent>(
      (event, emit) => emit(SetState(state.user!.copyWith(email: event.email))),
    );

    on<passwordEvent>(
      (event, emit) =>
          emit(SetState(state.user!.copyWith(password: event.password))),
    );
  }
}
