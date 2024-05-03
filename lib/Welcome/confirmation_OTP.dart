import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hatooh/home.dart';
import 'dart:async';
import 'package:hatooh/main.dart';

class ConfirmationOTP extends StatefulWidget {
  @override
  _ConfirmationOTPState createState() => _ConfirmationOTPState();
}

class _ConfirmationOTPState extends State<ConfirmationOTP> {
  late Timer _timer;
  int _secondsRemaining = 30;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        _timer.cancel();
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BoxConstraints(
      maxWidth: MediaQuery.of(context).size.width,
      maxHeight: MediaQuery.of(context).size.height,
    );
    return Scaffold(
        backgroundColor: gris_clair,
        body: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Stack(children: [
            Transform.translate(
                offset: Offset(0.0, -11.h),
                child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                        noir.withOpacity(0.5), BlendMode.srcATop),
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(32.r),
                            bottomRight: Radius.circular(32.r)),
                        child: Image.network(
                            'https://www.s-p5.com/dale/icônes/plageci4.jpg',
                            fit: BoxFit.cover,
                            height: 170.h,
                            width: double.infinity)))),
            Transform.translate(
                offset: Offset(0.0, -11.h),
                child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 80.h),
                    child: Image.network('https://www.s-p5.com/dale/icônes/logo_hatooh.png', height: 64.h)))
          ]),
          SizedBox(height: 33.h),
          Transform.translate(
              offset: Offset(0.0, -11.h),
              child: Text('Confirmation',
                  style: GoogleFonts.roboto(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w500,
                      color: noir))),
          SizedBox(height: 8.h),
          Transform.translate(
              offset: Offset(0.0, -11.h),
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 70.w),
                  child: Text(
                      'Renseignez le code que vous avez reçu sur votre numéro.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          color: gris_pur)))),
          SizedBox(height: 27.h),
          Form(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                Container(
                    height: 56.h,
                    width: 56.w,
                    margin: EdgeInsets.only(left: 56.w),
                    child: TextFormField(
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        onSaved: (pin1) {},
                        style: GoogleFonts.roboto(
                            fontSize: 16.sp,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            color: text_noir),
                        decoration: InputDecoration(
                            hintText: '_',
                            hintStyle: GoogleFonts.roboto(
                                fontSize: 12,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                color: text_noir),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: const BorderSide(color: transparent),
                            ),
                            filled: true,
                            fillColor: blanc,
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: transparent),
                                borderRadius: BorderRadius.circular(8.r))),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ])),
                SizedBox(
                    height: 56.h,
                    width: 56.w,
                    child: TextFormField(
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        onSaved: (pin2) {},
                        style: GoogleFonts.roboto(
                            fontSize: 16.sp,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            color: text_noir),
                        decoration: InputDecoration(
                            hintText: '_',
                            hintStyle: GoogleFonts.roboto(
                                fontSize: 12.sp,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                color: text_noir),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                borderSide:
                                    const BorderSide(color: transparent)),
                            filled: true,
                            fillColor: blanc,
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: transparent),
                                borderRadius: BorderRadius.circular(8.r))),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ])),
                SizedBox(
                    height: 56.h,
                    width: 56.w,
                    child: TextFormField(
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        onSaved: (pin3) {},
                        style: GoogleFonts.roboto(
                            fontSize: 16.sp,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            color: text_noir),
                        decoration: InputDecoration(
                            hintText: '_',
                            hintStyle: GoogleFonts.roboto(
                                fontSize: 12.sp,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                color: text_noir),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: const BorderSide(color: transparent),
                            ),
                            filled: true,
                            fillColor: blanc,
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: transparent),
                                borderRadius: BorderRadius.circular(8.r))),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ])),
                Container(
                    height: 56.h,
                    width: 56.w,
                    margin: EdgeInsets.only(right: 56.w),
                    child: TextFormField(
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        onSaved: (pin4) {},
                        style: GoogleFonts.roboto(
                            fontSize: 16.sp,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            color: text_noir),
                        decoration: InputDecoration(
                            hintText: '_',
                            hintStyle: GoogleFonts.roboto(
                                fontSize: 12.sp,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                color: text_noir),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: const BorderSide(color: transparent),
                            ),
                            filled: true,
                            fillColor: blanc,
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: transparent),
                                borderRadius: BorderRadius.circular(8.r))),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ]))
              ])),
          TextButton(
              onPressed: _secondsRemaining > 0
                  ? null
                  : () {
                      setState(() {
                        _secondsRemaining = 60;
                        _timer =
                            Timer.periodic(const Duration(seconds: 1), (timer) {
                          if (_secondsRemaining > 0) {
                            setState(() {
                              _secondsRemaining--;
                            });
                          } else {
                            _timer.cancel();
                            setState(() {});
                          }
                        });
                      });
                    },
              child: Text(
                  _secondsRemaining > 0
                      ? 'Renvoyer le code dans $_secondsRemaining ${_secondsRemaining == 1 ? 'seconde' : 'secondes'}'
                      : 'Obtenir un nouveau code',
                  style: GoogleFonts.roboto(
                      fontSize: 14.sp,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      color: _secondsRemaining > 0 ? gris_pur : orange))),
          SizedBox(height: 189.h),
          GestureDetector(
              onTap: isLoading ? null : _handleContinueButton,
              child: Container(
                  height: 48.h,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 18.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r), color: orange),
                  child: isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : Center(
                          child: Text('Continuer',
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                  color: blanc)))))
        ])));
  }

  void _handleContinueButton() {
    setState(() {
      isLoading = true;
    });
    setState(() {
      isLoading = false;
    });
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }
}
