import 'package:fpdart/fpdart.dart';
import 'package:mini_github/domain/entities/repo_entity.dart';
import 'package:mini_github/domain/entities/user_entity.dart';
import 'package:mini_github/domain/values/failure_state.dart';
import 'package:mini_github/infrastructure/data_sources/github_data_source.dart';
import 'package:mini_github/infrastructure/models/repo_model.dart';
import 'package:mini_github/infrastructure/models/user_model.dart';
import 'package:mini_github/infrastructure/repositories_impl/github_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGithubDataSource extends Mock implements GithubDataSource {}

class MockUserModel extends Mock implements UserModel {}

class MockRepoModel extends Mock implements RepoModel {}

void main() {
  late GithubRepositoryImpl repository;
  late MockGithubDataSource mockDataSource;
  late MockUserModel mockUserModel;
  late MockRepoModel mockRepoModel;

  late UserEntity testUserEntity;
  late RepoEntity testRepoEntity;

  late MockUserModel mockUserModel1;
  late MockUserModel mockUserModel2;

  final UserEntity user1 = UserEntity(
    id: 1,
    login: 'johndoe',
    name: "John Doe",
    avatarUrl: 'https://example.com/john.jpg',
    url: 'example-url-1',
  );

  final UserEntity user2 = UserEntity(
    id: 2,
    login: 'janesmith',
    name: "Jane Smith",
    avatarUrl: 'https://example.com/jane.jpg',
    url: 'example-url-2',
  );

  setUpAll(() {
    registerFallbackValue(MockUserModel());
  });

  setUp(() {
    mockDataSource = MockGithubDataSource();
    mockUserModel = MockUserModel();
    mockRepoModel = MockRepoModel();
    repository = GithubRepositoryImpl(mockDataSource);

    testUserEntity = UserEntity(
      id: 1,
      login: 'testuser',
      avatarUrl: 'https://example.com/avatar.jpg',
      url: 'test-url',
    );

    testRepoEntity = RepoEntity(
      id: 1,
      repositoryName: 'testrepo',
      starCount: 0,
      description: 'Test repository',
      language: "java",
      url: 'test-url',
    );

    when(() => mockUserModel.toEntity()).thenReturn(testUserEntity);
    when(() => mockRepoModel.toEntity()).thenReturn(testRepoEntity);

    mockUserModel1 = MockUserModel();
    mockUserModel2 = MockUserModel();

    when(() => mockUserModel1.toEntity()).thenReturn(user1);
    when(() => mockUserModel2.toEntity()).thenReturn(user2);
  });

  group('getAllUsers', () {
    test('should return list of UserEntity when success', () async {
      final userModels = [mockUserModel, mockUserModel];
      when(
        () => mockDataSource.getAllUsers(),
      ).thenAnswer((_) async => right(userModels));

      final result = await repository.getAllUsers();

      result.fold(
        (failure) {
          fail('Expected success but got failure');
        },
        (users) {
          expect(users.length, 2);
          expect(users.first, isA<UserEntity>());
        },
      );
    });

    test('should return failure when data source fails', () async {
      when(
        () => mockDataSource.getAllUsers(),
      ).thenAnswer((_) async => left(CustomFailure("error")));

      final result = await repository.getAllUsers();

      expect(result.isLeft(), true);
    });
  });

  group('searchUsers', () {
    test('should return list of UserEntity when success', () async {
      const keyword = 'john';
      when(
        () => mockDataSource.getAllUsers(),
      ).thenAnswer((_) async => right([mockUserModel1, mockUserModel2]));

      final result = await repository.searchUsers(keyword);

      expect(result.isRight(), true);
      result.fold((fail) => left('Expected success but got failure'), (users) {
        expect(users.length, 1);
        expect(users.first.login.toLowerCase(), contains(keyword));
      });
    });

    test('should return failure when data source fails', () async {
      final failure = CustomFailure('Network error');
      when(
        () => mockDataSource.getAllUsers(),
      ).thenAnswer((_) async => left(failure));

      final result = await repository.searchUsers('any');

      expect(result.isLeft(), true);
    });
  });

  group('getUserDetails', () {
    test('should return UserEntity when success', () async {
      final name = "john";
      when(
        () => mockDataSource.getUser(name),
      ).thenAnswer((_) async => right(mockUserModel));

      final result = await repository.getUserDetails(name);

      expect(result.isRight(), true);
    });

    test('should return failure when data source fails', () async {
      final failure = CustomFailure('Network error');
      when(
        () => mockDataSource.getUser(any()),
      ).thenAnswer((_) async => left(failure));
      final result = await repository.getUserDetails('any');
      expect(result.isLeft(), true);
    });
  });

  group('getUserRepos', () {
    test('should return UserEntity when success', () async {
      final name = "john";
      when(
        () => mockDataSource.getUserRepos(name),
      ).thenAnswer((_) async => right([mockRepoModel]));

      final result = await repository.getUserRepos(name);

      expect(result.isRight(), true);
    });

    test('should return failure when data source fails', () async {
      when(
        () => mockDataSource.getUserRepos(any()),
      ).thenAnswer((_) async => left(CustomFailure("error")));

      final result = await repository.getUserRepos('any');

      expect(result.isLeft(), true);
    });
  });
}
