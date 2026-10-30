import 'package:lawfirm_management_system/features/home/models/appointment_model.dart';

abstract class AppointmentsState {}

class AppointmentsInitial extends AppointmentsState {}

class AppointmentsLoading extends AppointmentsState {
  final DateTime selectedDate;
  AppointmentsLoading({
    required this.selectedDate,
  });
}

class AppointmentsSuccess extends AppointmentsState {
  final DateTime selectedDate;
  final List<AppointmentModel> appointments;

   AppointmentsSuccess({
    required this.selectedDate,
    required this.appointments,
  });
}

class AppointmentsError extends AppointmentsState {
  // final DateTime selectedDate;
  final String message;

   AppointmentsError({
    // required this.selectedDate,
    required this.message,
  });
}