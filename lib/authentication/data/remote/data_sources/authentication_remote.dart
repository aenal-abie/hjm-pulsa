import 'package:pulsa/authentication/data/remote/models/user_dto.dart';
import 'package:pulsa/authentication/domain/use_cases/login.dart';

import '../../../../core/data/remotes/api_provider.dart';
import 'base/authentication_remote.dart';

class AuthenticationRemote extends IAuthenticationRemote {
  final ApiProvider apiProvider;

  AuthenticationRemote(this.apiProvider);
  @override
  Future<UserDto> login(LoginParams params) async {
    var url = "login";
    var result = await apiProvider.post(url, params.toJson());
    return UserDto.fromJson(result);
  }

  @override
  Future<bool> logout() async {
    var url = "logout";
    await apiProvider.post(url, {});
    return true;
  }
}
