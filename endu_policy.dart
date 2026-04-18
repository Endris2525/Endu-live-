// Endu Live Money & Reward Policy
class EnduPolicy {
  [span_0](start_span)// 10,000 points = 1 USD[span_0](end_span)
  static const int pointsPerDollar = 10000; 

  [span_1](start_span)// Minimum withdrawal 100,000 points ($10)[span_1](end_span)
  static const int minWithdrawPoints = 100000; 

  [span_2](start_span)// Withdrawals in multiples of 2.5 USD[span_2](end_span)
  static const double withdrawMultiple = 2.5; 

  [span_3](start_span)// Gift Revenue Share: 70% to host[span_3](end_span)
  static double calculateHostEarnings(int giftCoins) {
    return giftCoins * 0.7;
  }

  [span_4](start_span)// New Host Reward: Max 35,000 points in first 7 days[span_4](end_span)
  static const int maxNewHostReward = 35000;
}
