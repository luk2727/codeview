import 'dart:async';
import 'dart:io';

import 'package:server/server.dart';

class UserIdException implements Exception {
  final String? message;

  UserIdException(this.message);

  @override
  String toString() {
    String result = "UserIdException";
    if (message != null) result = "$result: $message";
    return result;
  }
}

class AlertError {
  /// Объект ошибки, по которому генерировали AlertError
  final dynamic reason;

  /// Точка выброса исключения - название запроса или функции.
  final String? source;

  AlertError(this.reason, [this.source]);

  bool get isConnectionError =>
      (reason is TimeoutException ||
          reason is SocketException ||
          reason is HttpException) ||
      (reason is GrpcError && reason.code == StatusCode.unavailable);
}
