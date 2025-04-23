import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mini_github/domain/values/failure_state.dart';
import 'package:mini_github/infrastructure/data_sources/github_data_source.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'github_data_source_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late GithubDataSource dataSource;

  setUp(() {
    mockDio = MockDio();
    dataSource = GithubDataSource(dio: mockDio);
  });

  group('GithubDataSource', () {
    test('returns list of users when getAllUsers succeeds', () async {
      final mockJson = [
        {"login": "user1", "id": 1},
        {"login": "user2", "id": 2},
      ];

      when(mockDio.get(any)).thenAnswer(
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

    test('returns failure when getUser fails', () async {
      when(mockDio.get(any)).thenThrow(
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
  });
}
