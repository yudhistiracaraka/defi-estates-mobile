class AppFormatters {
  static String compactWallet(String? address) {
    if (address == null || address.length < 10) {
      return 'Not connected';
    }

    return '${address.substring(0, 6)}...${address.substring(address.length - 4)}';
  }

  static String usd(int value) {
    final digits = value.toString();
    final buffer = StringBuffer();

    for (var index = 0; index < digits.length; index++) {
      final remaining = digits.length - index;
      buffer.write(digits[index]);
      if (remaining > 1 && remaining % 3 == 1) {
        buffer.write(',');
      }
    }

    return '\$$buffer';
  }

  static String eth(double value) {
    return value.toStringAsFixed(value.truncateToDouble() == value ? 1 : 3);
  }
}
