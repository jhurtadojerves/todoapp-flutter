import 'dart:convert';

int? userIdFromJwt(String token) {
  try {
    final payload =
        jsonDecode(
              utf8.decode(
                base64Url.decode(base64Url.normalize(token.split('.')[1])),
              ),
            )
            as Map<String, dynamic>;
    final id = payload['user_id'];
    return id is int ? id : int.tryParse('$id');
  } catch (_) {
    return null;
  }
}
