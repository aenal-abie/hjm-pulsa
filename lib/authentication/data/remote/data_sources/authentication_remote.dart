import 'package:pulsa/authentication/domain/use_cases/login.dart';

import '../../../../core/data/remotes/api_provider.dart';
import 'base/authentication_remote.dart';

class AuthenticationRemote extends IAuthenticationRemote {
  final ApiProvider apiProvider;

  AuthenticationRemote(this.apiProvider);
  @override
  Future<bool> login(LoginParams params) async {
    ///todo : change with the correct url
    // var url = "/login";
    // var result = await apiProvider.post(url, params.toJson());
    return true;
  }
}
