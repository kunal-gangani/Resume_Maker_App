import 'package:flutter/cupertino.dart';
import 'package:resumbuilder/splash/scrren/personal/personal.dart';
import 'package:resumbuilder/splash/scrren/view/Carrier.dart';
import 'package:resumbuilder/splash/scrren/view/home/PDF.dart';
import 'package:resumbuilder/splash/scrren/view/home/home.dart';
import 'package:resumbuilder/splash/scrren/view/home/skill.dart';
import 'package:resumbuilder/splash/splash.dart';

import '../../splash/scrren/view/edu.dart';
import '../../splash/scrren/view/home/Declaration.dart';
import '../../splash/scrren/view/home/exp.dart';

class Routes {
  static String splashscreen = '/';
  static String homePage = 'home_page';
  static String personalDetails = 'personal_page';
  static String educationsPage = 'educations_page';
  static String careersPage = 'careers_page';
  static String experiencesPage = 'experiences_page';
  static String skillsPage = 'skills_page';
  static String declarationPage = 'declaration_page';
  static String pdfView = 'pdf_view';

  static Map<String, WidgetBuilder> myRoutes = {
    splashscreen: (context) => const SplashScreen(),
    homePage: (context) => const HomePage(),
    personalDetails: (context) => UserForm(),
    educationsPage: (context) => const Education(),
    careersPage: (context) => const Career(),
    experiencesPage: (context) => const Experience(),
    skillsPage: (context) => const SkillPage(),
    declarationPage: (context) => const Declaration(),
    pdfView: (context) => const Pdf(),
  };
}
