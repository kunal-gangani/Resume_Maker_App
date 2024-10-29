import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Career extends StatefulWidget {
  const Career({super.key});

  @override
  State<Career> createState() => _CareerState();
}

class _CareerState extends State<Career> {
  String description = "";
  String currentDesignation = "";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Career Objective"),
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
                "Describe Your Career Goals",
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.h),
              _buildCard(
                child: TextFormField(
                  cursorColor: Colors.green,
                  cursorWidth: 2,
                  style: const TextStyle(fontWeight: FontWeight.w400),
                  maxLines: 6,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: "About you...",
                    hintStyle: TextStyle(color: Colors.grey),
                    labelText: "Description",
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
                    description = val;
                  },
                ),
              ),
              SizedBox(height: 20.h),
              _buildCard(
                child: TextFormField(
                  cursorColor: Colors.green,
                  cursorWidth: 2,
                  style: const TextStyle(fontWeight: FontWeight.w400),
                  maxLines: 1,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: "e.g., Software Engineer",
                    hintStyle: TextStyle(color: Colors.grey),
                    labelText: "Current Designation",
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
                    currentDesignation = val;
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
