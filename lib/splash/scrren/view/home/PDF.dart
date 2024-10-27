import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:resumbuilder/variables/variable.dart'; // Make sure this imports your variable file

class Pdf extends StatefulWidget {
  const Pdf({super.key});

  @override
  State<Pdf> createState() => _PdfState();
}

class _PdfState extends State<Pdf> {
  Future<Uint8List> pdfView() async {
    pw.Document pdf = pw.Document();

    ByteData assetByteData = await rootBundle.load("assets/images/call.png");

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) => pw.Row(
          children: [
            pw.Expanded(
              child: pw.Container(
                decoration: const pw.BoxDecoration(
                  color: PdfColor.fromInt(0xff163853),
                  borderRadius: pw.BorderRadius.only(
                    topLeft: pw.Radius.circular(25),
                    bottomLeft: pw.Radius.circular(25),
                  ),
                ),
                padding: const pw.EdgeInsets.all(18),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    // Profile Picture
                    pw.Container(
                      height: 120.h,
                      width: 120.w,
                      decoration: const pw.BoxDecoration(
                        color: PdfColors.white,
                        shape: pw.BoxShape.circle,
                      ),
                      alignment: pw.Alignment.center,
                      child: pw.Container(
                        height: 110.h,
                        width: 110.w,
                        decoration: pw.BoxDecoration(
                          color: PdfColors.grey,
                          shape: pw.BoxShape.circle,
                          image: pw.DecorationImage(
                            image: pw.MemoryImage(
                              assetByteData.buffer.asUint8List(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    pw.SizedBox(height: 25.h),
                    // Name
                    pw.Text(
                      UserData.name,
                      style: pw.TextStyle(
                        fontSize: 24.sp,
                        color: PdfColors.white,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.SizedBox(height: 10.h),
                    // Contact Information
                    pw.Text(
                      "Email: ${UserData.email}",
                      style: pw.TextStyle(
                        fontSize: 14.sp,
                        color: PdfColors.white,
                      ),
                    ),
                    pw.Text(
                      "Phone: ${UserData.phoneNumber}",
                      style: pw.TextStyle(
                        fontSize: 14.sp,
                        color: PdfColors.white,
                      ),
                    ),
                    pw.Text(
                      "Address: ${UserData.address}",
                      style: pw.TextStyle(
                        fontSize: 14.sp,
                        color: PdfColors.white,
                      ),
                    ),
                    pw.SizedBox(
                      height: 20.h,
                    ),

                    pw.Text(
                      "Education",
                      style: pw.TextStyle(
                        fontSize: 20.sp,
                        color: PdfColors.white,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.Text(
                      education, // Use the education variable
                      style: pw.TextStyle(
                        fontSize: 14.sp,
                        color: PdfColors.white,
                      ),
                    ),
                    pw.SizedBox(height: 20.h),
                    // Skills
                    pw.Text(
                      "Skills",
                      style: pw.TextStyle(
                        fontSize: 20.sp,
                        color: PdfColors.white,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    for (var skill in skills) // Assuming skills is a list
                      pw.Text(
                        skill,
                        style: pw.TextStyle(
                          fontSize: 14.sp,
                          color: PdfColors.white,
                        ),
                      ),
                    pw.SizedBox(height: 20.h),
                    // Languages
                    pw.Text(
                      "Languages",
                      style: pw.TextStyle(
                        fontSize: 20.sp,
                        color: PdfColors.white,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    for (var language
                        in languages) // Assuming languages is a list
                      pw.Text(
                        language,
                        style: pw.TextStyle(
                          fontSize: 14.sp,
                          color: PdfColors.white,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            pw.Expanded(
              flex: 2,
              child: pw.Container(
                decoration: pw.BoxDecoration(
                  color: PdfColors.white,
                  border: pw.Border.all(
                    color: PdfColors.grey,
                    width: 2.w,
                  ),
                  borderRadius: const pw.BorderRadius.only(
                    topRight: pw.Radius.circular(25),
                    bottomRight: pw.Radius.circular(25),
                  ),
                ),
                padding: const pw.EdgeInsets.all(25),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      "Experience",
                      style: pw.TextStyle(
                        fontSize: 20.sp,
                        color: const PdfColor.fromInt(0xff163853),
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.Text(
                      experience, // Use the experience variable
                      style: pw.TextStyle(
                        fontSize: 14.sp,
                        color: const PdfColor.fromInt(0xff163853),
                      ),
                    ),
                    pw.SizedBox(height: 20.h),
                    // Other sections like Declaration can go here
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

    return await pdf.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RESUME"),
      ),
      body: PdfPreview(
        build: (format) => pdfView(),
      ),
    );
  }
}
