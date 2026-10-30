import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:lawfirm_management_system/features/home/cubit/appointments_cubit.dart';
import 'package:lawfirm_management_system/features/home/cubit/appointment_states.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BlocBuilder<AppointmentsCubit, AppointmentsState>(
        builder: (context, state) {
          if (state is AppointmentsInitial) {
            return const Center(child: CircularProgressIndicator());
          }

          final selectedDate = switch (state) {
            AppointmentsLoading(:final selectedDate) => selectedDate,
            AppointmentsSuccess(:final selectedDate) => selectedDate,
            _ => DateTime.now(),
          };

          return TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2035, 12, 31),
            focusedDay: selectedDate,

            selectedDayPredicate: (day) {
              return day.year == selectedDate.year &&
                  day.month == selectedDate.month &&
                  day.day == selectedDate.day;
            },
            onDaySelected: (selectedDay, focusedDay) {
              context.read<AppointmentsCubit>().selectDate(selectedDay);
            },
            calendarFormat: CalendarFormat.month,
            calendarStyle: CalendarStyle(outsideDaysVisible: false),
            // 1. تخصيص شكل الأيام في التقويم نفسه (مثل الجمعة والسبت أو العطلات)
            calendarBuilders: CalendarBuilders(
              // تخصيص أيام الأسبوع العادية (أو يمكنك فحص الشرط لكل يوم)
              defaultBuilder: (context, day, focusedDay) {
                // تحقق إذا كان اليوم هو الجمعة (6) أو السبت (5)
                // bool isWeekend =
                //     day.weekday == DateTime.friday ||
                //     day.weekday == DateTime.saturday;

                bool isHoliday = context
                    .read<AppointmentsCubit>()
                    .checkIfHoliday(day); // دالة تفحص قائمة العطلات الرسمية

                if (isHoliday) {
                  return Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.red.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${day.day}',
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }
                return null;
              },
            ),
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
          );
        },
      ),
    );
  }
}
