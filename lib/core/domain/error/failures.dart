import 'package:equatable/equatable.dart';
import 'package:get/get.dart';

abstract class Failure extends Equatable {
  final String? message;

  const Failure({this.message});

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return (message ?? "").tr;
  }
}

class InitFailure extends Failure {
  const InitFailure() : super(message: "");
}

class ServerFailure extends Failure {
  const ServerFailure({super.message});
}

class InvalidParam extends Failure {
  const InvalidParam({super.message});
}

class UnauthorisedFailure extends Failure {
  const UnauthorisedFailure() : super();
}

class ForbiddenFailure extends Failure {
  const ForbiddenFailure({super.message});
}

class NotAvailableFailure extends Failure {
  const NotAvailableFailure({super.message});
}

class UpgradeFailure extends Failure {
  const UpgradeFailure({super.message});
}

class CacheFailure extends Failure {
  const CacheFailure({super.message});
}

class ConnectionFailure extends Failure {
  const ConnectionFailure({String? message})
      : super(message: message ?? "Cek koneksi internet anda");
}
