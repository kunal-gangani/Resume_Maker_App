import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Declaration extends StatefulWidget {
  const Declaration({super.key});

  @override
  State<Declaration> createState() => _DeclarationState();
}

class _DeclarationState extends State<Declaration> {
  bool isVisible = false; // Control visibility of form fields
  String declaration = "";
  String decDate = "";
  String decPlace = "";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // Dismiss keyboard on tap
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Declaration"),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Declaration",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Switch(
                    activeColor: Colors.green,
                    value: isVisible,
                    onChanged: (val) {
                      setState(() {
                        isVisible = val; // Update visibility
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              if (isVisible) ...[
                _buildCard(
                  title: "Description",
                  hint: "Enter your declaration",
                  onChanged: (val) {
                    declaration = val; // Update declaration
                  },
                ),
                const SizedBox(height: 20),
                _buildCard(
                  title: "Birth Date",
                  hint: "DD/MM/YYYY",
                  onChanged: (val) {
                    decDate = val; // Update date
                  },
                ),
                const SizedBox(height: 20),
                _buildCard(
                  title: "City",
                  hint: "E.g. Surat",
                  onChanged: (val) {
                    decPlace = val; // Update place
                  },
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required String hint,
    required ValueChanged<String> onChanged,
  }) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              cursorColor: Colors.green,
              cursorWidth: 2,
              style: const TextStyle(fontWeight: FontWeight.w400),
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: const TextStyle(color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.teal),
                  borderRadius: BorderRadius.circular(10),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.teal),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.green, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
