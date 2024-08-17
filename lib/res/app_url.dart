class AppUrl {
  static const baseUrl = 'https://pnb-one-server.onrender.com/api/v1';
  static String getUser() {
    return '$baseUrl/users/login';
  }

  static String validateUser() {
    return '$baseUrl/users/validate';
  }

  static String initiateTransaction() {
    return '$baseUrl/transactions/initiateTransaction';
  }
}
