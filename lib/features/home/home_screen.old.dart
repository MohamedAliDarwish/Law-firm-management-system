import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawfirm_management_system/core/widgets/custom_appbar.dart';
import 'package:lawfirm_management_system/core/widgets/heading_text.dart';
import 'package:lawfirm_management_system/features/home/cubit/home_cubit.dart';

// fonts:
// Amiri
// Rakkas

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    final PageController _pageController = PageController();
    

  


  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().bannerTitmer(pageController: _pageController);
  }

@override
void dispose() {

  _pageController.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //Appbar
            CustomAppbar(
              content: HeadingText(text: '${"hello".tr()} ${"mr".tr()}: محمد على'),
            ),
            //Appbar

            // content (body)
            
            //Annooucement (Slider)

            Container(
              height: 100,
              decoration: BoxDecoration(

              ),
              child: PageView.builder(
                itemCount: _slideItems.length,
                itemBuilder: (context,index){
                  return _slideItems[index];
                }),
            )
            
            //Annooucement (Slider)


            // content (body)
           
          ],
        ),
      ),
    );
  }
}