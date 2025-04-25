import 'package:mini_github/application/code/core_provider.dart';
import 'package:mini_github/application/user/user_state.dart';
import 'package:mini_github/application/user/user_use_case.dart';
import 'package:riverpod/riverpod.dart';

class UserNotifier extends StateNotifier<UserState> {
  final GetAllUsersUseCase getAllUsersUseCase;
  final GetUserDetailUseCase getUserDetailUseCase;
  final SearchUsersUseCase searchUsersUseCase;
  UserNotifier({
    required this.getAllUsersUseCase,
    required this.getUserDetailUseCase,
    required this.searchUsersUseCase,
  }) : super(const UserState.initial());

  Future<void> getAllUsers() async {
    state = UserState.loading();
    try {
      final result = await getAllUsersUseCase.execute();
      result.fold((l) => state = UserState.error(l.message), (r) {
        if (r.isEmpty) {
          state = UserState.userNotFound();
        } else {
          state = UserState.usersFound(r);
        }
      });
    } catch (e) {
      state = UserState.error(e.toString());
    }
  }

  Future<void> getUserDetail(String username) async {
    state = UserState.loading();
    try {
      final result = await getUserDetailUseCase.execute(username);
      result.fold(
        (l) => state = UserState.error(l.message),
        (r) => state = UserState.userFound(r),
      );
    } catch (e) {
      state = UserState.error(e.toString());
    }
  }

  Future<void> searchUsers(String query) async {
    state = UserState.loading();
    try {
      final result = await searchUsersUseCase.execute(query);
      result.fold((l) => state = UserState.error(l.message), (r) {
        if (r.isEmpty) {
          state = UserState.userNotFound();
        } else {
          state = UserState.usersFound(r);
        }
      });
    } catch (e) {
      state = UserState.error(e.toString());
    }
  }
}

final getAllUsersUseCaseProvider = Provider<GetAllUsersUseCase>((ref) {
  return GetAllUsersUseCase(ref.watch(githubRepositoryProvider));
});

final getUserUseCaseProvider = Provider<GetUserDetailUseCase>((ref) {
  return GetUserDetailUseCase(ref.watch(githubRepositoryProvider));
});

final searchUsersUseCaseProvider = Provider<SearchUsersUseCase>((ref) {
  return SearchUsersUseCase(ref.watch(githubRepositoryProvider));
});

final userNotifierProvider = StateNotifierProvider<UserNotifier, UserState>((
  ref,
) {
  return UserNotifier(
    getAllUsersUseCase: ref.watch(getAllUsersUseCaseProvider),
    getUserDetailUseCase: ref.watch(getUserUseCaseProvider),
    searchUsersUseCase: ref.watch(searchUsersUseCaseProvider),
  );
});

final userSortProvider = StateProvider<SortMode>((ref) => SortMode.none);

enum SortMode { none, ascending, descending }
