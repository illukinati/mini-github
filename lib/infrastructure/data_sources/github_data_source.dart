import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mini_github/domain/values/failure_state.dart';
import 'package:mini_github/infrastructure/core/urls.dart';
import 'package:mini_github/infrastructure/models/repo_model.dart';
import 'package:mini_github/infrastructure/models/user_model.dart';

class GithubDataSource {
  final Dio dio;
  final DotEnv dotEnv;

  GithubDataSource({Dio? dio, DotEnv? dotEnv})
    : dio = dio ?? Dio(),
      dotEnv = dotEnv ?? DotEnv();

  Future<Either<FailureState, List<UserModel>>> getAllUsers() async {
    final token = dotEnv.env['GITHUB_TOKEN'];
    try {
      Response response;
      response = await dio.get(
        MyUrl.allUsersUrl,
        options: Options(headers: {'Authorization': 'token $token'}),
      );
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        List<UserModel> users = data.map((e) => UserModel.fromJson(e)).toList();
        return right(users);
      } else {
        return left(CustomFailure(response.statusMessage ?? ""));
      }
    } on DioException catch (e) {
      return left(CustomFailure("Dio Exception: $e"));
    } catch (e) {
      return left(CustomFailure("Catch Exception: $e"));
    }
  }

  Future<Either<FailureState, UserModel>> getUser(String username) async {
    final token = dotEnv.env['GITHUB_TOKEN'];
    try {
      Response response;
      response = await dio.get(
        MyUrl.userDetailUrl(username),
        options: Options(headers: {'Authorization': 'token $token'}),
      );
      final data = response.data;
      UserModel user = UserModel.fromJson(data);
      return right(user);
    } on DioException catch (e) {
      return left(CustomFailure(e.toString()));
    } catch (e) {
      return left(CustomFailure(e.toString()));
    }
  }

  Future<Either<FailureState, List<RepoModel>>> getUserRepos(
    String username,
  ) async {
    final token = dotEnv.env['GITHUB_TOKEN'];
    try {
      Response response;
      response = await dio.get(
        MyUrl.userReposUrl(username),
        options: Options(headers: {'Authorization': 'token $token'}),
      );
      if (response.statusCode == 200) {
        List<dynamic> data = response.data as List<dynamic>;
        List<RepoModel> repos = data.map((e) => RepoModel.fromJson(e)).toList();
        return right(repos);
      } else {
        return left(CustomFailure(response.statusMessage ?? ""));
      }
    } on DioException catch (e) {
      return left(CustomFailure(e.toString()));
    } catch (e) {
      return left(CustomFailure(e.toString()));
    }
  }
}
