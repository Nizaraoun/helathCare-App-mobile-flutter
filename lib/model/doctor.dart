class DoctorDto {
  final String? lat1;
  final String? lon1;
  final String? name;
  final String? speciality;
  final String? phone;
  final String? email;
  final String? image;
  final String? id;
  final double? rate;

  DoctorDto({
    this.lat1,
    this.lon1,
    required this.name,
    required this.speciality,
    this.phone,
    this.email,
    this.image,
    this.id,
    this.rate,
  });

  factory DoctorDto.fromJson(Map<String?, dynamic> json) {
    double? parsedRate = double.tryParse(json['rating'].toString());

    return DoctorDto(
      lat1: json['latitude'] ?? '0',
      lon1: json['longitude'] ?? '0',
      name: json['username'] ?? '0',
      speciality: json['speciality'] ?? '0',
      phone: json['phone'] ?? '0',
      email: json['email'] ?? '0',
      image: json['image'] ?? '0',
      id: json['id'] ?? '0',
      rate: parsedRate,
    );
  }
}
