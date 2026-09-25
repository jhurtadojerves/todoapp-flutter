// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Comment {

 int get id; int get taskId; int get userId; String get content; String get created; String get modified;
/// Create a copy of Comment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentCopyWith<Comment> get copyWith => _$CommentCopyWithImpl<Comment>(this as Comment, _$identity);

  /// Serializes this Comment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Comment&&(identical(other.id, id) || other.id == id)&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.content, content) || other.content == content)&&(identical(other.created, created) || other.created == created)&&(identical(other.modified, modified) || other.modified == modified));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,taskId,userId,content,created,modified);

@override
String toString() {
  return 'Comment(id: $id, taskId: $taskId, userId: $userId, content: $content, created: $created, modified: $modified)';
}


}

/// @nodoc
abstract mixin class $CommentCopyWith<$Res>  {
  factory $CommentCopyWith(Comment value, $Res Function(Comment) _then) = _$CommentCopyWithImpl;
@useResult
$Res call({
 int id, int taskId, int userId, String content, String created, String modified
});




}
/// @nodoc
class _$CommentCopyWithImpl<$Res>
    implements $CommentCopyWith<$Res> {
  _$CommentCopyWithImpl(this._self, this._then);

  final Comment _self;
  final $Res Function(Comment) _then;

/// Create a copy of Comment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? taskId = null,Object? userId = null,Object? content = null,Object? created = null,Object? modified = null,}) {
  return _then(Comment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,created: null == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as String,modified: null == modified ? _self.modified : modified // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Comment].
extension CommentPatterns on Comment {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Comment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Comment() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Comment value)  $default,){
final _that = this;
switch (_that) {
case _Comment():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Comment value)?  $default,){
final _that = this;
switch (_that) {
case _Comment() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int taskId,  int userId,  String content,  String created,  String modified)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Comment() when $default != null:
return $default(_that.id,_that.taskId,_that.userId,_that.content,_that.created,_that.modified);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int taskId,  int userId,  String content,  String created,  String modified)  $default,) {final _that = this;
switch (_that) {
case _Comment():
return $default(_that.id,_that.taskId,_that.userId,_that.content,_that.created,_that.modified);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int taskId,  int userId,  String content,  String created,  String modified)?  $default,) {final _that = this;
switch (_that) {
case _Comment() when $default != null:
return $default(_that.id,_that.taskId,_that.userId,_that.content,_that.created,_that.modified);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class _Comment implements Comment {
  const _Comment({required this.id, required this.taskId, required this.userId, required this.content, required this.created, required this.modified});
  factory _Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);

@override final  int id;
@override final  int taskId;
@override final  int userId;
@override final  String content;
@override final  String created;
@override final  String modified;

/// Create a copy of Comment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommentCopyWith<_Comment> get copyWith => __$CommentCopyWithImpl<_Comment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Comment&&(identical(other.id, id) || other.id == id)&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.content, content) || other.content == content)&&(identical(other.created, created) || other.created == created)&&(identical(other.modified, modified) || other.modified == modified));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,taskId,userId,content,created,modified);

@override
String toString() {
  return 'Comment(id: $id, taskId: $taskId, userId: $userId, content: $content, created: $created, modified: $modified)';
}


}

/// @nodoc
abstract mixin class _$CommentCopyWith<$Res> implements $CommentCopyWith<$Res> {
  factory _$CommentCopyWith(_Comment value, $Res Function(_Comment) _then) = __$CommentCopyWithImpl;
@override @useResult
$Res call({
 int id, int taskId, int userId, String content, String created, String modified
});




}
/// @nodoc
class __$CommentCopyWithImpl<$Res>
    implements _$CommentCopyWith<$Res> {
  __$CommentCopyWithImpl(this._self, this._then);

  final _Comment _self;
  final $Res Function(_Comment) _then;

/// Create a copy of Comment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? taskId = null,Object? userId = null,Object? content = null,Object? created = null,Object? modified = null,}) {
  return _then(_Comment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,created: null == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as String,modified: null == modified ? _self.modified : modified // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CommentInput {

 String get content;
/// Create a copy of CommentInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentInputCopyWith<CommentInput> get copyWith => _$CommentInputCopyWithImpl<CommentInput>(this as CommentInput, _$identity);

  /// Serializes this CommentInput to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentInput&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,content);

@override
String toString() {
  return 'CommentInput(content: $content)';
}


}

/// @nodoc
abstract mixin class $CommentInputCopyWith<$Res>  {
  factory $CommentInputCopyWith(CommentInput value, $Res Function(CommentInput) _then) = _$CommentInputCopyWithImpl;
@useResult
$Res call({
 String content
});




}
/// @nodoc
class _$CommentInputCopyWithImpl<$Res>
    implements $CommentInputCopyWith<$Res> {
  _$CommentInputCopyWithImpl(this._self, this._then);

  final CommentInput _self;
  final $Res Function(CommentInput) _then;

/// Create a copy of CommentInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? content = null,}) {
  return _then(CommentInput(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CommentInput].
extension CommentInputPatterns on CommentInput {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommentInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommentInput() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommentInput value)  $default,){
final _that = this;
switch (_that) {
case _CommentInput():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommentInput value)?  $default,){
final _that = this;
switch (_that) {
case _CommentInput() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String content)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommentInput() when $default != null:
return $default(_that.content);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String content)  $default,) {final _that = this;
switch (_that) {
case _CommentInput():
return $default(_that.content);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String content)?  $default,) {final _that = this;
switch (_that) {
case _CommentInput() when $default != null:
return $default(_that.content);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CommentInput implements CommentInput {
  const _CommentInput({required this.content});
  factory _CommentInput.fromJson(Map<String, dynamic> json) => _$CommentInputFromJson(json);

@override final  String content;

/// Create a copy of CommentInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommentInputCopyWith<_CommentInput> get copyWith => __$CommentInputCopyWithImpl<_CommentInput>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommentInputToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommentInput&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,content);

@override
String toString() {
  return 'CommentInput(content: $content)';
}


}

/// @nodoc
abstract mixin class _$CommentInputCopyWith<$Res> implements $CommentInputCopyWith<$Res> {
  factory _$CommentInputCopyWith(_CommentInput value, $Res Function(_CommentInput) _then) = __$CommentInputCopyWithImpl;
@override @useResult
$Res call({
 String content
});




}
/// @nodoc
class __$CommentInputCopyWithImpl<$Res>
    implements _$CommentInputCopyWith<$Res> {
  __$CommentInputCopyWithImpl(this._self, this._then);

  final _CommentInput _self;
  final $Res Function(_CommentInput) _then;

/// Create a copy of CommentInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? content = null,}) {
  return _then(_CommentInput(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Board {

 int get id; String get name; String get description; int get userId; String get created; String get modified;
/// Create a copy of Board
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BoardCopyWith<Board> get copyWith => _$BoardCopyWithImpl<Board>(this as Board, _$identity);

  /// Serializes this Board to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Board&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.created, created) || other.created == created)&&(identical(other.modified, modified) || other.modified == modified));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,userId,created,modified);

@override
String toString() {
  return 'Board(id: $id, name: $name, description: $description, userId: $userId, created: $created, modified: $modified)';
}


}

/// @nodoc
abstract mixin class $BoardCopyWith<$Res>  {
  factory $BoardCopyWith(Board value, $Res Function(Board) _then) = _$BoardCopyWithImpl;
@useResult
$Res call({
 int id, String name, String description, int userId, String created, String modified
});




}
/// @nodoc
class _$BoardCopyWithImpl<$Res>
    implements $BoardCopyWith<$Res> {
  _$BoardCopyWithImpl(this._self, this._then);

  final Board _self;
  final $Res Function(Board) _then;

/// Create a copy of Board
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? userId = null,Object? created = null,Object? modified = null,}) {
  return _then(Board(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,created: null == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as String,modified: null == modified ? _self.modified : modified // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Board].
extension BoardPatterns on Board {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Board value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Board() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Board value)  $default,){
final _that = this;
switch (_that) {
case _Board():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Board value)?  $default,){
final _that = this;
switch (_that) {
case _Board() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String description,  int userId,  String created,  String modified)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Board() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.userId,_that.created,_that.modified);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String description,  int userId,  String created,  String modified)  $default,) {final _that = this;
switch (_that) {
case _Board():
return $default(_that.id,_that.name,_that.description,_that.userId,_that.created,_that.modified);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String description,  int userId,  String created,  String modified)?  $default,) {final _that = this;
switch (_that) {
case _Board() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.userId,_that.created,_that.modified);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, checked: true, explicitToJson: true)
class _Board implements Board {
  const _Board({required this.id, required this.name, required this.description, required this.userId, required this.created, required this.modified});
  factory _Board.fromJson(Map<String, dynamic> json) => _$BoardFromJson(json);

@override final  int id;
@override final  String name;
@override final  String description;
@override final  int userId;
@override final  String created;
@override final  String modified;

/// Create a copy of Board
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BoardCopyWith<_Board> get copyWith => __$BoardCopyWithImpl<_Board>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BoardToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Board&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.created, created) || other.created == created)&&(identical(other.modified, modified) || other.modified == modified));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,userId,created,modified);

@override
String toString() {
  return 'Board(id: $id, name: $name, description: $description, userId: $userId, created: $created, modified: $modified)';
}


}

/// @nodoc
abstract mixin class _$BoardCopyWith<$Res> implements $BoardCopyWith<$Res> {
  factory _$BoardCopyWith(_Board value, $Res Function(_Board) _then) = __$BoardCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String description, int userId, String created, String modified
});




}
/// @nodoc
class __$BoardCopyWithImpl<$Res>
    implements _$BoardCopyWith<$Res> {
  __$BoardCopyWithImpl(this._self, this._then);

  final _Board _self;
  final $Res Function(_Board) _then;

/// Create a copy of Board
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? userId = null,Object? created = null,Object? modified = null,}) {
  return _then(_Board(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,created: null == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as String,modified: null == modified ? _self.modified : modified // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$BoardInput {

 String get name; String get description;
/// Create a copy of BoardInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BoardInputCopyWith<BoardInput> get copyWith => _$BoardInputCopyWithImpl<BoardInput>(this as BoardInput, _$identity);

  /// Serializes this BoardInput to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BoardInput&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description);

@override
String toString() {
  return 'BoardInput(name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class $BoardInputCopyWith<$Res>  {
  factory $BoardInputCopyWith(BoardInput value, $Res Function(BoardInput) _then) = _$BoardInputCopyWithImpl;
@useResult
$Res call({
 String name, String description
});




}
/// @nodoc
class _$BoardInputCopyWithImpl<$Res>
    implements $BoardInputCopyWith<$Res> {
  _$BoardInputCopyWithImpl(this._self, this._then);

  final BoardInput _self;
  final $Res Function(BoardInput) _then;

/// Create a copy of BoardInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? description = null,}) {
  return _then(BoardInput(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BoardInput].
extension BoardInputPatterns on BoardInput {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BoardInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BoardInput() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BoardInput value)  $default,){
final _that = this;
switch (_that) {
case _BoardInput():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BoardInput value)?  $default,){
final _that = this;
switch (_that) {
case _BoardInput() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BoardInput() when $default != null:
return $default(_that.name,_that.description);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String description)  $default,) {final _that = this;
switch (_that) {
case _BoardInput():
return $default(_that.name,_that.description);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String description)?  $default,) {final _that = this;
switch (_that) {
case _BoardInput() when $default != null:
return $default(_that.name,_that.description);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, checked: true, explicitToJson: true)
class _BoardInput implements BoardInput {
  const _BoardInput({required this.name, required this.description});
  factory _BoardInput.fromJson(Map<String, dynamic> json) => _$BoardInputFromJson(json);

@override final  String name;
@override final  String description;

/// Create a copy of BoardInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BoardInputCopyWith<_BoardInput> get copyWith => __$BoardInputCopyWithImpl<_BoardInput>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BoardInputToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BoardInput&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description);

@override
String toString() {
  return 'BoardInput(name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class _$BoardInputCopyWith<$Res> implements $BoardInputCopyWith<$Res> {
  factory _$BoardInputCopyWith(_BoardInput value, $Res Function(_BoardInput) _then) = __$BoardInputCopyWithImpl;
@override @useResult
$Res call({
 String name, String description
});




}
/// @nodoc
class __$BoardInputCopyWithImpl<$Res>
    implements _$BoardInputCopyWith<$Res> {
  __$BoardInputCopyWithImpl(this._self, this._then);

  final _BoardInput _self;
  final $Res Function(_BoardInput) _then;

/// Create a copy of BoardInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? description = null,}) {
  return _then(_BoardInput(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$UserProfile {

 String get bio;
/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileCopyWith<UserProfile> get copyWith => _$UserProfileCopyWithImpl<UserProfile>(this as UserProfile, _$identity);

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfile&&(identical(other.bio, bio) || other.bio == bio));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bio);

@override
String toString() {
  return 'UserProfile(bio: $bio)';
}


}

/// @nodoc
abstract mixin class $UserProfileCopyWith<$Res>  {
  factory $UserProfileCopyWith(UserProfile value, $Res Function(UserProfile) _then) = _$UserProfileCopyWithImpl;
@useResult
$Res call({
 String bio
});




}
/// @nodoc
class _$UserProfileCopyWithImpl<$Res>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._self, this._then);

  final UserProfile _self;
  final $Res Function(UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bio = null,}) {
  return _then(UserProfile(
bio: null == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserProfile].
extension UserProfilePatterns on UserProfile {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserProfile value)  $default,){
final _that = this;
switch (_that) {
case _UserProfile():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserProfile value)?  $default,){
final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String bio)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that.bio);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String bio)  $default,) {final _that = this;
switch (_that) {
case _UserProfile():
return $default(_that.bio);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String bio)?  $default,) {final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that.bio);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, checked: true, explicitToJson: true)
class _UserProfile implements UserProfile {
  const _UserProfile({required this.bio});
  factory _UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);

@override final  String bio;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProfileCopyWith<_UserProfile> get copyWith => __$UserProfileCopyWithImpl<_UserProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProfile&&(identical(other.bio, bio) || other.bio == bio));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bio);

@override
String toString() {
  return 'UserProfile(bio: $bio)';
}


}

/// @nodoc
abstract mixin class _$UserProfileCopyWith<$Res> implements $UserProfileCopyWith<$Res> {
  factory _$UserProfileCopyWith(_UserProfile value, $Res Function(_UserProfile) _then) = __$UserProfileCopyWithImpl;
@override @useResult
$Res call({
 String bio
});




}
/// @nodoc
class __$UserProfileCopyWithImpl<$Res>
    implements _$UserProfileCopyWith<$Res> {
  __$UserProfileCopyWithImpl(this._self, this._then);

  final _UserProfile _self;
  final $Res Function(_UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bio = null,}) {
  return _then(_UserProfile(
bio: null == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$User {

 int get id; String get username; String get email;@JsonKey(required: true) UserProfile? get profile; String? get firstName; String? get lastName; String? get dateJoined;
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCopyWith<User> get copyWith => _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is User&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.dateJoined, dateJoined) || other.dateJoined == dateJoined));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,email,profile,firstName,lastName,dateJoined);

@override
String toString() {
  return 'User(id: $id, username: $username, email: $email, profile: $profile, firstName: $firstName, lastName: $lastName, dateJoined: $dateJoined)';
}


}

/// @nodoc
abstract mixin class $UserCopyWith<$Res>  {
  factory $UserCopyWith(User value, $Res Function(User) _then) = _$UserCopyWithImpl;
@useResult
$Res call({
 int id, String username, String email,@JsonKey(required: true) UserProfile? profile, String? firstName, String? lastName, String? dateJoined
});


$UserProfileCopyWith<$Res>? get profile;

}
/// @nodoc
class _$UserCopyWithImpl<$Res>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? username = null,Object? email = null,Object? profile = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? dateJoined = freezed,}) {
  return _then(User(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,profile: freezed == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as UserProfile?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,dateJoined: freezed == dateJoined ? _self.dateJoined : dateJoined // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserProfileCopyWith<$Res>? get profile {
    if (_self.profile == null) {
    return null;
  }

  return $UserProfileCopyWith<$Res>(_self.profile!, (value) {
    return _then(_self.copyWith(profile: value));
  });
}
}


/// Adds pattern-matching-related methods to [User].
extension UserPatterns on User {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _User value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _User value)  $default,){
final _that = this;
switch (_that) {
case _User():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _User value)?  $default,){
final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String username,  String email, @JsonKey(required: true)  UserProfile? profile,  String? firstName,  String? lastName,  String? dateJoined)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.username,_that.email,_that.profile,_that.firstName,_that.lastName,_that.dateJoined);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String username,  String email, @JsonKey(required: true)  UserProfile? profile,  String? firstName,  String? lastName,  String? dateJoined)  $default,) {final _that = this;
switch (_that) {
case _User():
return $default(_that.id,_that.username,_that.email,_that.profile,_that.firstName,_that.lastName,_that.dateJoined);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String username,  String email, @JsonKey(required: true)  UserProfile? profile,  String? firstName,  String? lastName,  String? dateJoined)?  $default,) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.username,_that.email,_that.profile,_that.firstName,_that.lastName,_that.dateJoined);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, checked: true, explicitToJson: true)
class _User implements User {
  const _User({required this.id, required this.username, required this.email, @JsonKey(required: true) required this.profile, required this.firstName, required this.lastName, required this.dateJoined});
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

@override final  int id;
@override final  String username;
@override final  String email;
@override@JsonKey(required: true) final  UserProfile? profile;
@override final  String? firstName;
@override final  String? lastName;
@override final  String? dateJoined;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCopyWith<_User> get copyWith => __$UserCopyWithImpl<_User>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _User&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.dateJoined, dateJoined) || other.dateJoined == dateJoined));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,email,profile,firstName,lastName,dateJoined);

@override
String toString() {
  return 'User(id: $id, username: $username, email: $email, profile: $profile, firstName: $firstName, lastName: $lastName, dateJoined: $dateJoined)';
}


}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) = __$UserCopyWithImpl;
@override @useResult
$Res call({
 int id, String username, String email,@JsonKey(required: true) UserProfile? profile, String? firstName, String? lastName, String? dateJoined
});


@override $UserProfileCopyWith<$Res>? get profile;

}
/// @nodoc
class __$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(this._self, this._then);

  final _User _self;
  final $Res Function(_User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? username = null,Object? email = null,Object? profile = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? dateJoined = freezed,}) {
  return _then(_User(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,profile: freezed == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as UserProfile?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,dateJoined: freezed == dateJoined ? _self.dateJoined : dateJoined // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserProfileCopyWith<$Res>? get profile {
    if (_self.profile == null) {
    return null;
  }

  return $UserProfileCopyWith<$Res>(_self.profile!, (value) {
    return _then(_self.copyWith(profile: value));
  });
}
}


/// @nodoc
mixin _$UserBrief {

 int get id; String get username; String get email;
/// Create a copy of UserBrief
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserBriefCopyWith<UserBrief> get copyWith => _$UserBriefCopyWithImpl<UserBrief>(this as UserBrief, _$identity);

  /// Serializes this UserBrief to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserBrief&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,email);

@override
String toString() {
  return 'UserBrief(id: $id, username: $username, email: $email)';
}


}

/// @nodoc
abstract mixin class $UserBriefCopyWith<$Res>  {
  factory $UserBriefCopyWith(UserBrief value, $Res Function(UserBrief) _then) = _$UserBriefCopyWithImpl;
@useResult
$Res call({
 int id, String username, String email
});




}
/// @nodoc
class _$UserBriefCopyWithImpl<$Res>
    implements $UserBriefCopyWith<$Res> {
  _$UserBriefCopyWithImpl(this._self, this._then);

  final UserBrief _self;
  final $Res Function(UserBrief) _then;

/// Create a copy of UserBrief
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? username = null,Object? email = null,}) {
  return _then(UserBrief(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserBrief].
extension UserBriefPatterns on UserBrief {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserBrief value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserBrief() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserBrief value)  $default,){
final _that = this;
switch (_that) {
case _UserBrief():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserBrief value)?  $default,){
final _that = this;
switch (_that) {
case _UserBrief() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String username,  String email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserBrief() when $default != null:
return $default(_that.id,_that.username,_that.email);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String username,  String email)  $default,) {final _that = this;
switch (_that) {
case _UserBrief():
return $default(_that.id,_that.username,_that.email);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String username,  String email)?  $default,) {final _that = this;
switch (_that) {
case _UserBrief() when $default != null:
return $default(_that.id,_that.username,_that.email);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, checked: true, explicitToJson: true)
class _UserBrief implements UserBrief {
  const _UserBrief({required this.id, required this.username, required this.email});
  factory _UserBrief.fromJson(Map<String, dynamic> json) => _$UserBriefFromJson(json);

@override final  int id;
@override final  String username;
@override final  String email;

/// Create a copy of UserBrief
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserBriefCopyWith<_UserBrief> get copyWith => __$UserBriefCopyWithImpl<_UserBrief>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserBriefToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserBrief&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,email);

@override
String toString() {
  return 'UserBrief(id: $id, username: $username, email: $email)';
}


}

/// @nodoc
abstract mixin class _$UserBriefCopyWith<$Res> implements $UserBriefCopyWith<$Res> {
  factory _$UserBriefCopyWith(_UserBrief value, $Res Function(_UserBrief) _then) = __$UserBriefCopyWithImpl;
@override @useResult
$Res call({
 int id, String username, String email
});




}
/// @nodoc
class __$UserBriefCopyWithImpl<$Res>
    implements _$UserBriefCopyWith<$Res> {
  __$UserBriefCopyWithImpl(this._self, this._then);

  final _UserBrief _self;
  final $Res Function(_UserBrief) _then;

/// Create a copy of UserBrief
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? username = null,Object? email = null,}) {
  return _then(_UserBrief(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$BoardMembership {

 int get id; int get boardId; UserBrief get user; BoardRole get role; String get created;
/// Create a copy of BoardMembership
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BoardMembershipCopyWith<BoardMembership> get copyWith => _$BoardMembershipCopyWithImpl<BoardMembership>(this as BoardMembership, _$identity);

  /// Serializes this BoardMembership to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BoardMembership&&(identical(other.id, id) || other.id == id)&&(identical(other.boardId, boardId) || other.boardId == boardId)&&(identical(other.user, user) || other.user == user)&&(identical(other.role, role) || other.role == role)&&(identical(other.created, created) || other.created == created));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,boardId,user,role,created);

@override
String toString() {
  return 'BoardMembership(id: $id, boardId: $boardId, user: $user, role: $role, created: $created)';
}


}

/// @nodoc
abstract mixin class $BoardMembershipCopyWith<$Res>  {
  factory $BoardMembershipCopyWith(BoardMembership value, $Res Function(BoardMembership) _then) = _$BoardMembershipCopyWithImpl;
@useResult
$Res call({
 int id, int boardId, UserBrief user, BoardRole role, String created
});


$UserBriefCopyWith<$Res> get user;

}
/// @nodoc
class _$BoardMembershipCopyWithImpl<$Res>
    implements $BoardMembershipCopyWith<$Res> {
  _$BoardMembershipCopyWithImpl(this._self, this._then);

  final BoardMembership _self;
  final $Res Function(BoardMembership) _then;

/// Create a copy of BoardMembership
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? boardId = null,Object? user = null,Object? role = null,Object? created = null,}) {
  return _then(BoardMembership(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,boardId: null == boardId ? _self.boardId : boardId // ignore: cast_nullable_to_non_nullable
as int,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserBrief,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as BoardRole,created: null == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of BoardMembership
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserBriefCopyWith<$Res> get user {
  
  return $UserBriefCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [BoardMembership].
extension BoardMembershipPatterns on BoardMembership {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BoardMembership value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BoardMembership() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BoardMembership value)  $default,){
final _that = this;
switch (_that) {
case _BoardMembership():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BoardMembership value)?  $default,){
final _that = this;
switch (_that) {
case _BoardMembership() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int boardId,  UserBrief user,  BoardRole role,  String created)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BoardMembership() when $default != null:
return $default(_that.id,_that.boardId,_that.user,_that.role,_that.created);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int boardId,  UserBrief user,  BoardRole role,  String created)  $default,) {final _that = this;
switch (_that) {
case _BoardMembership():
return $default(_that.id,_that.boardId,_that.user,_that.role,_that.created);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int boardId,  UserBrief user,  BoardRole role,  String created)?  $default,) {final _that = this;
switch (_that) {
case _BoardMembership() when $default != null:
return $default(_that.id,_that.boardId,_that.user,_that.role,_that.created);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, checked: true, explicitToJson: true)
class _BoardMembership implements BoardMembership {
  const _BoardMembership({required this.id, required this.boardId, required this.user, required this.role, required this.created});
  factory _BoardMembership.fromJson(Map<String, dynamic> json) => _$BoardMembershipFromJson(json);

@override final  int id;
@override final  int boardId;
@override final  UserBrief user;
@override final  BoardRole role;
@override final  String created;

/// Create a copy of BoardMembership
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BoardMembershipCopyWith<_BoardMembership> get copyWith => __$BoardMembershipCopyWithImpl<_BoardMembership>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BoardMembershipToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BoardMembership&&(identical(other.id, id) || other.id == id)&&(identical(other.boardId, boardId) || other.boardId == boardId)&&(identical(other.user, user) || other.user == user)&&(identical(other.role, role) || other.role == role)&&(identical(other.created, created) || other.created == created));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,boardId,user,role,created);

@override
String toString() {
  return 'BoardMembership(id: $id, boardId: $boardId, user: $user, role: $role, created: $created)';
}


}

/// @nodoc
abstract mixin class _$BoardMembershipCopyWith<$Res> implements $BoardMembershipCopyWith<$Res> {
  factory _$BoardMembershipCopyWith(_BoardMembership value, $Res Function(_BoardMembership) _then) = __$BoardMembershipCopyWithImpl;
@override @useResult
$Res call({
 int id, int boardId, UserBrief user, BoardRole role, String created
});


@override $UserBriefCopyWith<$Res> get user;

}
/// @nodoc
class __$BoardMembershipCopyWithImpl<$Res>
    implements _$BoardMembershipCopyWith<$Res> {
  __$BoardMembershipCopyWithImpl(this._self, this._then);

  final _BoardMembership _self;
  final $Res Function(_BoardMembership) _then;

/// Create a copy of BoardMembership
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? boardId = null,Object? user = null,Object? role = null,Object? created = null,}) {
  return _then(_BoardMembership(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,boardId: null == boardId ? _self.boardId : boardId // ignore: cast_nullable_to_non_nullable
as int,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserBrief,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as BoardRole,created: null == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of BoardMembership
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserBriefCopyWith<$Res> get user {
  
  return $UserBriefCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
mixin _$BoardMembershipInput {

 String get email; BoardRole get role;
/// Create a copy of BoardMembershipInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BoardMembershipInputCopyWith<BoardMembershipInput> get copyWith => _$BoardMembershipInputCopyWithImpl<BoardMembershipInput>(this as BoardMembershipInput, _$identity);

  /// Serializes this BoardMembershipInput to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BoardMembershipInput&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,role);

@override
String toString() {
  return 'BoardMembershipInput(email: $email, role: $role)';
}


}

/// @nodoc
abstract mixin class $BoardMembershipInputCopyWith<$Res>  {
  factory $BoardMembershipInputCopyWith(BoardMembershipInput value, $Res Function(BoardMembershipInput) _then) = _$BoardMembershipInputCopyWithImpl;
@useResult
$Res call({
 String email, BoardRole role
});




}
/// @nodoc
class _$BoardMembershipInputCopyWithImpl<$Res>
    implements $BoardMembershipInputCopyWith<$Res> {
  _$BoardMembershipInputCopyWithImpl(this._self, this._then);

  final BoardMembershipInput _self;
  final $Res Function(BoardMembershipInput) _then;

/// Create a copy of BoardMembershipInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? role = null,}) {
  return _then(BoardMembershipInput(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as BoardRole,
  ));
}

}


/// Adds pattern-matching-related methods to [BoardMembershipInput].
extension BoardMembershipInputPatterns on BoardMembershipInput {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BoardMembershipInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BoardMembershipInput() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BoardMembershipInput value)  $default,){
final _that = this;
switch (_that) {
case _BoardMembershipInput():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BoardMembershipInput value)?  $default,){
final _that = this;
switch (_that) {
case _BoardMembershipInput() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String email,  BoardRole role)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BoardMembershipInput() when $default != null:
return $default(_that.email,_that.role);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String email,  BoardRole role)  $default,) {final _that = this;
switch (_that) {
case _BoardMembershipInput():
return $default(_that.email,_that.role);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String email,  BoardRole role)?  $default,) {final _that = this;
switch (_that) {
case _BoardMembershipInput() when $default != null:
return $default(_that.email,_that.role);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, checked: true, explicitToJson: true)
class _BoardMembershipInput implements BoardMembershipInput {
  const _BoardMembershipInput({required this.email, required this.role});
  factory _BoardMembershipInput.fromJson(Map<String, dynamic> json) => _$BoardMembershipInputFromJson(json);

@override final  String email;
@override final  BoardRole role;

/// Create a copy of BoardMembershipInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BoardMembershipInputCopyWith<_BoardMembershipInput> get copyWith => __$BoardMembershipInputCopyWithImpl<_BoardMembershipInput>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BoardMembershipInputToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BoardMembershipInput&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,role);

@override
String toString() {
  return 'BoardMembershipInput(email: $email, role: $role)';
}


}

/// @nodoc
abstract mixin class _$BoardMembershipInputCopyWith<$Res> implements $BoardMembershipInputCopyWith<$Res> {
  factory _$BoardMembershipInputCopyWith(_BoardMembershipInput value, $Res Function(_BoardMembershipInput) _then) = __$BoardMembershipInputCopyWithImpl;
@override @useResult
$Res call({
 String email, BoardRole role
});




}
/// @nodoc
class __$BoardMembershipInputCopyWithImpl<$Res>
    implements _$BoardMembershipInputCopyWith<$Res> {
  __$BoardMembershipInputCopyWithImpl(this._self, this._then);

  final _BoardMembershipInput _self;
  final $Res Function(_BoardMembershipInput) _then;

/// Create a copy of BoardMembershipInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? role = null,}) {
  return _then(_BoardMembershipInput(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as BoardRole,
  ));
}


}


/// @nodoc
mixin _$BoardStatus {

 int get id; String get name; int get order; String get color;
/// Create a copy of BoardStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BoardStatusCopyWith<BoardStatus> get copyWith => _$BoardStatusCopyWithImpl<BoardStatus>(this as BoardStatus, _$identity);

  /// Serializes this BoardStatus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BoardStatus&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.order, order) || other.order == order)&&(identical(other.color, color) || other.color == color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,order,color);

@override
String toString() {
  return 'BoardStatus(id: $id, name: $name, order: $order, color: $color)';
}


}

/// @nodoc
abstract mixin class $BoardStatusCopyWith<$Res>  {
  factory $BoardStatusCopyWith(BoardStatus value, $Res Function(BoardStatus) _then) = _$BoardStatusCopyWithImpl;
@useResult
$Res call({
 int id, String name, int order, String color
});




}
/// @nodoc
class _$BoardStatusCopyWithImpl<$Res>
    implements $BoardStatusCopyWith<$Res> {
  _$BoardStatusCopyWithImpl(this._self, this._then);

  final BoardStatus _self;
  final $Res Function(BoardStatus) _then;

/// Create a copy of BoardStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? order = null,Object? color = null,}) {
  return _then(BoardStatus(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BoardStatus].
extension BoardStatusPatterns on BoardStatus {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BoardStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BoardStatus() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BoardStatus value)  $default,){
final _that = this;
switch (_that) {
case _BoardStatus():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BoardStatus value)?  $default,){
final _that = this;
switch (_that) {
case _BoardStatus() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  int order,  String color)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BoardStatus() when $default != null:
return $default(_that.id,_that.name,_that.order,_that.color);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  int order,  String color)  $default,) {final _that = this;
switch (_that) {
case _BoardStatus():
return $default(_that.id,_that.name,_that.order,_that.color);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  int order,  String color)?  $default,) {final _that = this;
switch (_that) {
case _BoardStatus() when $default != null:
return $default(_that.id,_that.name,_that.order,_that.color);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, checked: true, explicitToJson: true)
class _BoardStatus implements BoardStatus {
  const _BoardStatus({required this.id, required this.name, required this.order, required this.color});
  factory _BoardStatus.fromJson(Map<String, dynamic> json) => _$BoardStatusFromJson(json);

@override final  int id;
@override final  String name;
@override final  int order;
@override final  String color;

/// Create a copy of BoardStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BoardStatusCopyWith<_BoardStatus> get copyWith => __$BoardStatusCopyWithImpl<_BoardStatus>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BoardStatusToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BoardStatus&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.order, order) || other.order == order)&&(identical(other.color, color) || other.color == color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,order,color);

@override
String toString() {
  return 'BoardStatus(id: $id, name: $name, order: $order, color: $color)';
}


}

/// @nodoc
abstract mixin class _$BoardStatusCopyWith<$Res> implements $BoardStatusCopyWith<$Res> {
  factory _$BoardStatusCopyWith(_BoardStatus value, $Res Function(_BoardStatus) _then) = __$BoardStatusCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, int order, String color
});




}
/// @nodoc
class __$BoardStatusCopyWithImpl<$Res>
    implements _$BoardStatusCopyWith<$Res> {
  __$BoardStatusCopyWithImpl(this._self, this._then);

  final _BoardStatus _self;
  final $Res Function(_BoardStatus) _then;

/// Create a copy of BoardStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? order = null,Object? color = null,}) {
  return _then(_BoardStatus(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$BoardStatusInput {

 String get name; int get order; String get color;
/// Create a copy of BoardStatusInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BoardStatusInputCopyWith<BoardStatusInput> get copyWith => _$BoardStatusInputCopyWithImpl<BoardStatusInput>(this as BoardStatusInput, _$identity);

  /// Serializes this BoardStatusInput to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BoardStatusInput&&(identical(other.name, name) || other.name == name)&&(identical(other.order, order) || other.order == order)&&(identical(other.color, color) || other.color == color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,order,color);

@override
String toString() {
  return 'BoardStatusInput(name: $name, order: $order, color: $color)';
}


}

/// @nodoc
abstract mixin class $BoardStatusInputCopyWith<$Res>  {
  factory $BoardStatusInputCopyWith(BoardStatusInput value, $Res Function(BoardStatusInput) _then) = _$BoardStatusInputCopyWithImpl;
@useResult
$Res call({
 String name, int order, String color
});




}
/// @nodoc
class _$BoardStatusInputCopyWithImpl<$Res>
    implements $BoardStatusInputCopyWith<$Res> {
  _$BoardStatusInputCopyWithImpl(this._self, this._then);

  final BoardStatusInput _self;
  final $Res Function(BoardStatusInput) _then;

/// Create a copy of BoardStatusInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? order = null,Object? color = null,}) {
  return _then(BoardStatusInput(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BoardStatusInput].
extension BoardStatusInputPatterns on BoardStatusInput {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BoardStatusInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BoardStatusInput() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BoardStatusInput value)  $default,){
final _that = this;
switch (_that) {
case _BoardStatusInput():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BoardStatusInput value)?  $default,){
final _that = this;
switch (_that) {
case _BoardStatusInput() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  int order,  String color)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BoardStatusInput() when $default != null:
return $default(_that.name,_that.order,_that.color);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  int order,  String color)  $default,) {final _that = this;
switch (_that) {
case _BoardStatusInput():
return $default(_that.name,_that.order,_that.color);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  int order,  String color)?  $default,) {final _that = this;
switch (_that) {
case _BoardStatusInput() when $default != null:
return $default(_that.name,_that.order,_that.color);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, checked: true, explicitToJson: true)
class _BoardStatusInput implements BoardStatusInput {
  const _BoardStatusInput({required this.name, required this.order, required this.color});
  factory _BoardStatusInput.fromJson(Map<String, dynamic> json) => _$BoardStatusInputFromJson(json);

@override final  String name;
@override final  int order;
@override final  String color;

/// Create a copy of BoardStatusInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BoardStatusInputCopyWith<_BoardStatusInput> get copyWith => __$BoardStatusInputCopyWithImpl<_BoardStatusInput>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BoardStatusInputToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BoardStatusInput&&(identical(other.name, name) || other.name == name)&&(identical(other.order, order) || other.order == order)&&(identical(other.color, color) || other.color == color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,order,color);

@override
String toString() {
  return 'BoardStatusInput(name: $name, order: $order, color: $color)';
}


}

/// @nodoc
abstract mixin class _$BoardStatusInputCopyWith<$Res> implements $BoardStatusInputCopyWith<$Res> {
  factory _$BoardStatusInputCopyWith(_BoardStatusInput value, $Res Function(_BoardStatusInput) _then) = __$BoardStatusInputCopyWithImpl;
@override @useResult
$Res call({
 String name, int order, String color
});




}
/// @nodoc
class __$BoardStatusInputCopyWithImpl<$Res>
    implements _$BoardStatusInputCopyWith<$Res> {
  __$BoardStatusInputCopyWithImpl(this._self, this._then);

  final _BoardStatusInput _self;
  final $Res Function(_BoardStatusInput) _then;

/// Create a copy of BoardStatusInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? order = null,Object? color = null,}) {
  return _then(_BoardStatusInput(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Sprint {

 int get id; String get name;@JsonKey(required: true) String? get startDate;@JsonKey(required: true) String? get endDate; String get created; String get modified;
/// Create a copy of Sprint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SprintCopyWith<Sprint> get copyWith => _$SprintCopyWithImpl<Sprint>(this as Sprint, _$identity);

  /// Serializes this Sprint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sprint&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.created, created) || other.created == created)&&(identical(other.modified, modified) || other.modified == modified));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,startDate,endDate,created,modified);

@override
String toString() {
  return 'Sprint(id: $id, name: $name, startDate: $startDate, endDate: $endDate, created: $created, modified: $modified)';
}


}

/// @nodoc
abstract mixin class $SprintCopyWith<$Res>  {
  factory $SprintCopyWith(Sprint value, $Res Function(Sprint) _then) = _$SprintCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(required: true) String? startDate,@JsonKey(required: true) String? endDate, String created, String modified
});




}
/// @nodoc
class _$SprintCopyWithImpl<$Res>
    implements $SprintCopyWith<$Res> {
  _$SprintCopyWithImpl(this._self, this._then);

  final Sprint _self;
  final $Res Function(Sprint) _then;

/// Create a copy of Sprint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? startDate = freezed,Object? endDate = freezed,Object? created = null,Object? modified = null,}) {
  return _then(Sprint(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,created: null == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as String,modified: null == modified ? _self.modified : modified // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Sprint].
extension SprintPatterns on Sprint {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sprint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sprint() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sprint value)  $default,){
final _that = this;
switch (_that) {
case _Sprint():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sprint value)?  $default,){
final _that = this;
switch (_that) {
case _Sprint() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(required: true)  String? startDate, @JsonKey(required: true)  String? endDate,  String created,  String modified)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sprint() when $default != null:
return $default(_that.id,_that.name,_that.startDate,_that.endDate,_that.created,_that.modified);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(required: true)  String? startDate, @JsonKey(required: true)  String? endDate,  String created,  String modified)  $default,) {final _that = this;
switch (_that) {
case _Sprint():
return $default(_that.id,_that.name,_that.startDate,_that.endDate,_that.created,_that.modified);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name, @JsonKey(required: true)  String? startDate, @JsonKey(required: true)  String? endDate,  String created,  String modified)?  $default,) {final _that = this;
switch (_that) {
case _Sprint() when $default != null:
return $default(_that.id,_that.name,_that.startDate,_that.endDate,_that.created,_that.modified);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, checked: true, explicitToJson: true)
class _Sprint implements Sprint {
  const _Sprint({required this.id, required this.name, @JsonKey(required: true) required this.startDate, @JsonKey(required: true) required this.endDate, required this.created, required this.modified});
  factory _Sprint.fromJson(Map<String, dynamic> json) => _$SprintFromJson(json);

@override final  int id;
@override final  String name;
@override@JsonKey(required: true) final  String? startDate;
@override@JsonKey(required: true) final  String? endDate;
@override final  String created;
@override final  String modified;

/// Create a copy of Sprint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SprintCopyWith<_Sprint> get copyWith => __$SprintCopyWithImpl<_Sprint>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SprintToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sprint&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.created, created) || other.created == created)&&(identical(other.modified, modified) || other.modified == modified));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,startDate,endDate,created,modified);

@override
String toString() {
  return 'Sprint(id: $id, name: $name, startDate: $startDate, endDate: $endDate, created: $created, modified: $modified)';
}


}

/// @nodoc
abstract mixin class _$SprintCopyWith<$Res> implements $SprintCopyWith<$Res> {
  factory _$SprintCopyWith(_Sprint value, $Res Function(_Sprint) _then) = __$SprintCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(required: true) String? startDate,@JsonKey(required: true) String? endDate, String created, String modified
});




}
/// @nodoc
class __$SprintCopyWithImpl<$Res>
    implements _$SprintCopyWith<$Res> {
  __$SprintCopyWithImpl(this._self, this._then);

  final _Sprint _self;
  final $Res Function(_Sprint) _then;

/// Create a copy of Sprint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? startDate = freezed,Object? endDate = freezed,Object? created = null,Object? modified = null,}) {
  return _then(_Sprint(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,created: null == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as String,modified: null == modified ? _self.modified : modified // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SprintInput {

 String get name;@JsonKey(required: true) String? get startDate;@JsonKey(required: true) String? get endDate;
/// Create a copy of SprintInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SprintInputCopyWith<SprintInput> get copyWith => _$SprintInputCopyWithImpl<SprintInput>(this as SprintInput, _$identity);

  /// Serializes this SprintInput to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SprintInput&&(identical(other.name, name) || other.name == name)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,startDate,endDate);

@override
String toString() {
  return 'SprintInput(name: $name, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class $SprintInputCopyWith<$Res>  {
  factory $SprintInputCopyWith(SprintInput value, $Res Function(SprintInput) _then) = _$SprintInputCopyWithImpl;
@useResult
$Res call({
 String name,@JsonKey(required: true) String? startDate,@JsonKey(required: true) String? endDate
});




}
/// @nodoc
class _$SprintInputCopyWithImpl<$Res>
    implements $SprintInputCopyWith<$Res> {
  _$SprintInputCopyWithImpl(this._self, this._then);

  final SprintInput _self;
  final $Res Function(SprintInput) _then;

/// Create a copy of SprintInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? startDate = freezed,Object? endDate = freezed,}) {
  return _then(SprintInput(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SprintInput].
extension SprintInputPatterns on SprintInput {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SprintInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SprintInput() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SprintInput value)  $default,){
final _that = this;
switch (_that) {
case _SprintInput():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SprintInput value)?  $default,){
final _that = this;
switch (_that) {
case _SprintInput() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name, @JsonKey(required: true)  String? startDate, @JsonKey(required: true)  String? endDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SprintInput() when $default != null:
return $default(_that.name,_that.startDate,_that.endDate);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name, @JsonKey(required: true)  String? startDate, @JsonKey(required: true)  String? endDate)  $default,) {final _that = this;
switch (_that) {
case _SprintInput():
return $default(_that.name,_that.startDate,_that.endDate);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name, @JsonKey(required: true)  String? startDate, @JsonKey(required: true)  String? endDate)?  $default,) {final _that = this;
switch (_that) {
case _SprintInput() when $default != null:
return $default(_that.name,_that.startDate,_that.endDate);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, checked: true, explicitToJson: true)
class _SprintInput implements SprintInput {
  const _SprintInput({required this.name, @JsonKey(required: true) required this.startDate, @JsonKey(required: true) required this.endDate});
  factory _SprintInput.fromJson(Map<String, dynamic> json) => _$SprintInputFromJson(json);

@override final  String name;
@override@JsonKey(required: true) final  String? startDate;
@override@JsonKey(required: true) final  String? endDate;

/// Create a copy of SprintInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SprintInputCopyWith<_SprintInput> get copyWith => __$SprintInputCopyWithImpl<_SprintInput>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SprintInputToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SprintInput&&(identical(other.name, name) || other.name == name)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,startDate,endDate);

@override
String toString() {
  return 'SprintInput(name: $name, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class _$SprintInputCopyWith<$Res> implements $SprintInputCopyWith<$Res> {
  factory _$SprintInputCopyWith(_SprintInput value, $Res Function(_SprintInput) _then) = __$SprintInputCopyWithImpl;
@override @useResult
$Res call({
 String name,@JsonKey(required: true) String? startDate,@JsonKey(required: true) String? endDate
});




}
/// @nodoc
class __$SprintInputCopyWithImpl<$Res>
    implements _$SprintInputCopyWith<$Res> {
  __$SprintInputCopyWithImpl(this._self, this._then);

  final _SprintInput _self;
  final $Res Function(_SprintInput) _then;

/// Create a copy of SprintInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? startDate = freezed,Object? endDate = freezed,}) {
  return _then(_SprintInput(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$TaskStatusBrief {

 int get id; String get name; String get color;
/// Create a copy of TaskStatusBrief
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskStatusBriefCopyWith<TaskStatusBrief> get copyWith => _$TaskStatusBriefCopyWithImpl<TaskStatusBrief>(this as TaskStatusBrief, _$identity);

  /// Serializes this TaskStatusBrief to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskStatusBrief&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.color, color) || other.color == color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,color);

@override
String toString() {
  return 'TaskStatusBrief(id: $id, name: $name, color: $color)';
}


}

/// @nodoc
abstract mixin class $TaskStatusBriefCopyWith<$Res>  {
  factory $TaskStatusBriefCopyWith(TaskStatusBrief value, $Res Function(TaskStatusBrief) _then) = _$TaskStatusBriefCopyWithImpl;
@useResult
$Res call({
 int id, String name, String color
});




}
/// @nodoc
class _$TaskStatusBriefCopyWithImpl<$Res>
    implements $TaskStatusBriefCopyWith<$Res> {
  _$TaskStatusBriefCopyWithImpl(this._self, this._then);

  final TaskStatusBrief _self;
  final $Res Function(TaskStatusBrief) _then;

/// Create a copy of TaskStatusBrief
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? color = null,}) {
  return _then(TaskStatusBrief(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TaskStatusBrief].
extension TaskStatusBriefPatterns on TaskStatusBrief {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskStatusBrief value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskStatusBrief() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskStatusBrief value)  $default,){
final _that = this;
switch (_that) {
case _TaskStatusBrief():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskStatusBrief value)?  $default,){
final _that = this;
switch (_that) {
case _TaskStatusBrief() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String color)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskStatusBrief() when $default != null:
return $default(_that.id,_that.name,_that.color);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String color)  $default,) {final _that = this;
switch (_that) {
case _TaskStatusBrief():
return $default(_that.id,_that.name,_that.color);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String color)?  $default,) {final _that = this;
switch (_that) {
case _TaskStatusBrief() when $default != null:
return $default(_that.id,_that.name,_that.color);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, checked: true, explicitToJson: true)
class _TaskStatusBrief implements TaskStatusBrief {
  const _TaskStatusBrief({required this.id, required this.name, required this.color});
  factory _TaskStatusBrief.fromJson(Map<String, dynamic> json) => _$TaskStatusBriefFromJson(json);

@override final  int id;
@override final  String name;
@override final  String color;

/// Create a copy of TaskStatusBrief
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskStatusBriefCopyWith<_TaskStatusBrief> get copyWith => __$TaskStatusBriefCopyWithImpl<_TaskStatusBrief>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaskStatusBriefToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskStatusBrief&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.color, color) || other.color == color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,color);

@override
String toString() {
  return 'TaskStatusBrief(id: $id, name: $name, color: $color)';
}


}

/// @nodoc
abstract mixin class _$TaskStatusBriefCopyWith<$Res> implements $TaskStatusBriefCopyWith<$Res> {
  factory _$TaskStatusBriefCopyWith(_TaskStatusBrief value, $Res Function(_TaskStatusBrief) _then) = __$TaskStatusBriefCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String color
});




}
/// @nodoc
class __$TaskStatusBriefCopyWithImpl<$Res>
    implements _$TaskStatusBriefCopyWith<$Res> {
  __$TaskStatusBriefCopyWithImpl(this._self, this._then);

  final _TaskStatusBrief _self;
  final $Res Function(_TaskStatusBrief) _then;

/// Create a copy of TaskStatusBrief
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? color = null,}) {
  return _then(_TaskStatusBrief(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$TaskSprintBrief {

 int get id; String get name;
/// Create a copy of TaskSprintBrief
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskSprintBriefCopyWith<TaskSprintBrief> get copyWith => _$TaskSprintBriefCopyWithImpl<TaskSprintBrief>(this as TaskSprintBrief, _$identity);

  /// Serializes this TaskSprintBrief to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskSprintBrief&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'TaskSprintBrief(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $TaskSprintBriefCopyWith<$Res>  {
  factory $TaskSprintBriefCopyWith(TaskSprintBrief value, $Res Function(TaskSprintBrief) _then) = _$TaskSprintBriefCopyWithImpl;
@useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class _$TaskSprintBriefCopyWithImpl<$Res>
    implements $TaskSprintBriefCopyWith<$Res> {
  _$TaskSprintBriefCopyWithImpl(this._self, this._then);

  final TaskSprintBrief _self;
  final $Res Function(TaskSprintBrief) _then;

/// Create a copy of TaskSprintBrief
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(TaskSprintBrief(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TaskSprintBrief].
extension TaskSprintBriefPatterns on TaskSprintBrief {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskSprintBrief value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskSprintBrief() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskSprintBrief value)  $default,){
final _that = this;
switch (_that) {
case _TaskSprintBrief():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskSprintBrief value)?  $default,){
final _that = this;
switch (_that) {
case _TaskSprintBrief() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskSprintBrief() when $default != null:
return $default(_that.id,_that.name);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name)  $default,) {final _that = this;
switch (_that) {
case _TaskSprintBrief():
return $default(_that.id,_that.name);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name)?  $default,) {final _that = this;
switch (_that) {
case _TaskSprintBrief() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, checked: true, explicitToJson: true)
class _TaskSprintBrief implements TaskSprintBrief {
  const _TaskSprintBrief({required this.id, required this.name});
  factory _TaskSprintBrief.fromJson(Map<String, dynamic> json) => _$TaskSprintBriefFromJson(json);

@override final  int id;
@override final  String name;

/// Create a copy of TaskSprintBrief
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskSprintBriefCopyWith<_TaskSprintBrief> get copyWith => __$TaskSprintBriefCopyWithImpl<_TaskSprintBrief>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaskSprintBriefToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskSprintBrief&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'TaskSprintBrief(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$TaskSprintBriefCopyWith<$Res> implements $TaskSprintBriefCopyWith<$Res> {
  factory _$TaskSprintBriefCopyWith(_TaskSprintBrief value, $Res Function(_TaskSprintBrief) _then) = __$TaskSprintBriefCopyWithImpl;
@override @useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class __$TaskSprintBriefCopyWithImpl<$Res>
    implements _$TaskSprintBriefCopyWith<$Res> {
  __$TaskSprintBriefCopyWithImpl(this._self, this._then);

  final _TaskSprintBrief _self;
  final $Res Function(_TaskSprintBrief) _then;

/// Create a copy of TaskSprintBrief
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_TaskSprintBrief(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Task {

 int get id; int get boardId;@JsonKey(required: true) TaskSprintBrief? get sprint;@JsonKey(required: true) TaskStatusBrief? get status; int get userId;@JsonKey(required: true) int? get assignedToId; String get title; String get description; String get created; String get modified;
/// Create a copy of Task
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskCopyWith<Task> get copyWith => _$TaskCopyWithImpl<Task>(this as Task, _$identity);

  /// Serializes this Task to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Task&&(identical(other.id, id) || other.id == id)&&(identical(other.boardId, boardId) || other.boardId == boardId)&&(identical(other.sprint, sprint) || other.sprint == sprint)&&(identical(other.status, status) || other.status == status)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.assignedToId, assignedToId) || other.assignedToId == assignedToId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.created, created) || other.created == created)&&(identical(other.modified, modified) || other.modified == modified));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,boardId,sprint,status,userId,assignedToId,title,description,created,modified);

@override
String toString() {
  return 'Task(id: $id, boardId: $boardId, sprint: $sprint, status: $status, userId: $userId, assignedToId: $assignedToId, title: $title, description: $description, created: $created, modified: $modified)';
}


}

/// @nodoc
abstract mixin class $TaskCopyWith<$Res>  {
  factory $TaskCopyWith(Task value, $Res Function(Task) _then) = _$TaskCopyWithImpl;
@useResult
$Res call({
 int id, int boardId,@JsonKey(required: true) TaskSprintBrief? sprint,@JsonKey(required: true) TaskStatusBrief? status, int userId,@JsonKey(required: true) int? assignedToId, String title, String description, String created, String modified
});


$TaskSprintBriefCopyWith<$Res>? get sprint;$TaskStatusBriefCopyWith<$Res>? get status;

}
/// @nodoc
class _$TaskCopyWithImpl<$Res>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._self, this._then);

  final Task _self;
  final $Res Function(Task) _then;

/// Create a copy of Task
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? boardId = null,Object? sprint = freezed,Object? status = freezed,Object? userId = null,Object? assignedToId = freezed,Object? title = null,Object? description = null,Object? created = null,Object? modified = null,}) {
  return _then(Task(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,boardId: null == boardId ? _self.boardId : boardId // ignore: cast_nullable_to_non_nullable
as int,sprint: freezed == sprint ? _self.sprint : sprint // ignore: cast_nullable_to_non_nullable
as TaskSprintBrief?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TaskStatusBrief?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,assignedToId: freezed == assignedToId ? _self.assignedToId : assignedToId // ignore: cast_nullable_to_non_nullable
as int?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,created: null == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as String,modified: null == modified ? _self.modified : modified // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of Task
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskSprintBriefCopyWith<$Res>? get sprint {
    if (_self.sprint == null) {
    return null;
  }

  return $TaskSprintBriefCopyWith<$Res>(_self.sprint!, (value) {
    return _then(_self.copyWith(sprint: value));
  });
}/// Create a copy of Task
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskStatusBriefCopyWith<$Res>? get status {
    if (_self.status == null) {
    return null;
  }

  return $TaskStatusBriefCopyWith<$Res>(_self.status!, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}


/// Adds pattern-matching-related methods to [Task].
extension TaskPatterns on Task {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Task value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Task() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Task value)  $default,){
final _that = this;
switch (_that) {
case _Task():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Task value)?  $default,){
final _that = this;
switch (_that) {
case _Task() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int boardId, @JsonKey(required: true)  TaskSprintBrief? sprint, @JsonKey(required: true)  TaskStatusBrief? status,  int userId, @JsonKey(required: true)  int? assignedToId,  String title,  String description,  String created,  String modified)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Task() when $default != null:
return $default(_that.id,_that.boardId,_that.sprint,_that.status,_that.userId,_that.assignedToId,_that.title,_that.description,_that.created,_that.modified);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int boardId, @JsonKey(required: true)  TaskSprintBrief? sprint, @JsonKey(required: true)  TaskStatusBrief? status,  int userId, @JsonKey(required: true)  int? assignedToId,  String title,  String description,  String created,  String modified)  $default,) {final _that = this;
switch (_that) {
case _Task():
return $default(_that.id,_that.boardId,_that.sprint,_that.status,_that.userId,_that.assignedToId,_that.title,_that.description,_that.created,_that.modified);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int boardId, @JsonKey(required: true)  TaskSprintBrief? sprint, @JsonKey(required: true)  TaskStatusBrief? status,  int userId, @JsonKey(required: true)  int? assignedToId,  String title,  String description,  String created,  String modified)?  $default,) {final _that = this;
switch (_that) {
case _Task() when $default != null:
return $default(_that.id,_that.boardId,_that.sprint,_that.status,_that.userId,_that.assignedToId,_that.title,_that.description,_that.created,_that.modified);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, checked: true, explicitToJson: true)
class _Task implements Task {
  const _Task({required this.id, required this.boardId, @JsonKey(required: true) required this.sprint, @JsonKey(required: true) required this.status, required this.userId, @JsonKey(required: true) required this.assignedToId, required this.title, required this.description, required this.created, required this.modified});
  factory _Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

@override final  int id;
@override final  int boardId;
@override@JsonKey(required: true) final  TaskSprintBrief? sprint;
@override@JsonKey(required: true) final  TaskStatusBrief? status;
@override final  int userId;
@override@JsonKey(required: true) final  int? assignedToId;
@override final  String title;
@override final  String description;
@override final  String created;
@override final  String modified;

/// Create a copy of Task
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskCopyWith<_Task> get copyWith => __$TaskCopyWithImpl<_Task>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaskToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Task&&(identical(other.id, id) || other.id == id)&&(identical(other.boardId, boardId) || other.boardId == boardId)&&(identical(other.sprint, sprint) || other.sprint == sprint)&&(identical(other.status, status) || other.status == status)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.assignedToId, assignedToId) || other.assignedToId == assignedToId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.created, created) || other.created == created)&&(identical(other.modified, modified) || other.modified == modified));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,boardId,sprint,status,userId,assignedToId,title,description,created,modified);

@override
String toString() {
  return 'Task(id: $id, boardId: $boardId, sprint: $sprint, status: $status, userId: $userId, assignedToId: $assignedToId, title: $title, description: $description, created: $created, modified: $modified)';
}


}

/// @nodoc
abstract mixin class _$TaskCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$TaskCopyWith(_Task value, $Res Function(_Task) _then) = __$TaskCopyWithImpl;
@override @useResult
$Res call({
 int id, int boardId,@JsonKey(required: true) TaskSprintBrief? sprint,@JsonKey(required: true) TaskStatusBrief? status, int userId,@JsonKey(required: true) int? assignedToId, String title, String description, String created, String modified
});


@override $TaskSprintBriefCopyWith<$Res>? get sprint;@override $TaskStatusBriefCopyWith<$Res>? get status;

}
/// @nodoc
class __$TaskCopyWithImpl<$Res>
    implements _$TaskCopyWith<$Res> {
  __$TaskCopyWithImpl(this._self, this._then);

  final _Task _self;
  final $Res Function(_Task) _then;

/// Create a copy of Task
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? boardId = null,Object? sprint = freezed,Object? status = freezed,Object? userId = null,Object? assignedToId = freezed,Object? title = null,Object? description = null,Object? created = null,Object? modified = null,}) {
  return _then(_Task(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,boardId: null == boardId ? _self.boardId : boardId // ignore: cast_nullable_to_non_nullable
as int,sprint: freezed == sprint ? _self.sprint : sprint // ignore: cast_nullable_to_non_nullable
as TaskSprintBrief?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TaskStatusBrief?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,assignedToId: freezed == assignedToId ? _self.assignedToId : assignedToId // ignore: cast_nullable_to_non_nullable
as int?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,created: null == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as String,modified: null == modified ? _self.modified : modified // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of Task
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskSprintBriefCopyWith<$Res>? get sprint {
    if (_self.sprint == null) {
    return null;
  }

  return $TaskSprintBriefCopyWith<$Res>(_self.sprint!, (value) {
    return _then(_self.copyWith(sprint: value));
  });
}/// Create a copy of Task
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskStatusBriefCopyWith<$Res>? get status {
    if (_self.status == null) {
    return null;
  }

  return $TaskStatusBriefCopyWith<$Res>(_self.status!, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}


/// @nodoc
mixin _$TaskInput {

 String get title; String get description; int? get statusId; int? get sprintId;@JsonKey(required: true) int? get assignedToId;
/// Create a copy of TaskInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskInputCopyWith<TaskInput> get copyWith => _$TaskInputCopyWithImpl<TaskInput>(this as TaskInput, _$identity);

  /// Serializes this TaskInput to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskInput&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.statusId, statusId) || other.statusId == statusId)&&(identical(other.sprintId, sprintId) || other.sprintId == sprintId)&&(identical(other.assignedToId, assignedToId) || other.assignedToId == assignedToId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,statusId,sprintId,assignedToId);

@override
String toString() {
  return 'TaskInput(title: $title, description: $description, statusId: $statusId, sprintId: $sprintId, assignedToId: $assignedToId)';
}


}

/// @nodoc
abstract mixin class $TaskInputCopyWith<$Res>  {
  factory $TaskInputCopyWith(TaskInput value, $Res Function(TaskInput) _then) = _$TaskInputCopyWithImpl;
@useResult
$Res call({
 String title, String description, int? statusId, int? sprintId,@JsonKey(required: true) int? assignedToId
});




}
/// @nodoc
class _$TaskInputCopyWithImpl<$Res>
    implements $TaskInputCopyWith<$Res> {
  _$TaskInputCopyWithImpl(this._self, this._then);

  final TaskInput _self;
  final $Res Function(TaskInput) _then;

/// Create a copy of TaskInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? description = null,Object? statusId = freezed,Object? sprintId = freezed,Object? assignedToId = freezed,}) {
  return _then(TaskInput(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,statusId: freezed == statusId ? _self.statusId : statusId // ignore: cast_nullable_to_non_nullable
as int?,sprintId: freezed == sprintId ? _self.sprintId : sprintId // ignore: cast_nullable_to_non_nullable
as int?,assignedToId: freezed == assignedToId ? _self.assignedToId : assignedToId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [TaskInput].
extension TaskInputPatterns on TaskInput {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskInput() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskInput value)  $default,){
final _that = this;
switch (_that) {
case _TaskInput():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskInput value)?  $default,){
final _that = this;
switch (_that) {
case _TaskInput() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String description,  int? statusId,  int? sprintId, @JsonKey(required: true)  int? assignedToId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskInput() when $default != null:
return $default(_that.title,_that.description,_that.statusId,_that.sprintId,_that.assignedToId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String description,  int? statusId,  int? sprintId, @JsonKey(required: true)  int? assignedToId)  $default,) {final _that = this;
switch (_that) {
case _TaskInput():
return $default(_that.title,_that.description,_that.statusId,_that.sprintId,_that.assignedToId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String description,  int? statusId,  int? sprintId, @JsonKey(required: true)  int? assignedToId)?  $default,) {final _that = this;
switch (_that) {
case _TaskInput() when $default != null:
return $default(_that.title,_that.description,_that.statusId,_that.sprintId,_that.assignedToId);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, checked: true, explicitToJson: true)
class _TaskInput implements TaskInput {
  const _TaskInput({required this.title, required this.description, required this.statusId, required this.sprintId, @JsonKey(required: true) required this.assignedToId});
  factory _TaskInput.fromJson(Map<String, dynamic> json) => _$TaskInputFromJson(json);

@override final  String title;
@override final  String description;
@override final  int? statusId;
@override final  int? sprintId;
@override@JsonKey(required: true) final  int? assignedToId;

/// Create a copy of TaskInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskInputCopyWith<_TaskInput> get copyWith => __$TaskInputCopyWithImpl<_TaskInput>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaskInputToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskInput&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.statusId, statusId) || other.statusId == statusId)&&(identical(other.sprintId, sprintId) || other.sprintId == sprintId)&&(identical(other.assignedToId, assignedToId) || other.assignedToId == assignedToId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,statusId,sprintId,assignedToId);

@override
String toString() {
  return 'TaskInput(title: $title, description: $description, statusId: $statusId, sprintId: $sprintId, assignedToId: $assignedToId)';
}


}

/// @nodoc
abstract mixin class _$TaskInputCopyWith<$Res> implements $TaskInputCopyWith<$Res> {
  factory _$TaskInputCopyWith(_TaskInput value, $Res Function(_TaskInput) _then) = __$TaskInputCopyWithImpl;
@override @useResult
$Res call({
 String title, String description, int? statusId, int? sprintId,@JsonKey(required: true) int? assignedToId
});




}
/// @nodoc
class __$TaskInputCopyWithImpl<$Res>
    implements _$TaskInputCopyWith<$Res> {
  __$TaskInputCopyWithImpl(this._self, this._then);

  final _TaskInput _self;
  final $Res Function(_TaskInput) _then;

/// Create a copy of TaskInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = null,Object? statusId = freezed,Object? sprintId = freezed,Object? assignedToId = freezed,}) {
  return _then(_TaskInput(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,statusId: freezed == statusId ? _self.statusId : statusId // ignore: cast_nullable_to_non_nullable
as int?,sprintId: freezed == sprintId ? _self.sprintId : sprintId // ignore: cast_nullable_to_non_nullable
as int?,assignedToId: freezed == assignedToId ? _self.assignedToId : assignedToId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$TokenPair {

 String get access; String get refresh;
/// Create a copy of TokenPair
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TokenPairCopyWith<TokenPair> get copyWith => _$TokenPairCopyWithImpl<TokenPair>(this as TokenPair, _$identity);

  /// Serializes this TokenPair to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TokenPair&&(identical(other.access, access) || other.access == access)&&(identical(other.refresh, refresh) || other.refresh == refresh));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,access,refresh);

@override
String toString() {
  return 'TokenPair(access: $access, refresh: $refresh)';
}


}

/// @nodoc
abstract mixin class $TokenPairCopyWith<$Res>  {
  factory $TokenPairCopyWith(TokenPair value, $Res Function(TokenPair) _then) = _$TokenPairCopyWithImpl;
@useResult
$Res call({
 String access, String refresh
});




}
/// @nodoc
class _$TokenPairCopyWithImpl<$Res>
    implements $TokenPairCopyWith<$Res> {
  _$TokenPairCopyWithImpl(this._self, this._then);

  final TokenPair _self;
  final $Res Function(TokenPair) _then;

/// Create a copy of TokenPair
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? access = null,Object? refresh = null,}) {
  return _then(TokenPair(
access: null == access ? _self.access : access // ignore: cast_nullable_to_non_nullable
as String,refresh: null == refresh ? _self.refresh : refresh // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TokenPair].
extension TokenPairPatterns on TokenPair {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TokenPair value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TokenPair() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TokenPair value)  $default,){
final _that = this;
switch (_that) {
case _TokenPair():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TokenPair value)?  $default,){
final _that = this;
switch (_that) {
case _TokenPair() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String access,  String refresh)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TokenPair() when $default != null:
return $default(_that.access,_that.refresh);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String access,  String refresh)  $default,) {final _that = this;
switch (_that) {
case _TokenPair():
return $default(_that.access,_that.refresh);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String access,  String refresh)?  $default,) {final _that = this;
switch (_that) {
case _TokenPair() when $default != null:
return $default(_that.access,_that.refresh);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, checked: true, explicitToJson: true)
class _TokenPair implements TokenPair {
  const _TokenPair({required this.access, required this.refresh});
  factory _TokenPair.fromJson(Map<String, dynamic> json) => _$TokenPairFromJson(json);

@override final  String access;
@override final  String refresh;

/// Create a copy of TokenPair
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TokenPairCopyWith<_TokenPair> get copyWith => __$TokenPairCopyWithImpl<_TokenPair>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TokenPairToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TokenPair&&(identical(other.access, access) || other.access == access)&&(identical(other.refresh, refresh) || other.refresh == refresh));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,access,refresh);

@override
String toString() {
  return 'TokenPair(access: $access, refresh: $refresh)';
}


}

/// @nodoc
abstract mixin class _$TokenPairCopyWith<$Res> implements $TokenPairCopyWith<$Res> {
  factory _$TokenPairCopyWith(_TokenPair value, $Res Function(_TokenPair) _then) = __$TokenPairCopyWithImpl;
@override @useResult
$Res call({
 String access, String refresh
});




}
/// @nodoc
class __$TokenPairCopyWithImpl<$Res>
    implements _$TokenPairCopyWith<$Res> {
  __$TokenPairCopyWithImpl(this._self, this._then);

  final _TokenPair _self;
  final $Res Function(_TokenPair) _then;

/// Create a copy of TokenPair
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? access = null,Object? refresh = null,}) {
  return _then(_TokenPair(
access: null == access ? _self.access : access // ignore: cast_nullable_to_non_nullable
as String,refresh: null == refresh ? _self.refresh : refresh // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$UserCredentials {

 String get email; String get password;
/// Create a copy of UserCredentials
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCredentialsCopyWith<UserCredentials> get copyWith => _$UserCredentialsCopyWithImpl<UserCredentials>(this as UserCredentials, _$identity);

  /// Serializes this UserCredentials to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserCredentials&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'UserCredentials(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $UserCredentialsCopyWith<$Res>  {
  factory $UserCredentialsCopyWith(UserCredentials value, $Res Function(UserCredentials) _then) = _$UserCredentialsCopyWithImpl;
@useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class _$UserCredentialsCopyWithImpl<$Res>
    implements $UserCredentialsCopyWith<$Res> {
  _$UserCredentialsCopyWithImpl(this._self, this._then);

  final UserCredentials _self;
  final $Res Function(UserCredentials) _then;

/// Create a copy of UserCredentials
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? password = null,}) {
  return _then(UserCredentials(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserCredentials].
extension UserCredentialsPatterns on UserCredentials {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserCredentials value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserCredentials() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserCredentials value)  $default,){
final _that = this;
switch (_that) {
case _UserCredentials():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserCredentials value)?  $default,){
final _that = this;
switch (_that) {
case _UserCredentials() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String email,  String password)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserCredentials() when $default != null:
return $default(_that.email,_that.password);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String email,  String password)  $default,) {final _that = this;
switch (_that) {
case _UserCredentials():
return $default(_that.email,_that.password);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String email,  String password)?  $default,) {final _that = this;
switch (_that) {
case _UserCredentials() when $default != null:
return $default(_that.email,_that.password);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, checked: true, explicitToJson: true)
class _UserCredentials implements UserCredentials {
  const _UserCredentials({required this.email, required this.password});
  factory _UserCredentials.fromJson(Map<String, dynamic> json) => _$UserCredentialsFromJson(json);

@override final  String email;
@override final  String password;

/// Create a copy of UserCredentials
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCredentialsCopyWith<_UserCredentials> get copyWith => __$UserCredentialsCopyWithImpl<_UserCredentials>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserCredentialsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserCredentials&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'UserCredentials(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class _$UserCredentialsCopyWith<$Res> implements $UserCredentialsCopyWith<$Res> {
  factory _$UserCredentialsCopyWith(_UserCredentials value, $Res Function(_UserCredentials) _then) = __$UserCredentialsCopyWithImpl;
@override @useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class __$UserCredentialsCopyWithImpl<$Res>
    implements _$UserCredentialsCopyWith<$Res> {
  __$UserCredentialsCopyWithImpl(this._self, this._then);

  final _UserCredentials _self;
  final $Res Function(_UserCredentials) _then;

/// Create a copy of UserCredentials
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(_UserCredentials(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$RegisterCredentials {

 String get username; String get email; String get password; String get firstName; String get lastName;
/// Create a copy of RegisterCredentials
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterCredentialsCopyWith<RegisterCredentials> get copyWith => _$RegisterCredentialsCopyWithImpl<RegisterCredentials>(this as RegisterCredentials, _$identity);

  /// Serializes this RegisterCredentials to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterCredentials&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,email,password,firstName,lastName);

@override
String toString() {
  return 'RegisterCredentials(username: $username, email: $email, password: $password, firstName: $firstName, lastName: $lastName)';
}


}

/// @nodoc
abstract mixin class $RegisterCredentialsCopyWith<$Res>  {
  factory $RegisterCredentialsCopyWith(RegisterCredentials value, $Res Function(RegisterCredentials) _then) = _$RegisterCredentialsCopyWithImpl;
@useResult
$Res call({
 String username, String email, String password, String firstName, String lastName
});




}
/// @nodoc
class _$RegisterCredentialsCopyWithImpl<$Res>
    implements $RegisterCredentialsCopyWith<$Res> {
  _$RegisterCredentialsCopyWithImpl(this._self, this._then);

  final RegisterCredentials _self;
  final $Res Function(RegisterCredentials) _then;

/// Create a copy of RegisterCredentials
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? username = null,Object? email = null,Object? password = null,Object? firstName = null,Object? lastName = null,}) {
  return _then(RegisterCredentials(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RegisterCredentials].
extension RegisterCredentialsPatterns on RegisterCredentials {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegisterCredentials value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisterCredentials() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegisterCredentials value)  $default,){
final _that = this;
switch (_that) {
case _RegisterCredentials():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegisterCredentials value)?  $default,){
final _that = this;
switch (_that) {
case _RegisterCredentials() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String username,  String email,  String password,  String firstName,  String lastName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterCredentials() when $default != null:
return $default(_that.username,_that.email,_that.password,_that.firstName,_that.lastName);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String username,  String email,  String password,  String firstName,  String lastName)  $default,) {final _that = this;
switch (_that) {
case _RegisterCredentials():
return $default(_that.username,_that.email,_that.password,_that.firstName,_that.lastName);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String username,  String email,  String password,  String firstName,  String lastName)?  $default,) {final _that = this;
switch (_that) {
case _RegisterCredentials() when $default != null:
return $default(_that.username,_that.email,_that.password,_that.firstName,_that.lastName);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, checked: true, explicitToJson: true)
class _RegisterCredentials implements RegisterCredentials {
  const _RegisterCredentials({required this.username, required this.email, required this.password, required this.firstName, required this.lastName});
  factory _RegisterCredentials.fromJson(Map<String, dynamic> json) => _$RegisterCredentialsFromJson(json);

@override final  String username;
@override final  String email;
@override final  String password;
@override final  String firstName;
@override final  String lastName;

/// Create a copy of RegisterCredentials
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterCredentialsCopyWith<_RegisterCredentials> get copyWith => __$RegisterCredentialsCopyWithImpl<_RegisterCredentials>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegisterCredentialsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterCredentials&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,email,password,firstName,lastName);

@override
String toString() {
  return 'RegisterCredentials(username: $username, email: $email, password: $password, firstName: $firstName, lastName: $lastName)';
}


}

/// @nodoc
abstract mixin class _$RegisterCredentialsCopyWith<$Res> implements $RegisterCredentialsCopyWith<$Res> {
  factory _$RegisterCredentialsCopyWith(_RegisterCredentials value, $Res Function(_RegisterCredentials) _then) = __$RegisterCredentialsCopyWithImpl;
@override @useResult
$Res call({
 String username, String email, String password, String firstName, String lastName
});




}
/// @nodoc
class __$RegisterCredentialsCopyWithImpl<$Res>
    implements _$RegisterCredentialsCopyWith<$Res> {
  __$RegisterCredentialsCopyWithImpl(this._self, this._then);

  final _RegisterCredentials _self;
  final $Res Function(_RegisterCredentials) _then;

/// Create a copy of RegisterCredentials
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? username = null,Object? email = null,Object? password = null,Object? firstName = null,Object? lastName = null,}) {
  return _then(_RegisterCredentials(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$RegisteredUser {

 String get username; String get email; String? get firstName; String? get lastName;
/// Create a copy of RegisteredUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisteredUserCopyWith<RegisteredUser> get copyWith => _$RegisteredUserCopyWithImpl<RegisteredUser>(this as RegisteredUser, _$identity);

  /// Serializes this RegisteredUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisteredUser&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,email,firstName,lastName);

@override
String toString() {
  return 'RegisteredUser(username: $username, email: $email, firstName: $firstName, lastName: $lastName)';
}


}

/// @nodoc
abstract mixin class $RegisteredUserCopyWith<$Res>  {
  factory $RegisteredUserCopyWith(RegisteredUser value, $Res Function(RegisteredUser) _then) = _$RegisteredUserCopyWithImpl;
@useResult
$Res call({
 String username, String email, String? firstName, String? lastName
});




}
/// @nodoc
class _$RegisteredUserCopyWithImpl<$Res>
    implements $RegisteredUserCopyWith<$Res> {
  _$RegisteredUserCopyWithImpl(this._self, this._then);

  final RegisteredUser _self;
  final $Res Function(RegisteredUser) _then;

/// Create a copy of RegisteredUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? username = null,Object? email = null,Object? firstName = freezed,Object? lastName = freezed,}) {
  return _then(RegisteredUser(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RegisteredUser].
extension RegisteredUserPatterns on RegisteredUser {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegisteredUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisteredUser() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegisteredUser value)  $default,){
final _that = this;
switch (_that) {
case _RegisteredUser():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegisteredUser value)?  $default,){
final _that = this;
switch (_that) {
case _RegisteredUser() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String username,  String email,  String? firstName,  String? lastName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisteredUser() when $default != null:
return $default(_that.username,_that.email,_that.firstName,_that.lastName);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String username,  String email,  String? firstName,  String? lastName)  $default,) {final _that = this;
switch (_that) {
case _RegisteredUser():
return $default(_that.username,_that.email,_that.firstName,_that.lastName);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String username,  String email,  String? firstName,  String? lastName)?  $default,) {final _that = this;
switch (_that) {
case _RegisteredUser() when $default != null:
return $default(_that.username,_that.email,_that.firstName,_that.lastName);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, checked: true, explicitToJson: true)
class _RegisteredUser implements RegisteredUser {
  const _RegisteredUser({required this.username, required this.email, required this.firstName, required this.lastName});
  factory _RegisteredUser.fromJson(Map<String, dynamic> json) => _$RegisteredUserFromJson(json);

@override final  String username;
@override final  String email;
@override final  String? firstName;
@override final  String? lastName;

/// Create a copy of RegisteredUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisteredUserCopyWith<_RegisteredUser> get copyWith => __$RegisteredUserCopyWithImpl<_RegisteredUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegisteredUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisteredUser&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,email,firstName,lastName);

@override
String toString() {
  return 'RegisteredUser(username: $username, email: $email, firstName: $firstName, lastName: $lastName)';
}


}

/// @nodoc
abstract mixin class _$RegisteredUserCopyWith<$Res> implements $RegisteredUserCopyWith<$Res> {
  factory _$RegisteredUserCopyWith(_RegisteredUser value, $Res Function(_RegisteredUser) _then) = __$RegisteredUserCopyWithImpl;
@override @useResult
$Res call({
 String username, String email, String? firstName, String? lastName
});




}
/// @nodoc
class __$RegisteredUserCopyWithImpl<$Res>
    implements _$RegisteredUserCopyWith<$Res> {
  __$RegisteredUserCopyWithImpl(this._self, this._then);

  final _RegisteredUser _self;
  final $Res Function(_RegisteredUser) _then;

/// Create a copy of RegisteredUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? username = null,Object? email = null,Object? firstName = freezed,Object? lastName = freezed,}) {
  return _then(_RegisteredUser(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$PasswordValidationResult {

 bool get isValid; List<String> get errors;
/// Create a copy of PasswordValidationResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PasswordValidationResultCopyWith<PasswordValidationResult> get copyWith => _$PasswordValidationResultCopyWithImpl<PasswordValidationResult>(this as PasswordValidationResult, _$identity);

  /// Serializes this PasswordValidationResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PasswordValidationResult&&(identical(other.isValid, isValid) || other.isValid == isValid)&&const DeepCollectionEquality().equals(other.errors, errors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isValid,const DeepCollectionEquality().hash(errors));

@override
String toString() {
  return 'PasswordValidationResult(isValid: $isValid, errors: $errors)';
}


}

/// @nodoc
abstract mixin class $PasswordValidationResultCopyWith<$Res>  {
  factory $PasswordValidationResultCopyWith(PasswordValidationResult value, $Res Function(PasswordValidationResult) _then) = _$PasswordValidationResultCopyWithImpl;
@useResult
$Res call({
 bool isValid, List<String> errors
});




}
/// @nodoc
class _$PasswordValidationResultCopyWithImpl<$Res>
    implements $PasswordValidationResultCopyWith<$Res> {
  _$PasswordValidationResultCopyWithImpl(this._self, this._then);

  final PasswordValidationResult _self;
  final $Res Function(PasswordValidationResult) _then;

/// Create a copy of PasswordValidationResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isValid = null,Object? errors = null,}) {
  return _then(PasswordValidationResult(
isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,errors: null == errors ? _self.errors : errors // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [PasswordValidationResult].
extension PasswordValidationResultPatterns on PasswordValidationResult {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PasswordValidationResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PasswordValidationResult() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PasswordValidationResult value)  $default,){
final _that = this;
switch (_that) {
case _PasswordValidationResult():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PasswordValidationResult value)?  $default,){
final _that = this;
switch (_that) {
case _PasswordValidationResult() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isValid,  List<String> errors)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PasswordValidationResult() when $default != null:
return $default(_that.isValid,_that.errors);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isValid,  List<String> errors)  $default,) {final _that = this;
switch (_that) {
case _PasswordValidationResult():
return $default(_that.isValid,_that.errors);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isValid,  List<String> errors)?  $default,) {final _that = this;
switch (_that) {
case _PasswordValidationResult() when $default != null:
return $default(_that.isValid,_that.errors);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, checked: true, explicitToJson: true)
class _PasswordValidationResult implements PasswordValidationResult {
  const _PasswordValidationResult({required this.isValid, required  List<String> errors}): _errors = errors;
  factory _PasswordValidationResult.fromJson(Map<String, dynamic> json) => _$PasswordValidationResultFromJson(json);

@override final  bool isValid;
 final  List<String> _errors;
@override List<String> get errors {
  if (_errors is EqualUnmodifiableListView) return _errors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_errors);
}


/// Create a copy of PasswordValidationResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PasswordValidationResultCopyWith<_PasswordValidationResult> get copyWith => __$PasswordValidationResultCopyWithImpl<_PasswordValidationResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PasswordValidationResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PasswordValidationResult&&(identical(other.isValid, isValid) || other.isValid == isValid)&&const DeepCollectionEquality().equals(other._errors, _errors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isValid,const DeepCollectionEquality().hash(_errors));

@override
String toString() {
  return 'PasswordValidationResult(isValid: $isValid, errors: $errors)';
}


}

/// @nodoc
abstract mixin class _$PasswordValidationResultCopyWith<$Res> implements $PasswordValidationResultCopyWith<$Res> {
  factory _$PasswordValidationResultCopyWith(_PasswordValidationResult value, $Res Function(_PasswordValidationResult) _then) = __$PasswordValidationResultCopyWithImpl;
@override @useResult
$Res call({
 bool isValid, List<String> errors
});




}
/// @nodoc
class __$PasswordValidationResultCopyWithImpl<$Res>
    implements _$PasswordValidationResultCopyWith<$Res> {
  __$PasswordValidationResultCopyWithImpl(this._self, this._then);

  final _PasswordValidationResult _self;
  final $Res Function(_PasswordValidationResult) _then;

/// Create a copy of PasswordValidationResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isValid = null,Object? errors = null,}) {
  return _then(_PasswordValidationResult(
isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,errors: null == errors ? _self._errors : errors // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$TaskAttachment {

 String get id; int get taskId; String get photoUri; double? get latitude; double? get longitude; String get createdAt;
/// Create a copy of TaskAttachment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskAttachmentCopyWith<TaskAttachment> get copyWith => _$TaskAttachmentCopyWithImpl<TaskAttachment>(this as TaskAttachment, _$identity);

  /// Serializes this TaskAttachment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskAttachment&&(identical(other.id, id) || other.id == id)&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.photoUri, photoUri) || other.photoUri == photoUri)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,taskId,photoUri,latitude,longitude,createdAt);

@override
String toString() {
  return 'TaskAttachment(id: $id, taskId: $taskId, photoUri: $photoUri, latitude: $latitude, longitude: $longitude, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $TaskAttachmentCopyWith<$Res>  {
  factory $TaskAttachmentCopyWith(TaskAttachment value, $Res Function(TaskAttachment) _then) = _$TaskAttachmentCopyWithImpl;
@useResult
$Res call({
 String id, int taskId, String photoUri, double? latitude, double? longitude, String createdAt
});




}
/// @nodoc
class _$TaskAttachmentCopyWithImpl<$Res>
    implements $TaskAttachmentCopyWith<$Res> {
  _$TaskAttachmentCopyWithImpl(this._self, this._then);

  final TaskAttachment _self;
  final $Res Function(TaskAttachment) _then;

/// Create a copy of TaskAttachment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? taskId = null,Object? photoUri = null,Object? latitude = freezed,Object? longitude = freezed,Object? createdAt = null,}) {
  return _then(TaskAttachment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as int,photoUri: null == photoUri ? _self.photoUri : photoUri // ignore: cast_nullable_to_non_nullable
as String,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TaskAttachment].
extension TaskAttachmentPatterns on TaskAttachment {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskAttachment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskAttachment() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskAttachment value)  $default,){
final _that = this;
switch (_that) {
case _TaskAttachment():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskAttachment value)?  $default,){
final _that = this;
switch (_that) {
case _TaskAttachment() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int taskId,  String photoUri,  double? latitude,  double? longitude,  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskAttachment() when $default != null:
return $default(_that.id,_that.taskId,_that.photoUri,_that.latitude,_that.longitude,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int taskId,  String photoUri,  double? latitude,  double? longitude,  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _TaskAttachment():
return $default(_that.id,_that.taskId,_that.photoUri,_that.latitude,_that.longitude,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int taskId,  String photoUri,  double? latitude,  double? longitude,  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _TaskAttachment() when $default != null:
return $default(_that.id,_that.taskId,_that.photoUri,_that.latitude,_that.longitude,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none, checked: true, explicitToJson: true)
class _TaskAttachment implements TaskAttachment {
  const _TaskAttachment({required this.id, required this.taskId, required this.photoUri, required this.latitude, required this.longitude, required this.createdAt});
  factory _TaskAttachment.fromJson(Map<String, dynamic> json) => _$TaskAttachmentFromJson(json);

@override final  String id;
@override final  int taskId;
@override final  String photoUri;
@override final  double? latitude;
@override final  double? longitude;
@override final  String createdAt;

/// Create a copy of TaskAttachment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskAttachmentCopyWith<_TaskAttachment> get copyWith => __$TaskAttachmentCopyWithImpl<_TaskAttachment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaskAttachmentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskAttachment&&(identical(other.id, id) || other.id == id)&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.photoUri, photoUri) || other.photoUri == photoUri)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,taskId,photoUri,latitude,longitude,createdAt);

@override
String toString() {
  return 'TaskAttachment(id: $id, taskId: $taskId, photoUri: $photoUri, latitude: $latitude, longitude: $longitude, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$TaskAttachmentCopyWith<$Res> implements $TaskAttachmentCopyWith<$Res> {
  factory _$TaskAttachmentCopyWith(_TaskAttachment value, $Res Function(_TaskAttachment) _then) = __$TaskAttachmentCopyWithImpl;
@override @useResult
$Res call({
 String id, int taskId, String photoUri, double? latitude, double? longitude, String createdAt
});




}
/// @nodoc
class __$TaskAttachmentCopyWithImpl<$Res>
    implements _$TaskAttachmentCopyWith<$Res> {
  __$TaskAttachmentCopyWithImpl(this._self, this._then);

  final _TaskAttachment _self;
  final $Res Function(_TaskAttachment) _then;

/// Create a copy of TaskAttachment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? taskId = null,Object? photoUri = null,Object? latitude = freezed,Object? longitude = freezed,Object? createdAt = null,}) {
  return _then(_TaskAttachment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as int,photoUri: null == photoUri ? _self.photoUri : photoUri // ignore: cast_nullable_to_non_nullable
as String,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$TaskAttachmentInput {

 String get photoUri; double? get latitude; double? get longitude;
/// Create a copy of TaskAttachmentInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskAttachmentInputCopyWith<TaskAttachmentInput> get copyWith => _$TaskAttachmentInputCopyWithImpl<TaskAttachmentInput>(this as TaskAttachmentInput, _$identity);

  /// Serializes this TaskAttachmentInput to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskAttachmentInput&&(identical(other.photoUri, photoUri) || other.photoUri == photoUri)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,photoUri,latitude,longitude);

@override
String toString() {
  return 'TaskAttachmentInput(photoUri: $photoUri, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class $TaskAttachmentInputCopyWith<$Res>  {
  factory $TaskAttachmentInputCopyWith(TaskAttachmentInput value, $Res Function(TaskAttachmentInput) _then) = _$TaskAttachmentInputCopyWithImpl;
@useResult
$Res call({
 String photoUri, double? latitude, double? longitude
});




}
/// @nodoc
class _$TaskAttachmentInputCopyWithImpl<$Res>
    implements $TaskAttachmentInputCopyWith<$Res> {
  _$TaskAttachmentInputCopyWithImpl(this._self, this._then);

  final TaskAttachmentInput _self;
  final $Res Function(TaskAttachmentInput) _then;

/// Create a copy of TaskAttachmentInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? photoUri = null,Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(TaskAttachmentInput(
photoUri: null == photoUri ? _self.photoUri : photoUri // ignore: cast_nullable_to_non_nullable
as String,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [TaskAttachmentInput].
extension TaskAttachmentInputPatterns on TaskAttachmentInput {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskAttachmentInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskAttachmentInput() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskAttachmentInput value)  $default,){
final _that = this;
switch (_that) {
case _TaskAttachmentInput():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskAttachmentInput value)?  $default,){
final _that = this;
switch (_that) {
case _TaskAttachmentInput() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String photoUri,  double? latitude,  double? longitude)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskAttachmentInput() when $default != null:
return $default(_that.photoUri,_that.latitude,_that.longitude);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String photoUri,  double? latitude,  double? longitude)  $default,) {final _that = this;
switch (_that) {
case _TaskAttachmentInput():
return $default(_that.photoUri,_that.latitude,_that.longitude);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String photoUri,  double? latitude,  double? longitude)?  $default,) {final _that = this;
switch (_that) {
case _TaskAttachmentInput() when $default != null:
return $default(_that.photoUri,_that.latitude,_that.longitude);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none, checked: true, explicitToJson: true)
class _TaskAttachmentInput implements TaskAttachmentInput {
  const _TaskAttachmentInput({required this.photoUri, required this.latitude, required this.longitude});
  factory _TaskAttachmentInput.fromJson(Map<String, dynamic> json) => _$TaskAttachmentInputFromJson(json);

@override final  String photoUri;
@override final  double? latitude;
@override final  double? longitude;

/// Create a copy of TaskAttachmentInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskAttachmentInputCopyWith<_TaskAttachmentInput> get copyWith => __$TaskAttachmentInputCopyWithImpl<_TaskAttachmentInput>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaskAttachmentInputToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskAttachmentInput&&(identical(other.photoUri, photoUri) || other.photoUri == photoUri)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,photoUri,latitude,longitude);

@override
String toString() {
  return 'TaskAttachmentInput(photoUri: $photoUri, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class _$TaskAttachmentInputCopyWith<$Res> implements $TaskAttachmentInputCopyWith<$Res> {
  factory _$TaskAttachmentInputCopyWith(_TaskAttachmentInput value, $Res Function(_TaskAttachmentInput) _then) = __$TaskAttachmentInputCopyWithImpl;
@override @useResult
$Res call({
 String photoUri, double? latitude, double? longitude
});




}
/// @nodoc
class __$TaskAttachmentInputCopyWithImpl<$Res>
    implements _$TaskAttachmentInputCopyWith<$Res> {
  __$TaskAttachmentInputCopyWithImpl(this._self, this._then);

  final _TaskAttachmentInput _self;
  final $Res Function(_TaskAttachmentInput) _then;

/// Create a copy of TaskAttachmentInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? photoUri = null,Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_TaskAttachmentInput(
photoUri: null == photoUri ? _self.photoUri : photoUri // ignore: cast_nullable_to_non_nullable
as String,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
