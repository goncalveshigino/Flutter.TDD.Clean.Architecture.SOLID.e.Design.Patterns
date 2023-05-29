import 'package:fordev/domain/entities/account_entity.dart';

import '../models/model.dart';

class RemoteAccountMapper {

  static AccountEntity toAccountEntity(RemoteAccountModel account ) => 
  AccountEntity( token: account.accessToken);

}