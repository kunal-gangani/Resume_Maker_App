import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Education extends StatefulWidget {
  const Education({super.key});

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  final TextEditingController _courseController = TextEditingController();
  final TextEditingController _schoolController = TextEditingController();
  final TextEditingController _resultController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();

  @override
  void dispose() {
    _courseController.dispose();
    _schoolController.dispose();
    _resultController.dispose();
    _yearController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Education Details"),
          centerTitle: true,
          backgroundColor: Colors.green,
          elevation: 4,
        ),
        body: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildTextField(
                        controller: _courseController,
                        label: "Course / Degree",
                        hint: "e.g., Diploma in Computer Science",
                        icon: Icons.school_outlined,
                      ),
                      SizedBox(height: 20.h),
                      _buildTextField(
                        controller: _schoolController,
                        label: "School / College / Institute",
                        hint: "e.g., Bhagavan Mahavir University",
                        icon: Icons.location_city_outlined,
                      ),
                      SizedBox(height: 20.h),
                      _buildTextField(
                        controller: _resultController,
                        label: "Result",
                        hint: "e.g., 70% or 7.0 CGPA",
                        icon: Icons.grade_outlined,
                      ),
                      SizedBox(height: 20.h),
                      _buildTextField(
                        controller: _yearController,
                        label: "Year of Passing",
                        hint: "e.g., 2019",
                        icon: Icons.calendar_today_outlined,
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 30.h),
                      Center(
                        child: ElevatedButton(
                          onPressed: _saveDetails,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            elevation: 5, // Add elevation for a 3D effect
                            padding: EdgeInsets.symmetric(
                              horizontal: 50.w,
                              vertical: 15.h,
                            ),
                          ),
                          child: Text(
                            "Save Details",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveDetails() {
    final course = _courseController.text;
    final school = _schoolController.text;
    final result = _resultController.text;
    final year = _yearController.text;

    // Display a SnackBar to confirm the save action
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Details Saved: $course at $school'),
        duration: const Duration(seconds: 2),
      ),
    );

    // Optionally clear the fields after saving
    _clearFields();
  }

  void _clearFields() {
    _courseController.clear();
    _schoolController.clear();
    _resultController.clear();
    _yearController.clear();
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Material(
        elevation: 4, // Add elevation for a 3D effect
        borderRadius: BorderRadius.circular(30),
        child: TextFormField(
          controller: controller,
          cursorColor: Colors.green,
          cursorWidth: 2,
          style: const TextStyle(fontWeight: FontWeight.w500),
          maxLines: 1,
          textInputAction: TextInputAction.next,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: Colors.green,
            ),
            hintText: hint,
            hintStyle: TextStyle(
              color: Colors.grey.shade500,
            ),
            labelText: label,
            labelStyle: const TextStyle(
              color: Colors.green,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
    );
  }
}
