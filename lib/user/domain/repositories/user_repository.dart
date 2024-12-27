import '../use_cases/changing_pin.dart';

abstract class IUserRepository {
  EChangePin changePin(ChangingPinParam params);
}
