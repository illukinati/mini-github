import 'package:mini_github/domain/entities/user_entity.dart';

class UserModel {
  String? _login;
  int? _id;
  String? _avatarUrl;
  String? _url;
  String? _name;
  String? _company;
  String? _blog;
  String? _location;
  String? _email;
  String? _bio;
  int? _publicRepos;
  int? _followers;
  int? _following;

  UserModel({
    String? login,
    int? id,
    String? avatarUrl,
    String? url,
    String? name,
    String? company,
    String? blog,
    String? location,
    String? email,
    String? bio,
    int? publicRepos,
    int? followers,
    int? following,
  }) {
    if (login != null) {
      _login = login;
    }
    if (id != null) {
      _id = id;
    }
    if (avatarUrl != null) {
      _avatarUrl = avatarUrl;
    }
    if (url != null) {
      _url = url;
    }
    if (name != null) {
      _name = name;
    }
    if (company != null) {
      _company = company;
    }
    if (blog != null) {
      _blog = blog;
    }
    if (location != null) {
      _location = location;
    }
    if (email != null) {
      _email = email;
    }
    if (bio != null) {
      _bio = bio;
    }
    if (publicRepos != null) {
      _publicRepos = publicRepos;
    }
    if (followers != null) {
      _followers = followers;
    }
    if (following != null) {
      _following = following;
    }
  }

  String? get login => _login;
  int? get id => _id;
  String? get avatarUrl => _avatarUrl;
  String? get url => _url;
  String? get name => _name;
  String? get company => _company;
  String? get blog => _blog;
  String? get location => _location;
  String? get email => _email;
  String? get bio => _bio;
  int? get publicRepos => _publicRepos;
  int? get followers => _followers;
  int? get following => _following;

  UserModel.fromJson(Map<String, dynamic> json) {
    _login = json['login'];
    _id = json['id'];
    _avatarUrl = json['avatar_url'];
    _url = json['url'];
    _name = json['name'];
    _company = json['company'];
    _blog = json['blog'];
    _location = json['location'];
    _email = json['email'];
    _bio = json['bio'];
    _publicRepos = json['public_repos'];
    _followers = json['followers'];
    _following = json['following'];
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id!,
      login: login!,
      avatarUrl: avatarUrl!,
      url: url!,
      name: name!,
      company: company ?? "",
      blog: blog ?? "",
      location: location ?? "",
      email: email ?? "",
      bio: bio ?? "",
      publicRepos: publicRepos ?? 0,
      followers: followers ?? 0,
      following: following ?? 0,
    );
  }
}
