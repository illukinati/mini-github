import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mini_github/domain/values/failure_state.dart';
import 'package:mini_github/infrastructure/data_sources/github_data_source.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

class MockDotEnv extends Mock implements DotEnv {}

void main() {
  late MockDio mockDio;
  late MockDotEnv mockDotEnv;
  late GithubDataSource dataSource;

  setUp(() async {
    mockDio = MockDio();
    mockDotEnv = MockDotEnv();
    dataSource = GithubDataSource(dio: mockDio, dotEnv: mockDotEnv);
    when(() => mockDotEnv.env).thenReturn({'GITHUB_TOKEN': 'mocked_token'});
    dotenv.testLoad();
  });

  setUpAll(() async {
    await dotenv.load();
    dotenv.testLoad();
  });

  group('GithubDataSource', () {
    test('returns list of users when getAllUsers succeeds', () async {
      final mockJson = [
        {"login": "user1", "id": 1},
        {"login": "user2", "id": 2},
      ];

      when(() => mockDio.get(any(), options: any(named: 'options'))).thenAnswer(
        (_) async => Response(
          data: mockJson,
          statusCode: 200,
          requestOptions: RequestOptions(path: ''),
        ),
      );

      final result = await dataSource.getAllUsers();
      expect(result.isRight(), true);
      result.match(
        (l) => fail("Expected right, got left"),
        (r) => expect(r.length, 2),
      );
    });

    test('returns failure when getAllUsers fails', () async {
      when(() => mockDio.get(any(), options: any(named: 'options'))).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: ''),
          error: 'Not Found',
        ),
      );

      final result = await dataSource.getUser('invalid');
      expect(result.isLeft(), true);
      result.match(
        (l) => expect(l, isA<CustomFailure>()),
        (r) => fail("Expected left, got right"),
      );
    });

    test('returns user detail when getUser succeeds', () async {
      final mockJson = {"login": "user1", "id": 1};
      when(() => mockDio.get(any(), options: any(named: 'options'))).thenAnswer(
        (_) async => Response(
          data: mockJson,
          statusCode: 200,
          requestOptions: RequestOptions(path: ''),
        ),
      );

      final result = await dataSource.getUser('valid');
      expect(result.isRight(), true);
      result.match(
        (l) => fail("Expected right, got left"),
        (r) => expect(r.login, "user1"),
      );
    });

    test('returns failure when getUser fails', () async {
      when(() => mockDio.get(any(), options: any(named: 'options'))).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: ''),
          error: 'Not Found',
        ),
      );

      final result = await dataSource.getUser('invalid');
      expect(result.isLeft(), true);
      result.match(
        (l) => expect(l, isA<CustomFailure>()),
        (r) => fail("Expected left, got right"),
      );
    });

    test(
      'returns list of repositories when getRepositories succeeds',
      () async {
        final mockJson = [
          {"name": "repo1", "id": 1},
          {"name": "repo2", "id": 2},
        ];
        when(
          () => mockDio.get(any(), options: any(named: 'options')),
        ).thenAnswer(
          (_) async => Response(
            data: mockJson,
            statusCode: 200,
            requestOptions: RequestOptions(path: ''),
          ),
        );
        final result = await dataSource.getUserRepos('valid');
        expect(result.isRight(), true);
        result.match(
          (l) => fail("Expected right, got left"),
          (r) => expect(r.length, 2),
        );
      },
    );

    test('returns failure when getRepositories fails', () async {
      when(() => mockDio.get(any(), options: any(named: 'options'))).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: ''),
          error: 'Not Found',
        ),
      );
      final result = await dataSource.getUserRepos('invalid');
      expect(result.isLeft(), true);
      result.match(
        (l) => expect(l, isA<CustomFailure>()),
        (r) => fail("Expected left, got right"),
      );
    });
  });
}
