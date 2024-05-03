import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hatooh/Welcome/delay_animation.dart';
import 'package:hatooh/Welcome/inscription.dart';
import 'package:hatooh/main.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  DateTime? _lastPressedTime;
  String _selectedLanguage = 'fr';

  String _getSelectedFlagIcon(String langue) {
    switch (langue) {
      case 'en':
        return 'images/anglais.svg';
      case 'fr':
        return 'images/français.svg';
      case 'es':
        return 'images/espagnol.svg';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height);
    return WillPopScope(
      onWillPop: () async {
        DateTime now = DateTime.now();
        if (_lastPressedTime == null ||
            now.difference(_lastPressedTime!) > const Duration(seconds: 2)) {
          _lastPressedTime = now;
          Fluttertoast.showToast(
              msg: "Appuyez de nouveau pour quitter l'application",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: gris_pur,
              textColor: blanc,
              fontSize: 14.sp);
          return false;
        }
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
          backgroundColor: orange,
          body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DelayedAnimation(
                      delay: 500,
                      child: Transform.translate(
                          offset: Offset(0.0, -83.h),
                          child: Container(
                              height: 220.h,
                              margin: EdgeInsets.symmetric(horizontal: 54.w),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(32.r),
                                  border: Border.all(color: blanc, width: 8.w)),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(24.r),
                                  child: Image.asset(
                                      'images/plage2.jpg',
                                      fit: BoxFit.cover))))),
                  DelayedAnimation(
                      delay: 500,
                      child: Transform.translate(
                          offset: Offset(0.0, -64.h),
                          child: Stack(children: [
                            Container(
                                height: 230.h,
                                margin: EdgeInsets.symmetric(horizontal: 54.w),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(32.r),
                                    border:
                                        Border.all(color: blanc, width: 8.w)),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(24.r),
                                    child: Image.asset(
                                        'images/plageci2.jpg',
                                        fit: BoxFit.cover))),
                            Positioned(
                                top: 90.h,
                                left: 150.w,
                                child: SvgPicture.asset(
                                    'images/point.svg',
                                    height: 40.h)),
                            Positioned(
                                top: 50.h,
                                left: 155.w,
                                child: SvgPicture.asset(
                                    'images/forme.svg',
                                    height: 60.h))
                          ]))),
                  SizedBox(height: 48.h),
                  DelayedAnimation(
                      delay: 800,
                      child: Transform.translate(
                          offset: Offset(0.0, -85.h),
                          child: Text('Hatooh',
                              style: GoogleFonts.roboto(
                                  fontSize: 48.sp,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                  color: blanc)))),
                  SizedBox(height: 8.h),
                  DelayedAnimation(
                      delay: 800,
                      child: Transform.translate(
                          offset: Offset(0.0, -93.h),
                          child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 85.w),
                              child: Text('slogan'.tr,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.roboto(
                                      fontSize: 16.sp,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      color: blanc))))),
                  Transform.translate(
                    offset: Offset(0, -70.h),
                    child: Container(
                      alignment: Alignment.center,
                      child: DropdownButton(
                          iconEnabledColor: blanc,
                          alignment: Alignment.center,
                          borderRadius: BorderRadius.circular(8.r),
                          dropdownColor: noir,
                          hint: SvgPicture.asset(
                              _getSelectedFlagIcon(_selectedLanguage),
                              height: 30.h),
                          items: [
                            buildDropItem('images/anglais.svg', 'en'),
                            buildDropItem('images/français.svg', 'fr'),
                            buildDropItem('images/espagnol.svg', 'es')
                          ],
                          value: _selectedLanguage,
                          onChanged: (value) {
                            setState(() {
                              _selectedLanguage = value.toString();
                              Get.updateLocale(Locale(value.toString()));
                            });
                          }),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0.0, -25.h),
                    child: DelayedAnimation(
                        delay: 1000,
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Inscription()));
                            },
                            child: Container(
                                alignment: Alignment.center,
                                height: 48.h,
                                margin: EdgeInsets.symmetric(horizontal: 18.w),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    color: blanc),
                                child: Text('commencer'.tr,
                                    style: GoogleFonts.roboto(
                                        fontSize: 16.sp,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500,
                                        color: orange))))),
                  )
                ]),
          )),
    );
  }

  DropdownMenuItem buildDropItem(String langue, String value) {
    return DropdownMenuItem(
      value: value,
      child: SvgPicture.asset(
        langue,
        height: 20.h,
      ),
    );
  }
}
