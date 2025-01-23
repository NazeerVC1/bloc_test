class LoginResponse {
  final int responseCode;
  final String responseMessage;
  final UserData?
      result; // Made nullable since it might not exist for error cases

  LoginResponse({
    required this.responseCode,
    required this.responseMessage,
    this.result,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      responseCode: json['responseCode'],
      responseMessage: json['responseMessage'],
      result: json['result'] != null ? UserData.fromJson(json['result']) : null,
    );
  }

  bool get isInvalidCredentials => responseCode == 2;
}

class UserData {
  final bool userView;
  final bool storeView;
  final bool productView;
  final bool inventoryView;
  final bool storeOperationView;
  final bool posView;
  final bool isEditable;
  final String userName;
  final String mobileNumber;
  final String userID;
  final bool isSuperAdmin;
  final String profileImage;
  final bool isStoreManager;
  final String accountID;

  UserData({
    required this.userView,
    required this.storeView,
    required this.productView,
    required this.inventoryView,
    required this.storeOperationView,
    required this.posView,
    required this.isEditable,
    required this.userName,
    required this.mobileNumber,
    required this.userID,
    required this.isSuperAdmin,
    required this.profileImage,
    required this.isStoreManager,
    required this.accountID,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      userView: json['userView'] ?? false,
      storeView: json['storeView'] ?? false,
      productView: json['productView'] ?? false,
      inventoryView: json['inventoryView'] ?? false,
      storeOperationView: json['storeOperationView'] ?? false,
      posView: json['posView'] ?? false,
      isEditable: json['isEditable'] ?? false,
      userName: json['userName'] ?? '',
      mobileNumber: json['mobileNumber'] ?? '',
      userID: json['userID'] ?? '',
      isSuperAdmin: json['isSuperAdmin'] ?? false,
      profileImage: json['profileImage'] ?? '',
      isStoreManager: json['isStoreManager'] ?? false,
      accountID: json['accountID'] ?? '',
    );
  }
}
