class ReservedHoursResponse {
  final List<String> reservedHours;

  ReservedHoursResponse({required this.reservedHours});

  factory ReservedHoursResponse.fromJson(List<dynamic> json) {
    return ReservedHoursResponse(
      reservedHours: List<String>.from(json),
    );
  }
}
