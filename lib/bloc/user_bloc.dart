import 'package:bloc/bloc.dart';

import 'package:login/Models/user_stat.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitial()) {
    on<initEvent>((event, emit) => emit(SetState(event.user)));
  }
}
