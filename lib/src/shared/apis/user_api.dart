import 'package:bloc_pattern/src/shared/models/entities.dart';
import 'package:bloc_pattern/src/shared/utils/http_util.dart';

abstract interface class IUserApi {
  Future<UserLoginResponseEntity> login({LoginRequestEntity? params});
}

class UserApi implements IUserApi {
  @override
  Future<UserLoginResponseEntity> login({LoginRequestEntity? params}) async {
    var response =
        await HttpUtil().post('api/login', queryParams: params?.toJson());

    return UserLoginResponseEntity.fromJson(response.data);
  }
}
