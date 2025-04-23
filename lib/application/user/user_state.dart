import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mini_github/domain/entities/user_entity.dart';

part 'user_state.freezed.dart';

@freezed
sealed class UserState with _$UserState {
  const factory UserState.initial() = Initial;
  const factory UserState.loading() = Loading;
  const factory UserState.userFound(UserEntity user) = UserFound;
  const factory UserState.usersFound(List<UserEntity> users) = UsersFound;
  const factory UserState.userNotFound() = UserNotFound;
  const factory UserState.error(String message) = Error;
}
