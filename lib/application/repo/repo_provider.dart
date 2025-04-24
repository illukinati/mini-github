import 'package:mini_github/application/code/core_provider.dart';
import 'package:mini_github/application/repo/repo_state.dart';
import 'package:mini_github/application/repo/repo_use_case.dart';
import 'package:riverpod/riverpod.dart';

class RepoNotifier extends StateNotifier<RepoState> {
  GetUserReposUseCase getUserRepos;
  RepoNotifier({required this.getUserRepos}) : super(RepoState.initial());

  Future<void> getRepos(String username) async {
    state = RepoState.loading();
    try {
      final result = await getUserRepos.execute(username);
      result.fold((l) => state = RepoState.error(l.message), (r) {
        if (r.isEmpty) {
          state = RepoState.repoNotFound();
        } else {
          state = RepoState.reposFound(r);
        }
      });
    } catch (e) {
      state = RepoState.error(e.toString());
    }
  }
}

final getUserReposUseCaseProvider = Provider<GetUserReposUseCase>((ref) {
  return GetUserReposUseCase(ref.watch(githubRepositoryProvider));
});

final repoNotifierProvider = StateNotifierProvider<RepoNotifier, RepoState>((
  ref,
) {
  return RepoNotifier(getUserRepos: ref.watch(getUserReposUseCaseProvider));
});
