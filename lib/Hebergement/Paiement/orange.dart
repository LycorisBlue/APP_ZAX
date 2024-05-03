import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hatooh/Hebergement/resultats.dart';
import 'package:hatooh/main.dart';
import 'package:hatooh/Hebergement/reservation_confirmee.dart';
import 'package:http/http.dart' as http;

var merchandID = 'C_5696ADED4C7FD';
var apiKEY = 'pk_syca_c29210c11f69e50e16a0ba472638b9d05641ae24';
var baseUrlAuth = 'https://dev.sycapay.net/api/login.php';
var baseUrlPay = 'https://dev.sycapay.net/api/checkoutpay.php';

class OrangePaiement extends StatefulWidget {
  final Item fetchedItems;
  final String selectedType;
  final String selectedCity;
  final String arrivalLabel;
  final String departureLabel;

  OrangePaiement(
    this.fetchedItems,
    this.selectedType,
    this.selectedCity,
    this.arrivalLabel,
    this.departureLabel,
  );

  @override
  State<OrangePaiement> createState() => _OrangePaiementState();
}

class _OrangePaiementState extends State<OrangePaiement> {
  String? token;

  void userAuth() async{
  final response = await http.post(Uri.parse(baseUrlAuth), headers: {
    'X-SYCA-MERCHANDID' : merchandID,
    'X-SYCA-APIKEY' : apiKEY,
    'X-SYCA-REQUEST-DATA-FORMAT' : 'JSON',
    'X-SYCA-RESPONSE-DATA-FORMAT' : 'JSON',
  },
  body: jsonEncode({
    'montant' : widget.fetchedItems.tarif,
    'currency' : 'XOF',
  }));

 debugPrint(response.body);
 String? tk = jsonDecode(response.body)['token'];
 if (tk is String) {
  userPay(tk);
 }
//  setState(() {
//    token = jsonDecode(response.body)['token'];
//  });
}

  void userPay(String token) async {
    final response = await http.post(Uri.parse(baseUrlPay), 
    body: jsonEncode({
      'marchandid' : merchandID,
      'token' : token,
      'telephone' : '0779054716',
      'montant' : widget.fetchedItems.tarif,
      'currency' : 'XOF',
      'numcommande' : token,
      'otp' : '7908'
    }));

    debugPrint(response.body);
  }

  @override
  Widget build(BuildContext context) {
    BoxConstraints(
      maxWidth: MediaQuery.of(context).size.width,
      maxHeight: MediaQuery.of(context).size.height,
    );
    return Scaffold(
        backgroundColor: gris_clair,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(96.h),
          child: Stack(
            children: [
              AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: blanc,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25.r),
                    bottomRight: Radius.circular(25.r),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 40.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 18.w),
                          child: SvgPicture.asset(
                            'images/back.svg',
                            height: 32.h,
                          ),
                        ),
                      ),
                      Container(
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(right: 17.w),
                          child: Text(
                            'Réservation',
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontSize: 16.sp,
                              color: text_noir,
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 35.h),
              Container(
                alignment: Alignment.center,
                child: Text(widget.fetchedItems.categorie,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 28.sp,
                      color: text_noir,
                    )),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(widget.fetchedItems.nom,
                    style: GoogleFonts.inter(
                        fontSize: 12.sp,
                        color: gris_pur,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500)),
              ),
              SizedBox(height: 70.h),
              Text('Paiement Orange',
                  style: GoogleFonts.roboto(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: text_noir)),
              SizedBox(height: 20.h),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 18.h),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: blanc),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 35.h,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: Image.asset(
                              'images/orange.png',
                            ),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Container(
                          alignment: Alignment.center,
                          child: Text('Votre numéro de téléphone',
                              style: GoogleFonts.roboto(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: text_noir,
                              )),
                        ),
                        SizedBox(height: 4.h),
                        Container(
                          alignment: Alignment.center,
                          child: Text('Vous recevrez un code de confirmation',
                              style: GoogleFonts.roboto(
                                fontSize: 14.sp,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                color: grey_icon,
                              )),
                        ),
                        SizedBox(height: 25.h),
                        Container(
                            height: 40.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                color: gris_clair),
                            child: TextFormField(
                              style: GoogleFonts.roboto(
                            color: gris_pur,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 16.sp),
                              decoration: InputDecoration(
                                hintText: '_   _   _   _   _   _   _   _   _   _',
                                hintStyle: GoogleFonts.roboto(
                                    color: grey_icon,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.sp),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: transparent),
                                ),
                                filled: true,
                                fillColor: gris_clair,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: transparent)),
                              ),
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 120.h),
          GestureDetector(
            onTap: () {
              userAuth();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CodeORANGE(widget.fetchedItems, widget.selectedType,
                                  widget.selectedCity,
                                  widget.arrivalLabel,
                                  widget.departureLabel,)));
            },
            child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 18.w),
                padding: EdgeInsets.symmetric(vertical: 10.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r), color: orange),
                child: Text(
                  'Continuer',
                  style: GoogleFonts.roboto(
                    fontSize: 16.sp,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    color: blanc,
                  ),
                )),
          ),
            ],
          ),
        ));
  }
}
class CodeORANGE extends StatelessWidget {
  final Item fetchedItems;
  final String selectedType;
  final String selectedCity;
  final String arrivalLabel;
  final String departureLabel;

  CodeORANGE(this.fetchedItems,
    this.selectedType,
    this.selectedCity,
    this.arrivalLabel,
    this.departureLabel,);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: gris_clair,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(96.h),
          child: Stack(
            children: [
              AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: blanc,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25.r),
                    bottomRight: Radius.circular(25.r),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 40.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 18.w),
                          child: SvgPicture.asset(
                            'images/back.svg',
                            height: 32.h,
                          ),
                        ),
                      ),
                      Container(
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(right: 17.w),
                          child: Text(
                            'Réservation',
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontSize: 16.sp,
                              color: text_noir,
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 32.h),
              Container(
                alignment: Alignment.center,
                child: Text(fetchedItems.categorie,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 28.sp,
                      color: text_noir,
                    )),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(fetchedItems.nom,
                    style: GoogleFonts.inter(
                        fontSize: 12.sp,
                        color: gris_pur,
                        fontWeight: FontWeight.w500)),
              ),
              SizedBox(height: 70.h),
              Text('Paiement Orange',
                  style: GoogleFonts.roboto(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: text_noir)),
              SizedBox(height: 20.h),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 18.w),
                padding: EdgeInsets.symmetric(horizontal: 60.w, vertical: 16.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: blanc),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 35.h,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Image.asset(
                          'images/orange.png',
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      alignment: Alignment.center,
                      child: Text('Votre code de confirmation',
                          style: GoogleFonts.roboto(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: text_noir,
                          )),
                    ),
                    SizedBox(height: 25.h),
                    Form(
                        child: Column(
                                          children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 48.h,
                          width: 48.w,
                          child: TextFormField(
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            onSaved: (pin1) {},
                            style: GoogleFonts.roboto(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: grey_icon,
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                              hintText: '_',
                              hintStyle: GoogleFonts.roboto(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: grey_icon,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                borderSide: BorderSide(
                                    color: transparent),
                              ),
                              filled: true,
                              fillColor: gris_clair,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: transparent),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 48.h,
                          width: 48.w,
                          child: TextFormField(
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            onSaved: (pin2) {},
                            style: GoogleFonts.roboto(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: grey_icon,
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                              hintText: '_',
                              hintStyle: GoogleFonts.roboto(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: grey_icon,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                borderSide: BorderSide(
                                    color: transparent),
                              ),
                              filled: true,
                              fillColor: gris_clair,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: transparent),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 48.h,
                          width: 48.w,
                          child: TextFormField(
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            onSaved: (pin3) {},
                            style: GoogleFonts.roboto(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: grey_icon,
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                              hintText: '_',
                              hintStyle: GoogleFonts.roboto(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: grey_icon,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                borderSide: BorderSide(
                                    color: transparent),
                              ),
                              filled: true,
                              fillColor: gris_clair,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: transparent),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 48.h,
                          width: 48.w,
                          child: TextFormField(
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            onSaved: (pin4) {},
                            style: GoogleFonts.roboto(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: grey_icon,
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                              hintText: '_',
                              hintStyle: GoogleFonts.roboto(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: grey_icon,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                borderSide: BorderSide(
                                    color: transparent),
                              ),
                              filled: true,
                              fillColor: gris_clair,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: transparent),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                      ],
                    ),
                                          ],
                                        )),
                  ],
                ),
              ),
              SizedBox(height: 130.h),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ReservationConfirmee(fetchedItems, selectedType,
                                  selectedCity,
                                  arrivalLabel,
                                  departureLabel,)));
            },
            child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 10.h),
                margin: EdgeInsets.symmetric(horizontal: 18.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r), color: orange),
                child: Text(
                  'Continuer',
                  style: GoogleFonts.roboto(
                    fontSize: 16.sp,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    color: blanc,
                  ),
                )),
          ),
            ],
          ),
        ));
  }
}

