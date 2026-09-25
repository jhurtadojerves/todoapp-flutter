// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Comment _$CommentFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_Comment', json, ($checkedConvert) {
      final val = _Comment(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        taskId: $checkedConvert('task_id', (v) => (v as num).toInt()),
        userId: $checkedConvert('user_id', (v) => (v as num).toInt()),
        content: $checkedConvert('content', (v) => v as String),
        created: $checkedConvert('created', (v) => v as String),
        modified: $checkedConvert('modified', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'taskId': 'task_id', 'userId': 'user_id'});

Map<String, dynamic> _$CommentToJson(_Comment instance) => <String, dynamic>{
  'id': instance.id,
  'task_id': instance.taskId,
  'user_id': instance.userId,
  'content': instance.content,
  'created': instance.created,
  'modified': instance.modified,
};

_CommentInput _$CommentInputFromJson(Map<String, dynamic> json) =>
    _CommentInput(content: json['content'] as String);

Map<String, dynamic> _$CommentInputToJson(_CommentInput instance) =>
    <String, dynamic>{'content': instance.content};

_Board _$BoardFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_Board', json, ($checkedConvert) {
      final val = _Board(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        name: $checkedConvert('name', (v) => v as String),
        description: $checkedConvert('description', (v) => v as String),
        userId: $checkedConvert('user_id', (v) => (v as num).toInt()),
        created: $checkedConvert('created', (v) => v as String),
        modified: $checkedConvert('modified', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'userId': 'user_id'});

Map<String, dynamic> _$BoardToJson(_Board instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'user_id': instance.userId,
  'created': instance.created,
  'modified': instance.modified,
};

_BoardInput _$BoardInputFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_BoardInput', json, ($checkedConvert) {
      final val = _BoardInput(
        name: $checkedConvert('name', (v) => v as String),
        description: $checkedConvert('description', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$BoardInputToJson(_BoardInput instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
    };

_UserProfile _$UserProfileFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_UserProfile', json, ($checkedConvert) {
      final val = _UserProfile(bio: $checkedConvert('bio', (v) => v as String));
      return val;
    });

Map<String, dynamic> _$UserProfileToJson(_UserProfile instance) =>
    <String, dynamic>{'bio': instance.bio};

_User _$UserFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_User',
  json,
  ($checkedConvert) {
    $checkKeys(json, requiredKeys: const ['profile']);
    final val = _User(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      username: $checkedConvert('username', (v) => v as String),
      email: $checkedConvert('email', (v) => v as String),
      profile: $checkedConvert(
        'profile',
        (v) =>
            v == null ? null : UserProfile.fromJson(v as Map<String, dynamic>),
      ),
      firstName: $checkedConvert('first_name', (v) => v as String?),
      lastName: $checkedConvert('last_name', (v) => v as String?),
      dateJoined: $checkedConvert('date_joined', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'firstName': 'first_name',
    'lastName': 'last_name',
    'dateJoined': 'date_joined',
  },
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'username': instance.username,
  'email': instance.email,
  'profile': instance.profile?.toJson(),
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'date_joined': instance.dateJoined,
};

_UserBrief _$UserBriefFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_UserBrief', json, ($checkedConvert) {
      final val = _UserBrief(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        username: $checkedConvert('username', (v) => v as String),
        email: $checkedConvert('email', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$UserBriefToJson(_UserBrief instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
    };

_BoardMembership _$BoardMembershipFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_BoardMembership', json, ($checkedConvert) {
      final val = _BoardMembership(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        boardId: $checkedConvert('board_id', (v) => (v as num).toInt()),
        user: $checkedConvert(
          'user',
          (v) => UserBrief.fromJson(v as Map<String, dynamic>),
        ),
        role: $checkedConvert(
          'role',
          (v) => $enumDecode(_$BoardRoleEnumMap, v),
        ),
        created: $checkedConvert('created', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'boardId': 'board_id'});

Map<String, dynamic> _$BoardMembershipToJson(_BoardMembership instance) =>
    <String, dynamic>{
      'id': instance.id,
      'board_id': instance.boardId,
      'user': instance.user.toJson(),
      'role': _$BoardRoleEnumMap[instance.role]!,
      'created': instance.created,
    };

const _$BoardRoleEnumMap = {
  BoardRole.owner: 'owner',
  BoardRole.member: 'member',
};

_BoardMembershipInput _$BoardMembershipInputFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_BoardMembershipInput', json, ($checkedConvert) {
  final val = _BoardMembershipInput(
    email: $checkedConvert('email', (v) => v as String),
    role: $checkedConvert('role', (v) => $enumDecode(_$BoardRoleEnumMap, v)),
  );
  return val;
});

Map<String, dynamic> _$BoardMembershipInputToJson(
  _BoardMembershipInput instance,
) => <String, dynamic>{
  'email': instance.email,
  'role': _$BoardRoleEnumMap[instance.role]!,
};

_BoardStatus _$BoardStatusFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_BoardStatus', json, ($checkedConvert) {
      final val = _BoardStatus(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        name: $checkedConvert('name', (v) => v as String),
        order: $checkedConvert('order', (v) => (v as num).toInt()),
        color: $checkedConvert('color', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$BoardStatusToJson(_BoardStatus instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'order': instance.order,
      'color': instance.color,
    };

_BoardStatusInput _$BoardStatusInputFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_BoardStatusInput', json, ($checkedConvert) {
      final val = _BoardStatusInput(
        name: $checkedConvert('name', (v) => v as String),
        order: $checkedConvert('order', (v) => (v as num).toInt()),
        color: $checkedConvert('color', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$BoardStatusInputToJson(_BoardStatusInput instance) =>
    <String, dynamic>{
      'name': instance.name,
      'order': instance.order,
      'color': instance.color,
    };

_Sprint _$SprintFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_Sprint', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['start_date', 'end_date']);
      final val = _Sprint(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        name: $checkedConvert('name', (v) => v as String),
        startDate: $checkedConvert('start_date', (v) => v as String?),
        endDate: $checkedConvert('end_date', (v) => v as String?),
        created: $checkedConvert('created', (v) => v as String),
        modified: $checkedConvert('modified', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'startDate': 'start_date', 'endDate': 'end_date'});

Map<String, dynamic> _$SprintToJson(_Sprint instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'start_date': instance.startDate,
  'end_date': instance.endDate,
  'created': instance.created,
  'modified': instance.modified,
};

_SprintInput _$SprintInputFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_SprintInput',
  json,
  ($checkedConvert) {
    $checkKeys(json, requiredKeys: const ['start_date', 'end_date']);
    final val = _SprintInput(
      name: $checkedConvert('name', (v) => v as String),
      startDate: $checkedConvert('start_date', (v) => v as String?),
      endDate: $checkedConvert('end_date', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {'startDate': 'start_date', 'endDate': 'end_date'},
);

Map<String, dynamic> _$SprintInputToJson(_SprintInput instance) =>
    <String, dynamic>{
      'name': instance.name,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
    };

_TaskStatusBrief _$TaskStatusBriefFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_TaskStatusBrief', json, ($checkedConvert) {
      final val = _TaskStatusBrief(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        name: $checkedConvert('name', (v) => v as String),
        color: $checkedConvert('color', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$TaskStatusBriefToJson(_TaskStatusBrief instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': instance.color,
    };

_TaskSprintBrief _$TaskSprintBriefFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_TaskSprintBrief', json, ($checkedConvert) {
      final val = _TaskSprintBrief(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        name: $checkedConvert('name', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$TaskSprintBriefToJson(_TaskSprintBrief instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

_Task _$TaskFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_Task',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const ['sprint', 'status', 'assigned_to_id'],
    );
    final val = _Task(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      boardId: $checkedConvert('board_id', (v) => (v as num).toInt()),
      sprint: $checkedConvert(
        'sprint',
        (v) => v == null
            ? null
            : TaskSprintBrief.fromJson(v as Map<String, dynamic>),
      ),
      status: $checkedConvert(
        'status',
        (v) => v == null
            ? null
            : TaskStatusBrief.fromJson(v as Map<String, dynamic>),
      ),
      userId: $checkedConvert('user_id', (v) => (v as num).toInt()),
      assignedToId: $checkedConvert(
        'assigned_to_id',
        (v) => (v as num?)?.toInt(),
      ),
      title: $checkedConvert('title', (v) => v as String),
      description: $checkedConvert('description', (v) => v as String),
      created: $checkedConvert('created', (v) => v as String),
      modified: $checkedConvert('modified', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {
    'boardId': 'board_id',
    'userId': 'user_id',
    'assignedToId': 'assigned_to_id',
  },
);

Map<String, dynamic> _$TaskToJson(_Task instance) => <String, dynamic>{
  'id': instance.id,
  'board_id': instance.boardId,
  'sprint': instance.sprint?.toJson(),
  'status': instance.status?.toJson(),
  'user_id': instance.userId,
  'assigned_to_id': instance.assignedToId,
  'title': instance.title,
  'description': instance.description,
  'created': instance.created,
  'modified': instance.modified,
};

_TaskInput _$TaskInputFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_TaskInput',
  json,
  ($checkedConvert) {
    $checkKeys(json, requiredKeys: const ['assigned_to_id']);
    final val = _TaskInput(
      title: $checkedConvert('title', (v) => v as String),
      description: $checkedConvert('description', (v) => v as String),
      statusId: $checkedConvert('status_id', (v) => (v as num?)?.toInt()),
      sprintId: $checkedConvert('sprint_id', (v) => (v as num?)?.toInt()),
      assignedToId: $checkedConvert(
        'assigned_to_id',
        (v) => (v as num?)?.toInt(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'statusId': 'status_id',
    'sprintId': 'sprint_id',
    'assignedToId': 'assigned_to_id',
  },
);

Map<String, dynamic> _$TaskInputToJson(_TaskInput instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'status_id': instance.statusId,
      'sprint_id': instance.sprintId,
      'assigned_to_id': instance.assignedToId,
    };

_TokenPair _$TokenPairFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_TokenPair', json, ($checkedConvert) {
      final val = _TokenPair(
        access: $checkedConvert('access', (v) => v as String),
        refresh: $checkedConvert('refresh', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$TokenPairToJson(_TokenPair instance) =>
    <String, dynamic>{'access': instance.access, 'refresh': instance.refresh};

_UserCredentials _$UserCredentialsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_UserCredentials', json, ($checkedConvert) {
      final val = _UserCredentials(
        email: $checkedConvert('email', (v) => v as String),
        password: $checkedConvert('password', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$UserCredentialsToJson(_UserCredentials instance) =>
    <String, dynamic>{'email': instance.email, 'password': instance.password};

_RegisterCredentials _$RegisterCredentialsFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_RegisterCredentials',
      json,
      ($checkedConvert) {
        final val = _RegisterCredentials(
          username: $checkedConvert('username', (v) => v as String),
          email: $checkedConvert('email', (v) => v as String),
          password: $checkedConvert('password', (v) => v as String),
          firstName: $checkedConvert('first_name', (v) => v as String),
          lastName: $checkedConvert('last_name', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'firstName': 'first_name', 'lastName': 'last_name'},
    );

Map<String, dynamic> _$RegisterCredentialsToJson(
  _RegisterCredentials instance,
) => <String, dynamic>{
  'username': instance.username,
  'email': instance.email,
  'password': instance.password,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
};

_RegisteredUser _$RegisteredUserFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_RegisteredUser',
      json,
      ($checkedConvert) {
        final val = _RegisteredUser(
          username: $checkedConvert('username', (v) => v as String),
          email: $checkedConvert('email', (v) => v as String),
          firstName: $checkedConvert('first_name', (v) => v as String?),
          lastName: $checkedConvert('last_name', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'firstName': 'first_name', 'lastName': 'last_name'},
    );

Map<String, dynamic> _$RegisteredUserToJson(_RegisteredUser instance) =>
    <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
    };

_PasswordValidationResult _$PasswordValidationResultFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_PasswordValidationResult', json, ($checkedConvert) {
  final val = _PasswordValidationResult(
    isValid: $checkedConvert('is_valid', (v) => v as bool),
    errors: $checkedConvert(
      'errors',
      (v) => (v as List<dynamic>).map((e) => e as String).toList(),
    ),
  );
  return val;
}, fieldKeyMap: const {'isValid': 'is_valid'});

Map<String, dynamic> _$PasswordValidationResultToJson(
  _PasswordValidationResult instance,
) => <String, dynamic>{'is_valid': instance.isValid, 'errors': instance.errors};

_TaskAttachment _$TaskAttachmentFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_TaskAttachment', json, ($checkedConvert) {
      final val = _TaskAttachment(
        id: $checkedConvert('id', (v) => v as String),
        taskId: $checkedConvert('taskId', (v) => (v as num).toInt()),
        photoUri: $checkedConvert('photoUri', (v) => v as String),
        latitude: $checkedConvert('latitude', (v) => (v as num?)?.toDouble()),
        longitude: $checkedConvert('longitude', (v) => (v as num?)?.toDouble()),
        createdAt: $checkedConvert('createdAt', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$TaskAttachmentToJson(_TaskAttachment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'taskId': instance.taskId,
      'photoUri': instance.photoUri,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'createdAt': instance.createdAt,
    };

_TaskAttachmentInput _$TaskAttachmentInputFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_TaskAttachmentInput', json, ($checkedConvert) {
      final val = _TaskAttachmentInput(
        photoUri: $checkedConvert('photoUri', (v) => v as String),
        latitude: $checkedConvert('latitude', (v) => (v as num?)?.toDouble()),
        longitude: $checkedConvert('longitude', (v) => (v as num?)?.toDouble()),
      );
      return val;
    });

Map<String, dynamic> _$TaskAttachmentInputToJson(
  _TaskAttachmentInput instance,
) => <String, dynamic>{
  'photoUri': instance.photoUri,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
};
