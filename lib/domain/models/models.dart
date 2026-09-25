// ignore_for_file: invalid_annotation_target
// Freezed forwards constructor annotations to generated implementation classes.
import 'package:freezed_annotation/freezed_annotation.dart';
part 'models.freezed.dart';
part 'models.g.dart';

enum BoardRole { owner, member }

@freezed
abstract class Comment with _$Comment {
  @JsonSerializable(fieldRename: FieldRename.snake, checked: true)
  const factory Comment({
    required int id,
    required int taskId,
    required int userId,
    required String content,
    required String created,
    required String modified,
  }) = _Comment;
  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}

@freezed
abstract class CommentInput with _$CommentInput {
  const factory CommentInput({required String content}) = _CommentInput;
  factory CommentInput.fromJson(Map<String, dynamic> json) =>
      _$CommentInputFromJson(json);
}

@freezed
abstract class Board with _$Board {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    checked: true,
    explicitToJson: true,
  )
  const factory Board({
    required int id,
    required String name,
    required String description,
    required int userId,
    required String created,
    required String modified,
  }) = _Board;
  factory Board.fromJson(Map<String, dynamic> json) => _$BoardFromJson(json);
}

@freezed
abstract class BoardInput with _$BoardInput {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    checked: true,
    explicitToJson: true,
  )
  const factory BoardInput({
    required String name,
    required String description,
  }) = _BoardInput;
  factory BoardInput.fromJson(Map<String, dynamic> json) =>
      _$BoardInputFromJson(json);
}

@freezed
abstract class UserProfile with _$UserProfile {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    checked: true,
    explicitToJson: true,
  )
  const factory UserProfile({required String bio}) = _UserProfile;
  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}

@freezed
abstract class User with _$User {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    checked: true,
    explicitToJson: true,
  )
  const factory User({
    required int id,
    required String username,
    required String email,
    @JsonKey(required: true) required UserProfile? profile,
    required String? firstName,
    required String? lastName,
    required String? dateJoined,
  }) = _User;
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
abstract class UserBrief with _$UserBrief {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    checked: true,
    explicitToJson: true,
  )
  const factory UserBrief({
    required int id,
    required String username,
    required String email,
  }) = _UserBrief;
  factory UserBrief.fromJson(Map<String, dynamic> json) =>
      _$UserBriefFromJson(json);
}

@freezed
abstract class BoardMembership with _$BoardMembership {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    checked: true,
    explicitToJson: true,
  )
  const factory BoardMembership({
    required int id,
    required int boardId,
    required UserBrief user,
    required BoardRole role,
    required String created,
  }) = _BoardMembership;
  factory BoardMembership.fromJson(Map<String, dynamic> json) =>
      _$BoardMembershipFromJson(json);
}

@freezed
abstract class BoardMembershipInput with _$BoardMembershipInput {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    checked: true,
    explicitToJson: true,
  )
  const factory BoardMembershipInput({
    required String email,
    required BoardRole role,
  }) = _BoardMembershipInput;
  factory BoardMembershipInput.fromJson(Map<String, dynamic> json) =>
      _$BoardMembershipInputFromJson(json);
}

@freezed
abstract class BoardStatus with _$BoardStatus {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    checked: true,
    explicitToJson: true,
  )
  const factory BoardStatus({
    required int id,
    required String name,
    required int order,
    required String color,
  }) = _BoardStatus;
  factory BoardStatus.fromJson(Map<String, dynamic> json) =>
      _$BoardStatusFromJson(json);
}

@freezed
abstract class BoardStatusInput with _$BoardStatusInput {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    checked: true,
    explicitToJson: true,
  )
  const factory BoardStatusInput({
    required String name,
    required int order,
    required String color,
  }) = _BoardStatusInput;
  factory BoardStatusInput.fromJson(Map<String, dynamic> json) =>
      _$BoardStatusInputFromJson(json);
}

@freezed
abstract class Sprint with _$Sprint {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    checked: true,
    explicitToJson: true,
  )
  const factory Sprint({
    required int id,
    required String name,
    @JsonKey(required: true) required String? startDate,
    @JsonKey(required: true) required String? endDate,
    required String created,
    required String modified,
  }) = _Sprint;
  factory Sprint.fromJson(Map<String, dynamic> json) => _$SprintFromJson(json);
}

@freezed
abstract class SprintInput with _$SprintInput {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    checked: true,
    explicitToJson: true,
  )
  const factory SprintInput({
    required String name,
    @JsonKey(required: true) required String? startDate,
    @JsonKey(required: true) required String? endDate,
  }) = _SprintInput;
  factory SprintInput.fromJson(Map<String, dynamic> json) =>
      _$SprintInputFromJson(json);
}

@freezed
abstract class TaskStatusBrief with _$TaskStatusBrief {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    checked: true,
    explicitToJson: true,
  )
  const factory TaskStatusBrief({
    required int id,
    required String name,
    required String color,
  }) = _TaskStatusBrief;
  factory TaskStatusBrief.fromJson(Map<String, dynamic> json) =>
      _$TaskStatusBriefFromJson(json);
}

@freezed
abstract class TaskSprintBrief with _$TaskSprintBrief {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    checked: true,
    explicitToJson: true,
  )
  const factory TaskSprintBrief({required int id, required String name}) =
      _TaskSprintBrief;
  factory TaskSprintBrief.fromJson(Map<String, dynamic> json) =>
      _$TaskSprintBriefFromJson(json);
}

@freezed
abstract class Task with _$Task {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    checked: true,
    explicitToJson: true,
  )
  const factory Task({
    required int id,
    required int boardId,
    @JsonKey(required: true) required TaskSprintBrief? sprint,
    @JsonKey(required: true) required TaskStatusBrief? status,
    required int userId,
    @JsonKey(required: true) required int? assignedToId,
    required String title,
    required String description,
    required String created,
    required String modified,
  }) = _Task;
  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}

@freezed
abstract class TaskInput with _$TaskInput {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    checked: true,
    explicitToJson: true,
  )
  const factory TaskInput({
    required String title,
    required String description,
    required int? statusId,
    required int? sprintId,
    @JsonKey(required: true) required int? assignedToId,
  }) = _TaskInput;
  factory TaskInput.fromJson(Map<String, dynamic> json) =>
      _$TaskInputFromJson(json);
}

@freezed
abstract class TokenPair with _$TokenPair {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    checked: true,
    explicitToJson: true,
  )
  const factory TokenPair({required String access, required String refresh}) =
      _TokenPair;
  factory TokenPair.fromJson(Map<String, dynamic> json) =>
      _$TokenPairFromJson(json);
}

@freezed
abstract class UserCredentials with _$UserCredentials {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    checked: true,
    explicitToJson: true,
  )
  const factory UserCredentials({
    required String email,
    required String password,
  }) = _UserCredentials;
  factory UserCredentials.fromJson(Map<String, dynamic> json) =>
      _$UserCredentialsFromJson(json);
}

@freezed
abstract class RegisterCredentials with _$RegisterCredentials {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    checked: true,
    explicitToJson: true,
  )
  const factory RegisterCredentials({
    required String username,
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) = _RegisterCredentials;
  factory RegisterCredentials.fromJson(Map<String, dynamic> json) =>
      _$RegisterCredentialsFromJson(json);
}

@freezed
abstract class RegisteredUser with _$RegisteredUser {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    checked: true,
    explicitToJson: true,
  )
  const factory RegisteredUser({
    required String username,
    required String email,
    required String? firstName,
    required String? lastName,
  }) = _RegisteredUser;
  factory RegisteredUser.fromJson(Map<String, dynamic> json) =>
      _$RegisteredUserFromJson(json);
}

@freezed
abstract class PasswordValidationResult with _$PasswordValidationResult {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    checked: true,
    explicitToJson: true,
  )
  const factory PasswordValidationResult({
    required bool isValid,
    required List<String> errors,
  }) = _PasswordValidationResult;
  factory PasswordValidationResult.fromJson(Map<String, dynamic> json) =>
      _$PasswordValidationResultFromJson(json);
}

@freezed
abstract class TaskAttachment with _$TaskAttachment {
  @JsonSerializable(
    fieldRename: FieldRename.none,
    checked: true,
    explicitToJson: true,
  )
  const factory TaskAttachment({
    required String id,
    required int taskId,
    required String photoUri,
    required double? latitude,
    required double? longitude,
    required String createdAt,
  }) = _TaskAttachment;
  factory TaskAttachment.fromJson(Map<String, dynamic> json) =>
      _$TaskAttachmentFromJson(json);
}

@freezed
abstract class TaskAttachmentInput with _$TaskAttachmentInput {
  @JsonSerializable(
    fieldRename: FieldRename.none,
    checked: true,
    explicitToJson: true,
  )
  const factory TaskAttachmentInput({
    required String photoUri,
    required double? latitude,
    required double? longitude,
  }) = _TaskAttachmentInput;
  factory TaskAttachmentInput.fromJson(Map<String, dynamic> json) =>
      _$TaskAttachmentInputFromJson(json);
}
