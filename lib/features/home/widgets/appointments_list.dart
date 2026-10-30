import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawfirm_management_system/features/home/cubit/appointments_cubit.dart';
import 'package:lawfirm_management_system/features/home/cubit/appointment_states.dart';
import 'package:lawfirm_management_system/features/home/models/appointment_model.dart';

class AppointmentsList extends StatelessWidget {
  const AppointmentsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BlocBuilder<AppointmentsCubit, AppointmentsState>(
        builder: (context, state) {
          if (state is AppointmentsInitial || state is AppointmentsLoading) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: CircularProgressIndicator(),
              ),
            );
          }

          if (state is AppointmentsError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  state.message,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red),
                ),
              ),
            );
          }

          if (state is AppointmentsSuccess) {
            if (state.appointments.isEmpty) {
              return const Center(
                // Todo: extract it in another class
                child: Column(
                  children: [
                    Icon(
                      Icons.event_busy_outlined,
                      size: 48,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 12),
                    Text('مفيش مواعيد النهاردة 😊'),
                  ],
                ),
              );
            }

            return Column(
              children: state.appointments.map((appointment) {
                return AppointmentCard(appointment: appointment);
              }).toList(),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final AppointmentModel appointment;

  const AppointmentCard({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        margin: const EdgeInsets.only(bottom: 12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                appointment.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Text(appointment.description),
              const SizedBox(height: 12),
              _appointmentTypeLabel(appointment.type),
            ],
          ),
        ),
      ),
    );
  }

  Widget _appointmentTypeLabel(AppointmentType type) {
    switch (type) {
      case AppointmentType.session:
        return Row(
          children: [
            Icon(Icons.label_important, color: Colors.red),
            SizedBox(width: 3),
            Text('المهمه: جلسة', style: TextStyle(color: Colors.red)),
          ],
        );

      case AppointmentType.legalTask:
        return Row(
          children: [
            Icon(Icons.work, color: Colors.blue),
            SizedBox(width: 3),
            Text('المهمه: عمل إداري', style: TextStyle(color: Colors.blue)),
          ],
        );

      case AppointmentType.appointment:
        return Row(
          children: [
            Icon(Icons.date_range, color: Colors.green),
            SizedBox(width: 3),
            Text('المهمه: موعد ', style: TextStyle(color: Colors.green)),
          ],
        );
      case AppointmentType.other:
        return Row(
          children: [
            Icon(Icons.health_and_safety_sharp, color: Colors.blue),
            SizedBox(width: 3),
            Text('المهمه: أخرى ', style: TextStyle(color: Colors.blue)),
          ],
        );
    }
  }
}
