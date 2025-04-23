import 'package:fpdart/fpdart.dart';
import 'package:mini_github/domain/entities/user_entity.dart';
import 'package:mini_github/domain/repositories/github_repository.dart';
import 'package:mini_github/domain/values/failure_state.dart';

class GetAllUsersUseCase {
  final GithubRepository githubRepository;
  GetAllUsersUseCase(this.githubRepository);

  Future<Either<FailureState, List<UserEntity>>> execute() {
    return githubRepository.getAllUsers();
  }
}

class GetUserDetailUseCase {
  final GithubRepository githubRepository;
  GetUserDetailUseCase(this.githubRepository);

  Future<Either<FailureState, UserEntity>> execute(String username) {
    return githubRepository.getUserDetails(username);
  }
}

class SearchUsersUseCase {
  final GithubRepository githubRepository;
  SearchUsersUseCase(this.githubRepository);

  Future<Either<FailureState, List<UserEntity>>> execute(String keyword) {
    return githubRepository.searchUsers(keyword);
  }
}
