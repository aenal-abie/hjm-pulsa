class UploadFileDto {
  final double? progress;
  final bool error;
  final Map<String, dynamic>? response;
  final String? errorMessage;

  UploadFileDto({
    this.progress,
    this.response,
    this.error = false,
    this.errorMessage,
  });
}
