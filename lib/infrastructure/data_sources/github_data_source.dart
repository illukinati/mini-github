import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mini_github/domain/values/failure_state.dart';
import 'package:mini_github/infrastructure/core/urls.dart';
import 'package:mini_github/infrastructure/models/repo_model.dart';
import 'package:mini_github/infrastructure/models/user_model.dart';

class GithubDataSource {
  Future<Either<FailureState, List<UserModel>>> getAllUsers() async {
    try {
      final dio = Dio();
      Response response;
      response = await dio.get(MyUrl.allUsersUrl);
      final data = response.data;
      List<UserModel> users = data.map((e) => UserModel.fromJson(e)).toList();
      return right(users);
    } on DioException catch (e) {
      return left(CustomFailure(e.toString()));
    } catch (e) {
      return left(CustomFailure(e.toString()));
    }
  }

  Future<Either<FailureState, UserModel>> getUser(String username) async {
    try {
      final dio = Dio();
      Response response;
      response = await dio.get(MyUrl.userDetailUrl(username));
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
    try {
      final dio = Dio();
      Response response;
      response = await dio.get(MyUrl.userReposUrl(username));
      final data = response.data;
      List<RepoModel> repos = data.map((e) => RepoModel.fromJson(e)).toList();
      return right(repos);
    } on DioException catch (e) {
      return left(CustomFailure(e.toString()));
    } catch (e) {
      return left(CustomFailure(e.toString()));
    }
  }
}
