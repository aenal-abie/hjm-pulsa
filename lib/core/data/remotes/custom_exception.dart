

import '../../domain/error/failures.dart';

class CustomException implements Exception {
  final String? _message;

  CustomException([this._message]);

  @override
  String toString() {
    return _message.toString();
  }

  Failure toFailure() =>
      ServerFailure(message: _message ?? "Cek koneksi internet Anda");
}

class FetchDataException extends CustomException {
  FetchDataException([String? message]) : super(message ?? "Data gagal dimuat");
}

class BadRequestException extends CustomException {
  BadRequestException([String? message]) : super(message ?? "Data tidak valid");
}

class ServerException extends CustomException {
  final int? errorCode;

  ServerException([
    String? message,
    this.errorCode,
  ]) : super(message ?? "Cek koneksi internet Anda");
}

class UpgradeException extends CustomException {
  final String name;

  UpgradeException(this.name) : super(name);

  @override
  Failure toFailure() => UpgradeFailure(message: name);
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([String? message])
      : super(message ?? "Anda tidak memiliki akses");

  @override
  Failure toFailure() => const UnauthorisedFailure();
}

class NotAvailableException extends CustomException {
  NotAvailableException([String? message])
      : super(message ?? "Anda tidak memiliki akses");

  @override
  Failure toFailure() => const NotAvailableFailure();
}

class ForbiddenException extends CustomException {
  ForbiddenException() : super("Anda tidak berhak untuk melakukan aksi ini");

  @override
  Failure toFailure() => const ForbiddenFailure();
}

class CacheException implements Exception {}

class ConnectionException implements CustomException {
  ConnectionException() : super();

  @override
  String? get _message => throw UnimplementedError();

  @override
  Failure toFailure() =>
      const ConnectionFailure(message: "Cek koneksi internet Anda");
}
