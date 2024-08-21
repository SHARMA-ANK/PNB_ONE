import 'dart:convert';

class UserModel {
  final String id;
  final String name;
  final String userId;
  final String accountNo;
  final String phoneNo;
  final double balance;
  final String accessToken;

  UserModel({
    required this.id,
    required this.name,
    required this.userId,
    required this.accountNo,
    required this.phoneNo,
    required this.balance,
    required this.accessToken,
  });

  // Factory constructor to create a UserModel from a Map with type safety and default values
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['_id'] as String? ?? 'Unknown ID',
      name: map['name'] as String? ?? 'Unknown Name',
      userId: map['userId'] as String? ?? 'Unknown UserID',
      accountNo: map['accountNo'] as String? ?? 'Unknown AccountNo',
      phoneNo: map['phoneNo'] as String? ?? 'Unknown PhoneNo',
      balance: (map['balance'] as num?)?.toDouble() ?? 0.0,
      accessToken: map['refreshToken'] as String? ?? '',
    );
  }

  // Factory constructor to create a UserModel from a JSON string with type safety and default values
  factory UserModel.fromJson(String source) {
    final Map<String, dynamic> map = json.decode(source);
    return UserModel.fromMap(map);
  }

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, userId: $userId, accountNo: $accountNo, phoneNo: $phoneNo, balance: $balance, accessToken: $accessToken)';
  }
}
