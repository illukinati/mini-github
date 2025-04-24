import 'package:mini_github/domain/entities/repo_entity.dart';

class RepoModel {
  int? _id;
  String? _name;
  String? _description;
  String? _url;
  int? _stargazersCount;
  String? _language;

  RepoModel({
    int? id,
    String? name,
    String? description,
    String? url,
    int? stargazersCount,
    String? language,
  }) {
    if (id != null) {
      _id = id;
    }
    if (name != null) {
      _name = name;
    }
    if (description != null) {
      _description = description;
    }
    if (url != null) {
      _url = url;
    }
    if (stargazersCount != null) {
      _stargazersCount = stargazersCount;
    }
    if (language != null) {
      _language = language;
    }
  }

  int? get id => _id;
  String? get name => _name;
  String? get description => _description;
  String? get url => _url;
  int? get stargazersCount => _stargazersCount;
  String? get language => _language;

  RepoModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _url = json['html_url'];
    _stargazersCount = json['stargazers_count'];
    _language = json['language'];
  }

  RepoEntity toEntity() {
    return RepoEntity(
      id: id!,
      repositoryName: name ?? "",
      starCount: stargazersCount ?? 0,
      description: description ?? "",
      language: language ?? "",
      url: url ?? "",
    );
  }
}
