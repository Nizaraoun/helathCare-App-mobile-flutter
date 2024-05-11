class Appointments {
  final int? id;
  final bool? cancel;
  final String? doctorId;
  final double? completed;
  final String? doctorname;
  final String? image;
  final String? speciality;
  final String? jour;
  final String? houre;

  Appointments({
    this.doctorname,
    this.doctorId,
    this.image,
    this.jour,
    this.speciality,
    this.houre,
    this.id,
    this.cancel,
    this.completed,
  });

  factory Appointments.fromJson(Map<String, dynamic> json) {
    return Appointments(
        doctorname: json['doctorname'] ?? '0',
        speciality: json['specialty'] ?? '0',
        image: json['image'] ?? '0',
        jour: json['jour'] ?? '0',
        houre: json['heure'] ?? '0',
        id: json['id'] ?? 0,
        doctorId: json['id_praticien'] ?? '0',
        cancel: json['cancel'] ?? false,
        completed: json['completed'] ?? false);
  }
}
