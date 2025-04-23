import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mini_github/application/repo/repo_provider.dart';
import 'package:mini_github/application/repo/repo_state.dart';
import 'package:mini_github/application/repo/repo_use_case.dart';
import 'package:mini_github/domain/entities/repo_entity.dart';
import 'package:mini_github/domain/values/failure_state.dart';
import 'package:mocktail/mocktail.dart';

class MockGetUserReposUseCase extends Mock implements GetUserReposUseCase {}

void main() {
  late RepoNotifier repoNotifier;
  late MockGetUserReposUseCase mockGetUserRepos;

  final testRepos = [
    RepoEntity(
      id: 1,
      repositoryName: "repo 1",
      starCount: 1,
      description: "desc 1",
      language: "java",
      url: "url 1",
    ),
    RepoEntity(
      id: 2,
      repositoryName: "repo 2",
      starCount: 2,
      description: "desc 2",
      language: "java",
      url: "url 2",
    ),
  ];
  final testFailure = CustomFailure('Test error');

  setUp(() {
    mockGetUserRepos = MockGetUserReposUseCase();
    repoNotifier = RepoNotifier(getUserRepos: mockGetUserRepos);
  });

  group('RepoNotifier', () {
    test('initial state should be RepoState.initial()', () {
      expect(repoNotifier.state, equals(RepoState.initial()));
    });
  });

  group('getRepos', () {
    test(
      'should set loading state and then reposFound when successful',
      () async {
        const username = 'testuser';
        when(
          () => mockGetUserRepos.execute(username),
        ).thenAnswer((_) async => right(testRepos));

        final future = repoNotifier.getRepos(username);

        expect(repoNotifier.state, equals(RepoState.loading()));

        await future;
        expect(repoNotifier.state, equals(RepoState.reposFound(testRepos)));
        verify(() => mockGetUserRepos.execute(username)).called(1);
      },
    );

    test(
      'should set loading state and then error when failure occurs',
      () async {
        const username = 'testuser';
        when(
          () => mockGetUserRepos.execute(username),
        ).thenAnswer((_) async => left(testFailure));

        final future = repoNotifier.getRepos(username);

        expect(repoNotifier.state, equals(RepoState.loading()));

        await future;
        expect(
          repoNotifier.state,
          equals(RepoState.error(testFailure.message)),
        );
        verify(() => mockGetUserRepos.execute(username)).called(1);
      },
    );

    test('should returns empty list when no repos found', () async {
      const username = 'testuser';
      when(
        () => mockGetUserRepos.execute(username),
      ).thenAnswer((_) async => right([]));

      final future = repoNotifier.getRepos(username);

      expect(repoNotifier.state, equals(RepoState.loading()));

      await future;
      expect(repoNotifier.state, equals(RepoState.repoNotFound()));
      verify(() => mockGetUserRepos.execute(username)).called(1);
    });
  });
}
