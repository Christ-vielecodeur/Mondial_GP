class Announcement {
  Announcement({
    required this.fromCountryFlag,
    required this.fromCity,
    required this.fromDate,
    required this.toCountryFlag,
    required this.toCity,
    required this.toDate,
    required this.receivedKg,
    required this.availableKg,
    required this.pricePerKg,
    required this.senders,
    required this.requests,
    required this.expiresIn,
  });

  final String fromCountryFlag;
  final String fromCity;
  final String fromDate;

  final String toCountryFlag;
  final String toCity;
  final String toDate;

  final int receivedKg;
  final int availableKg;
  final String pricePerKg;
  final int senders;
  final int requests;
  final String expiresIn;
}
