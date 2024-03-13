import 'package:flutter/material.dart';


import 'package:get/get.dart';


import 'package:sahtech/view/home/home%20page/home.dart';


import 'splash_screen.dart';


import 'utils/app_routes.dart';


void main() {

  runApp(const MyApp());

}


class MyApp extends StatelessWidget {

  const MyApp({super.key});


  @override

  Widget build(BuildContext context) {

    false;


    return GetMaterialApp(

      debugShowCheckedModeBanner: false,

      theme: ThemeData(

        useMaterial3: true,

      ),

      initialRoute: AppRoutes.doctorProfile,

      getPages: AppRoutes().appRoutes,

    );

  }

}

