abstract class AppException implements Exception {
  final String message;
  final StackTrace stackTrace;

  const AppException(
    this.message, {
    required this.stackTrace,
  });

  @override
  String toString() => message;
}

class AuthenticationException extends AppException {
  const AuthenticationException(
    super.message, {
    required super.stackTrace,
  });
}
