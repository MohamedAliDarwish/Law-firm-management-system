import 'package:flutter/material.dart';

sealed class HomeStates{}

class HomeInitState extends HomeStates{}
class HomeLoadingState extends HomeStates{}
class HomeSucessState extends HomeStates{}
class HomeSucessBaner extends HomeStates {
  final Widget item;
  HomeSucessBaner({required this.item});
}
class HomeFailState extends HomeStates{
  String errorMessage;
  HomeFailState({required this.errorMessage});
}
