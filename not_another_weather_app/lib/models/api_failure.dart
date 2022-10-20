class ApiFailure {
  ApiFailure({this.message = '', this.errorCode = 0});

  final String message;
  final int errorCode;

  @override
  String toString() => 'Mensaje: $message, error code: $errorCode'.toString();
}
