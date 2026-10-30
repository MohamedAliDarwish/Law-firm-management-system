import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawfirm_management_system/features/home/cubit/jome_states.dart';

class HomeCubit extends Cubit<HomeStates>{
  HomeCubit(): super(HomeInitState());
  Timer? timer;

  int currentIndex = 0;
 final List<Widget> slideItems = [
    Image.network('https://picsum.photos/id/1018/800/400'),
   Text( "test"),
    Image.network('https://picsum.photos/id/1015/800/400'),
    Text("Welcome 😊",),
    Image.network('https://picsum.photos/id/1019/800/400'),
  ];


  // banner timer
  void bannerTitmer({required PageController pageController}){
    timer = Timer.periodic(
      const Duration(seconds: 3),
      (timer) {
        if (!pageController.hasClients) return;

        int nextIndex = (currentIndex + 1) % slideItems.length;

        pageController.animateToPage(
          nextIndex,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      },
    );
  }
  // get banner data
  void bannerAutoSlider({required int currentIndex}){
   
   emit(HomeLoadingState());
   
   try{
    currentIndex + 1;
    emit(HomeSucessBaner(item: slideItems[currentIndex]));

   }catch(e){}
   
  }

}