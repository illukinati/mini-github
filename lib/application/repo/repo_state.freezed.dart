// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repo_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RepoState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RepoState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RepoState()';
}


}

/// @nodoc
class $RepoStateCopyWith<$Res>  {
$RepoStateCopyWith(RepoState _, $Res Function(RepoState) __);
}


/// @nodoc


class Initial implements RepoState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RepoState.initial()';
}


}




/// @nodoc


class Loading implements RepoState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RepoState.loading()';
}


}




/// @nodoc


class ReposFound implements RepoState {
  const ReposFound(final  List<RepoEntity> repos): _repos = repos;
  

 final  List<RepoEntity> _repos;
 List<RepoEntity> get repos {
  if (_repos is EqualUnmodifiableListView) return _repos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_repos);
}


/// Create a copy of RepoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReposFoundCopyWith<ReposFound> get copyWith => _$ReposFoundCopyWithImpl<ReposFound>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReposFound&&const DeepCollectionEquality().equals(other._repos, _repos));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_repos));

@override
String toString() {
  return 'RepoState.reposFound(repos: $repos)';
}


}

/// @nodoc
abstract mixin class $ReposFoundCopyWith<$Res> implements $RepoStateCopyWith<$Res> {
  factory $ReposFoundCopyWith(ReposFound value, $Res Function(ReposFound) _then) = _$ReposFoundCopyWithImpl;
@useResult
$Res call({
 List<RepoEntity> repos
});




}
/// @nodoc
class _$ReposFoundCopyWithImpl<$Res>
    implements $ReposFoundCopyWith<$Res> {
  _$ReposFoundCopyWithImpl(this._self, this._then);

  final ReposFound _self;
  final $Res Function(ReposFound) _then;

/// Create a copy of RepoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? repos = null,}) {
  return _then(ReposFound(
null == repos ? _self._repos : repos // ignore: cast_nullable_to_non_nullable
as List<RepoEntity>,
  ));
}


}

/// @nodoc


class RepoNotFound implements RepoState {
  const RepoNotFound();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RepoNotFound);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RepoState.repoNotFound()';
}


}




/// @nodoc


class Error implements RepoState {
  const Error(this.message);
  

 final  String message;

/// Create a copy of RepoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<Error> get copyWith => _$ErrorCopyWithImpl<Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'RepoState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $RepoStateCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error _self;
  final $Res Function(Error) _then;

/// Create a copy of RepoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
