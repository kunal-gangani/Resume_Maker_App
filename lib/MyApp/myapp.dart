import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resume_builder_app/Routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ScreenUtilInit(
      designSize: Size(
        size.width,
        size.height,
      ),
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: Routes.myRoutes,
        );
      },
    );
  }
}
