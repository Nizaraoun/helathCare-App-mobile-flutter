class ReservedHoursResponse {
  final List<String> reservedHours;

  ReservedHoursResponse({required this.reservedHours});

  factory ReservedHoursResponse.fromJson(Map<String, dynamic> json) {
    return ReservedHoursResponse(
      reservedHours: List<String>.from(json['reservedHours']),
    );
  }
}
