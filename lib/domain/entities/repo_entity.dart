class RepoEntity {
  final int id;
  final String repositoryName;
  final int starCount;
  final String description;
  final String language;
  final String url;

  RepoEntity({
    required this.id,
    required this.repositoryName,
    required this.starCount,
    required this.description,
    required this.language,
    required this.url,
  });
}
