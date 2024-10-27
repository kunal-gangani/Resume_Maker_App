import 'package:flutter/material.dart';
import 'package:resumbuilder/splash/scrren/view/home/PDF.dart';
import 'package:resumbuilder/variables/variable.dart';

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController educationController = TextEditingController();
  final TextEditingController experienceController = TextEditingController();
  final TextEditingController skillsController = TextEditingController();
  final TextEditingController languagesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          // Ensures scrolling for smaller screens
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
              TextField(
                controller: addressController,
                decoration: const InputDecoration(
                  labelText: 'Address',
                ),
              ),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                ),
              ),
              TextField(
                controller: educationController,
                decoration: const InputDecoration(
                  labelText: 'Education',
                ),
              ),
              TextField(
                controller: experienceController,
                decoration: const InputDecoration(
                  labelText: 'Experience',
                ),
              ),
              TextField(
                controller: skillsController,
                decoration: const InputDecoration(
                  labelText: 'Skills (comma-separated)',
                ),
              ),
              TextField(
                controller: languagesController,
                decoration: const InputDecoration(
                  labelText: 'Languages (comma-separated)',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    UserData.name = nameController.text;
                    UserData.email = emailController.text;
                    UserData.address = addressController.text;
                    UserData.email = phoneController.text;

                    skills = skillsController.text
                        .split(',')
                        .map((skill) => skill.trim())
                        .toList();
                    languages = languagesController.text
                        .split(',')
                        .map((language) => language.trim())
                        .toList();
                  });

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Pdf(),
                    ),
                  );
                },
                child: const Text(
                  'Submit',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
