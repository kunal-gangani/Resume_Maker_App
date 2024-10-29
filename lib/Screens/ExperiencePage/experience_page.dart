import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

String cname = "";
String role = "";
int? expYear;
String? dateJoined;

class Experience extends StatefulWidget {
  const Experience({super.key});

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Experience"),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25.h),
              Text(
                "Enter Your Work Experience",
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.h),
              _buildCard(
                child: TextFormField(
                  cursorColor: Colors.green,
                  cursorWidth: 2,
                  style: const TextStyle(fontWeight: FontWeight.w400),
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: "e.g., ABC Corp",
                    hintStyle: TextStyle(color: Colors.grey),
                    labelText: "Company Name",
                    labelStyle: TextStyle(color: Colors.green),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.green,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  onChanged: (val) {
                    cname = val;
                  },
                ),
              ),
              SizedBox(height: 20.h),
              _buildCard(
                child: TextFormField(
                  cursorColor: Colors.green,
                  cursorWidth: 2,
                  style: const TextStyle(fontWeight: FontWeight.w400),
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: "e.g., HR",
                    hintStyle: TextStyle(color: Colors.grey),
                    labelText: "Role (optional)",
                    labelStyle: TextStyle(color: Colors.green),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.green,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  onChanged: (val) {
                    role = val;
                  },
                ),
              ),
              SizedBox(height: 20.h),
              _buildCard(
                child: TextFormField(
                  cursorColor: Colors.green,
                  cursorWidth: 2,
                  style: const TextStyle(fontWeight: FontWeight.w400),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "e.g., 5",
                    hintStyle: TextStyle(color: Colors.grey),
                    labelText: "Experience Years (optional)",
                    labelStyle: TextStyle(color: Colors.green),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.green,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  onChanged: (val) {
                    expYear = int.tryParse(val);
                  },
                ),
              ),
              SizedBox(height: 20.h),
              _buildCard(
                child: TextFormField(
                  cursorColor: Colors.green,
                  cursorWidth: 2,
                  style: const TextStyle(fontWeight: FontWeight.w400),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    hintText: "DD/MM/YYYY",
                    hintStyle: TextStyle(color: Colors.grey),
                    labelText: "Date Joined",
                    labelStyle: TextStyle(color: Colors.green),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.green,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  onChanged: (val) {
                    dateJoined = val;
                  },
                ),
              ),
              SizedBox(height: 30.h),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle save action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 50.w,
                      vertical: 15.h,
                    ),
                  ),
                  child: Text(
                    "Save Details",
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard({required Widget child}) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: child,
      ),
    );
  }
}
