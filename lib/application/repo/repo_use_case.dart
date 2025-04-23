import 'package:fpdart/fpdart.dart';
import 'package:mini_github/domain/entities/repo_entity.dart';
import 'package:mini_github/domain/repositories/github_repository.dart';
import 'package:mini_github/domain/values/failure_state.dart';

class GetUserReposUseCase {
  final GithubRepository githubRepository;
  GetUserReposUseCase(this.githubRepository);

  Future<Either<FailureState, List<RepoEntity>>> execute(String username) {
    return githubRepository.getUserRepos(username);
  }
}
