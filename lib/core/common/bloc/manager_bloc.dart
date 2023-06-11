import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../managers/constant/cash_keys_constant.dart';

part 'manager_event.dart';

part 'manager_state.dart';

class ManagerBloc extends Bloc<ManagerEvent, ManagerState> {
  ManagerBloc() : super(const ManagerState()) {
    on<ManagerEvent>((event, emit) async {
      switch (event.runtimeType) {
        case LogoutEvent:
          logout(event, emit);
          break;
        case SetTokenAndUserId:
          await setIdAndTokenId(event, emit);
          break;
        case InitialEvent:
          await initial(event, emit);
          break;
      }
    });
  }

  initial(ManagerEvent event, Emitter<ManagerState> emit) async {
    event as InitialEvent;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final token = sharedPreferences.getString(CashKeys.token);
    final userId = sharedPreferences.getString(CashKeys.userId);
    emit(state.copyWith(accessToken: token, userId: userId));
  }

  Future<void> setIdAndTokenId(
      ManagerEvent event, Emitter<ManagerState> emit) async {
    event as SetTokenAndUserId;
    emit(state.copyWith(
      userId: event.userId,
      accessToken: event.token,
    ));
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(CashKeys.token, event.token);
    await sharedPreferences.setString(CashKeys.userId, event.userId);
  }

  Future<void> logout(ManagerEvent event, Emitter<ManagerState> emit) async {
    emit(state.copyWith(reset: true));
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    await sharedPreferences.remove(CashKeys.token);
    await sharedPreferences.remove(CashKeys.userId);
  }
}
