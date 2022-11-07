class AppCalculations {
  static calculateOfferPercentage(
      {required dynamic price, required dynamic offerPrice}) {
    return (((price - offerPrice) / price) * 100).toInt();
  }
}
