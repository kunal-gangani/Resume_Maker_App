import 'package:flutter/material.dart';
import 'package:resume_builder_app/Routes/routes.dart';

List<Map<String, dynamic>> categories = [
  {
    'icon': Icons.person,
    'text': "Personal",
    'routes': Routes.personalDetails,
  },
  {
    'icon': Icons.school,
    'text': "Educations",
    'routes': Routes.educationsPage,
  },
  {
    'icon': Icons.work,
    'text': "Career",
    'routes': Routes.careersPage,
  },
  {
    'icon': Icons.business_center,
    'text': "Experience",
    'routes': Routes.experiencesPage,
  },
  {
    'icon': Icons.lightbulb,
    'text': "Skills",
    'routes': Routes.skillsPage,
  },
  {
    'icon': Icons.assignment,
    'text': "Declaration",
    'routes': Routes.declarationPage,
  },
];
