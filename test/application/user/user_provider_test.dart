import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mini_github/application/user/user_provider.dart';
import 'package:mini_github/application/user/user_state.dart';
import 'package:mini_github/application/user/user_use_case.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mini_github/domain/entities/user_entity.dart';
import 'package:mini_github/domain/values/failure_state.dart';

class MockGetAllUsersUseCase extends Mock implements GetAllUsersUseCase {}

class MockGetUserDetailUseCase extends Mock implements GetUserDetailUseCase {}

class MockSearchUsersUseCase extends Mock implements SearchUsersUseCase {}

void main() {
  late UserNotifier userNotifier;
  late MockGetAllUsersUseCase mockGetAllUsers;
  late MockGetUserDetailUseCase mockGetUserDetail;
  late MockSearchUsersUseCase mockSearchUsers;

  final testUsers = [
    UserEntity(id: 1, login: "login 1", avatarUrl: "avatarUrl", url: "url"),
    UserEntity(id: 2, login: "login 2", avatarUrl: "avatarUrl", url: "url"),
  ];
  final testUser = UserEntity(
    id: 1,
    login: "login 1",
    avatarUrl: "avatarUrl",
    url: "url",
  );
  final testFailure = CustomFailure('Test error');

  setUp(() {
    mockGetAllUsers = MockGetAllUsersUseCase();
    mockGetUserDetail = MockGetUserDetailUseCase();
    mockSearchUsers = MockSearchUsersUseCase();

    userNotifier = UserNotifier(
      getAllUsersUseCase: mockGetAllUsers,
      getUserDetailUseCase: mockGetUserDetail,
      searchUsersUseCase: mockSearchUsers,
    );
  });

  group('UserNotifier', () {
    test('initial state should be UserState.initial()', () {
      expect(userNotifier.state, equals(const UserState.initial()));
    });
  });

  group('getAllUsers', () {
    test(
      'should transition through loading to usersFound on success',
      () async {
        when(
          () => mockGetAllUsers.execute(),
        ).thenAnswer((_) async => right(testUsers));

        final future = userNotifier.getAllUsers();

        expect(userNotifier.state, equals(UserState.loading()));

        await future;
        expect(userNotifier.state, equals(UserState.usersFound(testUsers)));
        verify(() => mockGetAllUsers.execute()).called(1);
      },
    );

    test('should returns empty list', () async {
      when(() => mockGetAllUsers.execute()).thenAnswer((_) async => right([]));

      final future = userNotifier.getAllUsers();

      expect(userNotifier.state, equals(UserState.loading()));

      await future;
      expect(userNotifier.state, equals(UserState.userNotFound()));
      verify(() => mockGetAllUsers.execute()).called(1);
    });

    test('should handle failure case', () async {
      when(
        () => mockGetAllUsers.execute(),
      ).thenAnswer((_) async => left(testFailure));

      final future = userNotifier.getAllUsers();

      await future;
      expect(userNotifier.state, equals(UserState.error(testFailure.message)));
      verify(() => mockGetAllUsers.execute()).called(1);
    });

    test('should handle exceptions', () async {
      when(
        () => mockGetAllUsers.execute(),
      ).thenThrow(Exception('Unexpected error'));

      final future = userNotifier.getAllUsers();

      await future;
      expect(
        userNotifier.state,
        equals(UserState.error('Exception: Unexpected error')),
      );
      verify(() => mockGetAllUsers.execute()).called(1);
    });
  });

  group('getUserDetail', () {
    test('should transition through loading to userFound on success', () async {
      const username = 'john';
      when(
        () => mockGetUserDetail.execute(username),
      ).thenAnswer((_) async => right(testUser));

      final future = userNotifier.getUserDetail(username);

      expect(userNotifier.state, equals(UserState.loading()));

      await future;
      expect(userNotifier.state, equals(UserState.userFound(testUser)));
      verify(() => mockGetUserDetail.execute(username)).called(1);
    });

    test('should handle failure case', () async {
      const username = 'john';
      when(
        () => mockGetUserDetail.execute(username),
      ).thenAnswer((_) async => left(testFailure));

      final future = userNotifier.getUserDetail(username);

      await future;
      expect(userNotifier.state, equals(UserState.error(testFailure.message)));
      verify(() => mockGetUserDetail.execute(username)).called(1);
    });
  });

  group('searchUsers', () {
    test(
      'should transition through loading to usersFound on success',
      () async {
        const query = 'jo';
        when(
          () => mockSearchUsers.execute(query),
        ).thenAnswer((_) async => right(testUsers));

        final future = userNotifier.searchUsers(query);

        expect(userNotifier.state, equals(UserState.loading()));

        await future;
        expect(userNotifier.state, equals(UserState.usersFound(testUsers)));
        verify(() => mockSearchUsers.execute(query)).called(1);
      },
    );

    test('should handle empty results', () async {
      const query = 'nonexistent';
      when(
        () => mockSearchUsers.execute(query),
      ).thenAnswer((_) async => right([]));

      final future = userNotifier.searchUsers(query);

      await future;
      expect(userNotifier.state, equals(UserState.userNotFound()));
      verify(() => mockSearchUsers.execute(query)).called(1);
    });
  });
}
