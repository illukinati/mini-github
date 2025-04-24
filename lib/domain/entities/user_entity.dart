class UserEntity {
  final int id;
  final String login;
  final String avatarUrl;
  final String url;
  final String name;
  final String company;
  final String blog;
  final String location;
  final String email;
  final String bio;
  final int publicRepos;
  final int followers;
  final int following;

  UserEntity({
    required this.id,
    required this.login,
    this.avatarUrl = "",
    this.url = "",
    this.name = "",
    this.company = "",
    this.blog = "",
    this.location = "",
    this.email = "",
    this.bio = "",
    this.publicRepos = 0,
    this.followers = 0,
    this.following = 0,
  });
}
