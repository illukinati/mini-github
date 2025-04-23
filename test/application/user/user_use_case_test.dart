import 'package:fpdart/fpdart.dart';
import 'package:mini_github/application/user/user_use_case.dart';
import 'package:mini_github/domain/entities/user_entity.dart';
import 'package:mini_github/domain/repositories/github_repository.dart';
import 'package:mini_github/domain/values/failure_state.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';

class MockGithubRepository extends Mock implements GithubRepository {}

void main() {
  late MockGithubRepository mockRepository;
  late GetAllUsersUseCase getAllUsersUseCase;
  late GetUserDetailUseCase getUserDetailUseCase;
  late SearchUsersUseCase searchUsersUseCase;

  final testUsers = [
    UserEntity(id: 1, name: 'John', login: 'john', avatarUrl: 'url1', url: ''),
    UserEntity(id: 2, name: 'Jane', login: 'jane', avatarUrl: 'url2', url: ''),
  ];
  final testUser = UserEntity(
    id: 1,
    name: 'John',
    login: 'john',
    avatarUrl: 'url1',
    url: '',
  );
  final testFailure = CustomFailure('Test error');

  setUp(() {
    mockRepository = MockGithubRepository();
    getAllUsersUseCase = GetAllUsersUseCase(mockRepository);
    getUserDetailUseCase = GetUserDetailUseCase(mockRepository);
    searchUsersUseCase = SearchUsersUseCase(mockRepository);
  });

  group('GetAllUsersUseCase', () {
    test('should return users when repository succeeds', () async {
      when(
        () => mockRepository.getAllUsers(),
      ).thenAnswer((_) async => right(testUsers));

      final result = await getAllUsersUseCase.execute();

      expect(result.isRight(), true);
      result.fold(
        (f) => fail('Expected success but got failure'),
        (users) => expect(users, equals(testUsers)),
      );
      verify(() => mockRepository.getAllUsers()).called(1);
    });

    test('should return empty users when repository returns empty', () async {
      when(
        () => mockRepository.getAllUsers(),
      ).thenAnswer((_) async => right([]));

      final result = await getAllUsersUseCase.execute();

      expect(result.isRight(), true);
      result.fold(
        (f) => fail('Expected success but got failure'),
        (users) => expect(users.isEmpty, true),
      );
      verify(() => mockRepository.getAllUsers()).called(1);
    });

    test('should return failure when repository fails', () async {
      when(
        () => mockRepository.getAllUsers(),
      ).thenAnswer((_) async => left(testFailure));

      final result = await getAllUsersUseCase.execute();

      expect(result.isLeft(), true);
      expect(result.fold((f) => f, (r) => null), equals(testFailure));
    });
  });

  group('GetUserDetailUseCase', () {
    test('should return user when repository succeeds', () async {
      const username = 'john';
      when(
        () => mockRepository.getUserDetails(username),
      ).thenAnswer((_) async => right(testUser));

      final result = await getUserDetailUseCase.execute(username);

      expect(result.isRight(), true);
      result.fold(
        (f) => fail('Expected success but got failure'),
        (user) => expect(user, equals(testUser)),
      );
      verify(() => mockRepository.getUserDetails(username)).called(1);
    });

    test('should return failure when repository fails', () async {
      const username = 'john';
      when(
        () => mockRepository.getUserDetails(username),
      ).thenAnswer((_) async => left(testFailure));

      final result = await getUserDetailUseCase.execute(username);

      expect(result.isLeft(), true);
      expect(result.fold((f) => f, (r) => null), equals(testFailure));
    });
  });

  group('SearchUsersUseCase', () {
    test('should return filtered users when repository succeeds', () async {
      const keyword = 'jo';
      when(
        () => mockRepository.searchUsers(keyword),
      ).thenAnswer((_) async => right([testUser]));

      final result = await searchUsersUseCase.execute(keyword);

      expect(result.isRight(), true);
      result.fold((f) => fail('Expected success but got failure'), (users) {
        expect(users.length, 1);
        expect(users.first.name.toLowerCase(), contains('jo'));
      });
      verify(() => mockRepository.searchUsers(keyword)).called(1);
    });

    test('should return empty list when no matches found', () async {
      const keyword = 'nonexistent';
      when(
        () => mockRepository.searchUsers(keyword),
      ).thenAnswer((_) async => right([]));

      final result = await searchUsersUseCase.execute(keyword);

      expect(result.isRight(), true);
      result.fold(
        (f) => fail('Expected success but got failure'),
        (users) => expect(users.isEmpty, true),
      );
    });

    test('should return failure when repository fails', () async {
      const keyword = 'test';
      when(
        () => mockRepository.searchUsers(keyword),
      ).thenAnswer((_) async => left(testFailure));

      final result = await searchUsersUseCase.execute(keyword);

      expect(result.isLeft(), true);
      expect(result.fold((f) => f, (r) => null), equals(testFailure));
    });
  });
}
