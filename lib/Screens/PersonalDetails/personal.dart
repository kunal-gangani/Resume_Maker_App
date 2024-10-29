import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resume_builder_app/variables/variable.dart';

File? image;
int index = 0;

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  final ImagePicker picker = ImagePicker();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  Future<void> pickImage({required ImageSource source}) async {
    final XFile? xFile = await picker.pickImage(source: source);
    if (xFile != null) {
      setState(() {
        image = File(xFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Personal Details",
          ),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0.w),
          child: Column(
            children: [
              _buildTabBar(),
              SizedBox(height: 25.h),
              Expanded(
                child: IndexedStack(
                  index: index,
                  children: [
                    _buildForm(),
                    _buildImageSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildTabItem("Contact", 0),
        _buildTabItem("Images", 1),
      ],
    );
  }

  Widget _buildTabItem(String title, int tabIndex) {
    return GestureDetector(
      onTap: () {
        setState(() {
          index = tabIndex;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: index == tabIndex ? Colors.teal : Colors.transparent,
              width: 3,
            ),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: index == tabIndex ? Colors.teal : Colors.black54,
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildTextField(
            controller: nameController,
            label: "Name",
            hint: "Enter your name",
          ),
          _buildTextField(
            controller: emailController,
            label: "Email",
            hint: "Enter your email",
            keyboardType: TextInputType.emailAddress,
          ),
          _buildTextField(
            controller: addressController,
            label: "Address",
            hint: "Enter your address",
            maxLines: 2,
          ),
          _buildTextField(
            controller: numberController,
            label: "Phone Number",
            hint: "Enter your number",
            keyboardType: TextInputType.phone,
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton("Submit", Colors.teal, _submitForm),
              _buildButton("Reset", Colors.red, _resetFields),
            ],
          ),
        ],
      ),
    );
  }

  void _submitForm() {
    setState(() {
      // Assign values to variables in variable.dart
      UserData.name = nameController.text;
      UserData.email = emailController.text;
      UserData.address = addressController.text;
      UserData.phoneNumber = numberController.text;
    });

    // Optionally, you can clear fields after submission
    _resetFields();
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        child: TextFormField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: keyboardType,
          cursorColor: Colors.teal,
          decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            labelStyle: const TextStyle(color: Colors.teal),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.teal, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.teal, width: 2),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String label, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  void _resetFields() {
    setState(() {
      nameController.clear();
      emailController.clear();
      addressController.clear();
      numberController.clear();
    });
  }

  Widget _buildImageSection() {
    return Container(
      height: 250.h,
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            radius: 70.w,
            backgroundImage: image != null
                ? FileImage(image!)
                : const NetworkImage(
                    "https://img.freepik.com/premium-vector/default-user-profile-vector-illustration_664995-334.jpg?ga=GA1.1.132821578.1730041723&semt=ais_hybrid",
                  ) as ImageProvider,
          ),
          FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: () => _showImagePicker(context),
            child: const Icon(Icons.add, color: Colors.teal),
          ),
        ],
      ),
    );
  }

  void _showImagePicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Pick Image"),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                pickImage(source: ImageSource.camera);
                Navigator.pop(context);
              },
              icon: const Icon(Icons.camera_alt, color: Colors.white),
              label: const Text("Camera"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
            ),
            ElevatedButton.icon(
              onPressed: () {
                pickImage(source: ImageSource.gallery);
                Navigator.pop(context);
              },
              icon: const Icon(Icons.image, color: Colors.white),
              label: const Text("Gallery"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
