
enum AppointmentType {
  session,
  legalTask,
  appointment,
  other,
}

class AppointmentModel {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final AppointmentType type;
  final String? caseId;
  final String? clientId;

  const AppointmentModel({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.type,
    this.caseId,
    this.clientId,
  });
}
