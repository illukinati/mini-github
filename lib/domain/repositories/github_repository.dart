import 'package:fpdart/fpdart.dart';
import 'package:mini_github/domain/entities/repo_entity.dart';
import 'package:mini_github/domain/entities/user_entity.dart';
import 'package:mini_github/domain/values/failure_state.dart';

abstract class GithubRepository {
  Future<Either<FailureState, List<UserEntity>>> getAllUsers();

  Future<Either<FailureState, List<UserEntity>>> searchUsers(String keyword);

  Future<Either<FailureState, UserEntity>> getUserDetails(String username);

  Future<Either<FailureState, List<RepoEntity>>> getUserRepos(String username);
}
