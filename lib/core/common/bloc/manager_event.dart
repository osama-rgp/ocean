part of 'manager_bloc.dart';

abstract class ManagerEvent extends Equatable {
  const ManagerEvent();
}

class InitialEvent extends ManagerEvent {
  @override
  List<Object> get props => [];
}

class SetTokenAndUserId extends ManagerEvent {
  final String token;
  final String userId;

  const SetTokenAndUserId({
    required this.token,
    required this.userId,
  });

  @override
  List<Object> get props => [token, userId];
}

class LogoutEvent extends ManagerEvent {
  const LogoutEvent();

  @override
  List<Object> get props => [];
}
