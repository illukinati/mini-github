import 'package:flutter_test/flutter_test.dart';
import 'package:mini_github/domain/entities/user_entity.dart';
import 'package:mini_github/infrastructure/models/user_model.dart';

void main() {
  test('UserModel should correctly convert to UserEntity', () {
    final model = UserModel(
      login: "example",
      id: 123,
      avatarUrl: "https://example.com/avatar.png",
      url: "https://example.com/user",
      name: "example name",
      company: "example company",
      blog: "example blog",
      location: "example location",
      email: "example email",
      bio: "example bio",
      publicRepos: 10,
      followers: 20,
      following: 15,
    );

    final entity = model.toEntity();

    expect(entity, isA<UserEntity>());
    expect(entity.id, model.id);
    expect(entity.publicRepos, model.publicRepos);
    expect(entity.name, model.name);
  });
}
