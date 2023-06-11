part of 'manager_bloc.dart';

class ManagerState extends Equatable {
  final String? accessToken;
  final String? userId;

  const ManagerState({this.accessToken, this.userId});

  ManagerState copyWith({
    String? accessToken,
    String? userId,
    bool reset = false,
  }) {
    return ManagerState(
      accessToken: reset ? null : accessToken ?? this.accessToken,
      userId: reset ? null : userId ?? this.userId,
    );
  }

  @override
  List<Object?> get props => [accessToken, userId];
}
