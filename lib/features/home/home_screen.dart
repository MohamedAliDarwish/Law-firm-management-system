import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lawfirm_management_system/core/themes/color_manager.dart';
import 'package:lawfirm_management_system/core/widgets/custom_appbar.dart';
import 'package:lawfirm_management_system/core/widgets/heading_text.dart';
import 'package:lawfirm_management_system/features/home/cubit/appointments_cubit.dart';
import 'package:lawfirm_management_system/features/home/widgets/appointments_list.dart';
import 'package:lawfirm_management_system/features/home/widgets/calendar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AppointmentsCubit(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ColorManager.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          // padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              //Appbar
              CustomAppbar(
                content: HeadingText(
                  text: '${"hello".tr()} ${"mr".tr()}: محمد على',
                ),
              ),
              // Slider will be added here.

              SizedBox(height: 24),
              CalendarWidget(),
              // Calendar will be added here.
              SizedBox(height: 16),
              AppointmentsList(),
              // Appointments list will be added here.
              SizedBox(height: 24),

              // Action buttons will be added here.
              SizedBox(
                // height: 300,
                child: GridView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 1,
                  ),
                  children: [
                    GestureDetector(
                      onTap: () {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.error,
                          animType: AnimType.bottomSlide,
                          title: "Commint Soon",
                          desc: "الموكيلن جارى العمل على إضافتها",
                          btnOkOnPress: () {},
                        ).show();
                      },
                      child: Column(
                        children: [
                          FaIcon(FontAwesomeIcons.personBooth),
                          SizedBox(height: 10),
                          Text("الموكلين"),
                        ],
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.warning,
                          animType: AnimType.bottomSlide,
                          title: "Commint Soon",
                          desc: "التوكيلات جارى العمل على إضافتها",
                          btnOkOnPress: () {},
                        ).show();
                      },
                      child: Column(
                        children: [
                          FaIcon(FontAwesomeIcons.file, color: Colors.blue),
                          SizedBox(height: 10),
                          Text("التوكيلات"),
                        ],
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.error,
                          animType: AnimType.bottomSlide,
                          title: "Commint Soon",
                          desc: "المستندات جارى العمل على إضافتها",
                          btnOkOnPress: () {},
                        ).show();
                      },
                      child: Column(
                        children: [
                          FaIcon(FontAwesomeIcons.folder),
                          SizedBox(height: 10),
                          Text("المستندات"),
                        ],
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.error,
                          animType: AnimType.bottomSlide,
                          title: "Commint Soon",
                          desc: "القضايا جارى العمل على إضافتها",
                          btnOkOnPress: () {},
                        ).show();
                      },
                      child: Column(
                        children: [
                          FaIcon(FontAwesomeIcons.gavel),
                          SizedBox(height: 10),
                          Text("القضايا"),
                        ],
                      ),
                    ),

                    // SizedBox(height: 50),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: "إضافه موعد",
        backgroundColor: ColorManager.primary,
        child: Icon(Icons.add, color: ColorManager.secoundry),
      ),
    );
  }
}
