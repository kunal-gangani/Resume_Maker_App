import 'package:flutter/material.dart';
import 'package:resume_builder_app/Screens/CareerPage/career.dart';
import 'package:resume_builder_app/Screens/DeclarationPage/declaration.dart';
import 'package:resume_builder_app/Screens/EducationPage/education_page.dart';
import 'package:resume_builder_app/Screens/ExperiencePage/experience_page.dart';
import 'package:resume_builder_app/Screens/HomePage/home_page.dart';
import 'package:resume_builder_app/Screens/PDFViewPage/pdf_view.dart';
import 'package:resume_builder_app/Screens/PersonalDetails/personal.dart';
import 'package:resume_builder_app/Screens/SkillsPage/skills_page.dart';
import 'package:resume_builder_app/Screens/SplashScreen/splash_screen.dart';

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
    personalDetails: (context) => const PersonalDetails(),
    educationsPage: (context) => const Education(),
    careersPage: (context) => const Career(),
    experiencesPage: (context) => const Experience(),
    skillsPage: (context) => const SkillPage(),
    declarationPage: (context) => const Declaration(),
    pdfView: (context) => const Pdf(),
  };
}
