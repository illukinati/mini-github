import 'package:flutter_test/flutter_test.dart';
import 'package:mini_github/domain/entities/repo_entity.dart';
import 'package:mini_github/infrastructure/models/repo_model.dart';

void main() {
  test('Repo Model should correctly converted to RepoEntity', () {
    final repo = RepoModel(
      id: 1,
      name: "example repo",
      description: "example description",
      url: "example url",
      stargazersCount: 0,
      language: "Java",
    );

    final entity = repo.toEntity();

    expect(repo.toEntity(), isA<RepoEntity>());
    expect(repo.url, entity.url);
    expect(repo.language, entity.language);
  });
}
