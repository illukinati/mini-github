import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mini_github/domain/entities/repo_entity.dart';

part 'repo_state.freezed.dart';

@freezed
sealed class RepoState with _$RepoState {
  const factory RepoState.initial() = Initial;
  const factory RepoState.loading() = Loading;
  const factory RepoState.reposFound(List<RepoEntity> repos) = ReposFound;
  const factory RepoState.repoNotFound() = RepoNotFound;
  const factory RepoState.error(String message) = Error;
}
