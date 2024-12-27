import 'package:pulsa/authentication/data/remote/models/user_dto.dart';
import 'package:pulsa/authentication/domain/use_cases/login.dart';

import '../../../../core/data/remotes/api_provider.dart';
import '../../../domain/use_cases/changing_pin.dart';
import 'base/user_remote.dart';

class UserRemote extends IUserRemote {
  final ApiProvider apiProvider;

  UserRemote(this.apiProvider);

  @override
  Future<UserDto> login(LoginParams params) async {
    var url = "login";
    var result = await apiProvider.post(url, params.toJson());
    return UserDto.fromJson(result);
  }

  @override
  Future<bool> changePin(ChangingPinParam params, String authToken) async {
    var url = "users/pins";
    await apiProvider.post(url, params.toJson(), authToken: authToken);
    return true;
  }
}
