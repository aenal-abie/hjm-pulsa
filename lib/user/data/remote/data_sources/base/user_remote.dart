import '../../../../domain/use_cases/changing_pin.dart';

abstract class IUserRemote {
  Future<bool> changePin(ChangingPinParam params, String authToken);
}
