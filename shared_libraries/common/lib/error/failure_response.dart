class FailureResponse {
  final String errorMessage;
  final int? statusCode;

  const FailureResponse({
    required this.errorMessage,
    this.statusCode,
  });
}
