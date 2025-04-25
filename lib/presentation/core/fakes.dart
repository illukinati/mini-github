import 'package:mini_github/domain/entities/repo_entity.dart';
import 'package:mini_github/domain/entities/user_entity.dart';

/// This class is for skeletonizer
class MyFakeData {
  static var instance = MyFakeData();

  var repo = RepoEntity(
    id: 1,
    repositoryName: "this is a long repository name",
    starCount: 1000,
    description: "This is a very long description for skeletonizer",
    language: "language",
    url: "This is a long url",
  );

  var user = UserEntity(
    id: 1,
    login: "this is a long login",
    avatarUrl: "https://picsum.photos/200",
    url: "this is a long url",
    name: "this is a long name",
    company: "this is a long company",
    blog: "this is a long blog",
    location: "this is a long location",
    email: "this is a long email",
    bio: "this is a long bio",
    publicRepos: 0,
    followers: 100,
    following: 100,
  );
}
