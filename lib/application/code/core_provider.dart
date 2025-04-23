import 'package:mini_github/domain/repositories/github_repository.dart';
import 'package:mini_github/infrastructure/data_sources/github_data_source.dart';
import 'package:mini_github/infrastructure/repositories_impl/github_repository_impl.dart';
import 'package:riverpod/riverpod.dart';

final githubDataSourceProvider = Provider<GithubDataSource>((ref) {
  return GithubDataSource();
});

final githubRepositoryProvider = Provider<GithubRepository>((ref) {
  return GithubRepositoryImpl(ref.watch(githubDataSourceProvider));
});
