import 'package:flutter/material.dart';
import 'package:money_manager/config/names.dart';
import 'package:money_manager/features/home/presentation/screens/home_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  ScreenNames.homeScreen: (context) => const HomeScreen(),
};
