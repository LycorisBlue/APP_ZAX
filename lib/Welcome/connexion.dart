import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hatooh/home.dart';
import 'package:hatooh/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';

class Connexion extends StatefulWidget {
  const Connexion({Key? key}) : super(key: key);

  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  TextEditingController phoneNumberController = TextEditingController();

  String errorMessage = '';
  final Box _boxUser = Hive.box("accounts");

  void submitPhoneNumber(BuildContext context) async {
    try {
      String phoneNumber = phoneNumberController.text;
      if (phoneNumber.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: Duration(seconds: 2),
            backgroundColor: gris_clair,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r))),
            content: Container(
                height: 16.h,
                alignment: Alignment.center,
                child: Text('connexion_numero'.tr,
                    style: GoogleFonts.roboto(fontSize: 14.sp, color: rouge)))));
        return;
      }

      var url = Uri.parse('https://www.s-p5.com/dale/hatoohci/connexion.php');
      var response = await http.post(url, body: {'ndt': phoneNumber});

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        if (jsonResponse['success'] == true) {
          var userData = jsonResponse['data'];
          _boxUser.put("name", userData['Nometprenom']);
          _boxUser.put("email", userData['email']);
          _boxUser.put("userId", userData['id']);
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
        } else {
          setState(() {
            errorMessage = jsonResponse['message'];
          });
        }
      } else {
        setState(() {
          errorMessage = 'Erreur de connexion avec le serveur : ${response.statusCode}';
        });
      }

      if (errorMessage.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: Duration(seconds: 2),
            backgroundColor: gris_clair,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r))),
            content: Container(
                height: 16.h,
                alignment: Alignment.center,
                child: Text(errorMessage, style: GoogleFonts.roboto(fontSize: 14.sp, color: rouge)))));
      }
    } catch (error) {
      setState(() {
        errorMessage = 'Erreur lors de la requête HTTP : $error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height);
    return Scaffold(
        backgroundColor: gris_clair,
        body: SingleChildScrollView(
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Stack(children: [
            Transform.translate(
                offset: Offset(0.0, -11.h),
                child: ColorFiltered(
                    colorFilter: ColorFilter.mode(noir.withOpacity(0.5), BlendMode.srcATop),
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(32.r), bottomRight: Radius.circular(32.r)),
                        child: Image.asset('images/plageci4.jpg',
                            fit: BoxFit.cover, height: 170.h, width: double.infinity)))),
            Transform.translate(
                offset: Offset(0.0, -11.h),
                child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 80.h),
                    child: Image.asset('images/hatooh_blanc.png', height: 64.h)))]),
          SizedBox(height: 33.h),
          Transform.translate(
              offset: Offset(0.0, -11.h),
              child: Text('connexion'.tr,
                  style: GoogleFonts.roboto(fontSize: 28.sp, fontWeight: FontWeight.w500, color: noir))),
          SizedBox(height: 8.h),
          Transform.translate(
              offset: Offset(0.0, -11.h),
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 84.w),
                  child: Text('connexion_message'.tr,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(fontWeight: FontWeight.w400, fontSize: 16.sp, color: gris_pur)))),
          SizedBox(height: 27.h),
          Transform.translate(
              offset: Offset(0.0, -11.h),
              child: Container(
                  height: 58.h,
                  margin: EdgeInsets.symmetric(horizontal: 18.w),
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                  decoration: BoxDecoration(color: blanc, borderRadius: BorderRadius.circular(16.r)),
                  child: Column(children: [
                    Container(
                        height: 42.h,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: errorMessage.isNotEmpty
                                    ? rouge
                                    : transparent,
                                width: 1.w),
                            borderRadius: BorderRadius.circular(8.r)),
                        child: TextFormField(
                            controller: phoneNumberController,
                            keyboardType: TextInputType.phone,
                            style: GoogleFonts.roboto(
                                color: text_noir,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.sp),
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 16.w, right: 16.w),
                                errorStyle: GoogleFonts.poppins(fontSize: 0),
                                hintText: 'numero_existant'.tr,
                                hintStyle: GoogleFonts.roboto(
                                    color: gris_pur,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.sp),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: transparent),
                                    borderRadius: BorderRadius.circular(8.r)),
                                filled: true,
                                fillColor: gris_clair,
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: transparent),
                                    borderRadius: BorderRadius.circular(8.r))))),
                    if (errorMessage.isNotEmpty)
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Text(errorMessage, style: TextStyle(color: rouge, fontSize: 0)))]))),
          SizedBox(height: 228.h),
          GestureDetector(
              onTap: () {
                submitPhoneNumber(context);
              },
              child: Container(
                  height: 48.h,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 18.w),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r), color: orange),
                  child: Text('continuer'.tr,
                      style: GoogleFonts.roboto(fontWeight: FontWeight.w500, fontSize: 16.sp, color: blanc))))])));
  }
}
