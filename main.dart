// Endu Live የገንዘብ እና የዊዝድሮው ፖሊሲ
class EnduPolicy {
  static const int pointsPerDollar = 10000;
  static const double minWithdrawalUSD = 10.0; // 100,000 ፖይንት
  static const double withdrawalMultiple = 2.5; // በ 2.5 ብዜት
  
  // የክፍያ መንገዶች
  static const List<String> paymentMethods = ["Telebirr", "CBE", "USDT TRC20"];
  
  // የጊፍት ገቢ (70% ለሆስቱ)
  static double calculateHostShare(int giftCoins) {
    return giftCoins * 0.7;
  }
}
