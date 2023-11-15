import 'package:home_care/domain/entities/authentication/permissions.dart';

class Authorities {
  final Permissions? permissions;
  final String? accountType;
  final String? userLevel;
  final bool? isAdmin;

  const Authorities({
    this.permissions,
    this.accountType,
    this.userLevel,
    this.isAdmin,
  });
}

final class AccountType {
  AccountType._();

  static const String customer = 'CUSTOMER';
}

class AuthenticationType {
  static const internal = 'INTERNAL';
  static const ldap = 'LDAP';
}
