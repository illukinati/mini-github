import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mini_github/application/repo/repo_use_case.dart';
import 'package:mini_github/domain/entities/repo_entity.dart';
import 'package:mini_github/domain/repositories/github_repository.dart';
import 'package:mini_github/domain/values/failure_state.dart';
import 'package:mocktail/mocktail.dart';

class MockGithubRepository extends Mock implements GithubRepository {}

void main() {
  late MockGithubRepository mockGithubRepository;
  late GetUserReposUseCase getUserReposUseCase;

  final testRepos = [
    RepoEntity(
      id: 1,
      repositoryName: "example 1",
      starCount: 1,
      description: "example 1",
      language: "Java",
      url: "url",
    ),
    RepoEntity(
      id: 2,
      repositoryName: "example 2",
      starCount: 2,
      description: "example 2",
      language: "Dart",
      url: "url 2",
    ),
  ];

  final testFailure = CustomFailure('Test error');

  setUp(() {
    mockGithubRepository = MockGithubRepository();
    getUserReposUseCase = GetUserReposUseCase(mockGithubRepository);
  });

  group('GetUserReposUseCase', () {
    test('should return a list of repos when successful', () async {
      when(
        () => mockGithubRepository.getUserRepos("John"),
      ).thenAnswer((_) async => right(testRepos));

      final result = await getUserReposUseCase.execute("John");

      expect(result, right(testRepos));
      result.fold((left) => null, ((right) => expect(right, testRepos)));
      verify(() => getUserReposUseCase.execute("John")).called(1);
    });

    test('should return a failure when an error occurs', () async {
      when(
        () => mockGithubRepository.getUserRepos("John"),
      ).thenAnswer((_) async => left(testFailure));

      final result = await getUserReposUseCase.execute("John");

      expect(result, left(testFailure));
      result.fold((left) => expect(left, testFailure), ((right) => null));
      verify(() => getUserReposUseCase.execute("John")).called(1);
    });
  });
}
