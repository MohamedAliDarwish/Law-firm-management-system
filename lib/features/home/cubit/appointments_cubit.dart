import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawfirm_management_system/features/home/cubit/appointment_states.dart';
import 'package:lawfirm_management_system/features/home/models/appointment_model.dart';

class AppointmentsCubit extends Cubit<AppointmentsState> {
  AppointmentsCubit() : super(AppointmentsInitial()) {
    selectDate(DateTime.now());
  }

  // Demo data (Get from API)
  final List<AppointmentModel> _allAppointments = [
    AppointmentModel(
      id: '1',
      title: 'جلسة قضية صحة توقيع',
      description: 'جلسة لمتابعة القضية',
      date: DateTime.now(),
      type: AppointmentType.session,
      caseId: 'case_1',
      clientId: 'client_1',
    ),

    AppointmentModel(
      id: '2',
      title: 'استخراج صورة رسمية من المحضر رقم 22 لسنة 2022',
      description:
          'الاستعلام عن الدعوى رقم 22 لسنة 2022 واستخراج صورة رسمية من المحضر',
      date: DateTime.now(),
      type: AppointmentType.legalTask,
      caseId: 'case_2',
      clientId: 'client_2',
    ),
    AppointmentModel(
      id: '3',
      title: 'اجتماع مع العميل',
      description: 'مناقشة تفاصيل القضية',
      date: DateTime.now().add(const Duration(days: 1)),
      type: AppointmentType.appointment,
      caseId: 'case_3',
      clientId: 'client_3',
    ),
    AppointmentModel(
      id: '4',
      title: 'جلسة قضية إيجارات ',
      description: 'جلسة لمتابعة القضية',
      date: DateTime.now(),
      type: AppointmentType.session,
      caseId: 'case_1',
      clientId: 'client_1',
    ),
    AppointmentModel(
      id: '5',
      title: 'جلسة قضية شركات ',
      description: 'جلسة لمتابعة القضية',
      date: DateTime.now(),
      type: AppointmentType.session,
      caseId: 'case_1',
      clientId: 'client_1',
    ),
    AppointmentModel(
      id: '6',
      title: 'جلسة قضية قتل رقم 22سنه 2029 ',
      description: 'جلسة لمتابعة القضية',
      date: DateTime.now(),
      type: AppointmentType.session,
      caseId: 'case_1',
      clientId: 'client_1',
    ),
  ];

  // customHolidays Get from API
  final List<DateTime> _customHolidays = [
    DateTime.utc(2026, 5, 15),
    DateTime.utc(2026, 8, 10),
  ];

  // get date only from DateTime
  DateTime _dateOnly(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  void selectDate(DateTime date) {
    final selectedDate = _dateOnly(date);

    emit(AppointmentsLoading(selectedDate: selectedDate));

    try {
      final filteredAppointments = _allAppointments
          .where((appointment) => _dateOnly(appointment.date) == selectedDate)
          .toList();

      emit(
        AppointmentsSuccess(
          selectedDate: selectedDate,
          appointments: filteredAppointments,
        ),
      );
    } catch (error) {
      emit(
        AppointmentsError(
          // selectedDate: selectedDate,
          message: error.toString(),
        ),
      );
    }
  }

  bool checkIfHoliday(DateTime day) {
    // return _holidays.any((holiday) => isSameDay(holiday, day));
    // bool isCustomHoliday = _customHolidays.any((holiday) => isSameDay(holiday, day));
    bool isWeekend = day.weekday == DateTime.friday;
    // return isWeekend || isCustomHoliday;

    return isWeekend;
  }
}
