import 'package:mini_github/application/code/core_provider.dart';
import 'package:mini_github/application/user/user_use_case.dart';
import 'package:riverpod/riverpod.dart';

final getAllUsersUseCaseProvider = Provider<GetAllUsersUseCase>((ref) {
  return GetAllUsersUseCase(ref.watch(githubRepositoryProvider));
});

final getUserUseCaseProvider = Provider<GetUserDetailUseCase>((ref) {
  return GetUserDetailUseCase(ref.watch(githubRepositoryProvider));
});

final searchUsersUseCaseProvider = Provider<SearchUsersUseCase>((ref) {
  return SearchUsersUseCase(ref.watch(githubRepositoryProvider));
});
