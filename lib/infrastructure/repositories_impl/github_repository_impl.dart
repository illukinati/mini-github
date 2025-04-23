import 'package:fpdart/fpdart.dart';
import 'package:mini_github/domain/entities/repo_entity.dart';
import 'package:mini_github/domain/entities/user_entity.dart';
import 'package:mini_github/domain/repositories/github_repository.dart';
import 'package:mini_github/domain/values/failure_state.dart';
import 'package:mini_github/infrastructure/data_sources/github_data_source.dart';

class GithubRepositoryImpl implements GithubRepository {
  final GithubDataSource dataSource;
  GithubRepositoryImpl(this.dataSource);

  @override
  Future<Either<FailureState, List<UserEntity>>> getAllUsers() async {
    var result = await dataSource.getAllUsers();
    return result.map(
      (userModels) => userModels.map((e) => e.toEntity()).toList(),
    );
  }

  @override
  Future<Either<FailureState, List<UserEntity>>> searchUsers(
    String keyword,
  ) async {
    final result = await dataSource.getAllUsers();
    return result.map(
      (users) =>
          users
              .map((e) => e.toEntity())
              .where(
                (u) => u.name.toLowerCase().contains(keyword.toLowerCase()),
              )
              .toList(),
    );
  }

  @override
  Future<Either<FailureState, UserEntity>> getUserDetails(
    String username,
  ) async {
    var result = await dataSource.getUser(username);
    return result.map((userModel) => userModel.toEntity());
  }

  @override
  Future<Either<FailureState, List<RepoEntity>>> getUserRepos(
    String username,
  ) async {
    var result = await dataSource.getUserRepos(username);
    return result.map(
      (repoModels) => repoModels.map((e) => e.toEntity()).toList(),
    );
  }
}
