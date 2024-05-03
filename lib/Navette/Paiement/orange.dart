import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
          preferredSize: Size.fromHeight(96),
          child: Stack(
            children: [
              AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 18),
                          child: SvgPicture.asset(
                            'images/back.svg',
                            height: 32,
                            width: 32,
                          ),
                        ),
                      ),
                      Container(
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(right: 17),
                          child: Text(
                            'Réservation',
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontSize: 16,
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
              Container(
                margin: EdgeInsets.only(top: 35),
                alignment: Alignment.center,
                child: Text(widget.fetchedItems.categorie,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 28,
                      color: text_noir,
                    )),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(widget.fetchedItems.nom,
                    style: GoogleFonts.inter(
                        fontSize: 12,
                        color: gris_pur,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500)),
              ),
              SizedBox(height: 97),
              Container(
                child: Text('Paiement Orange',
                    style: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: text_noir)),
              ),
              SizedBox(height: 24),
              Container(
                margin: EdgeInsets.only(left: 18, right: 17),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                height: 211,
                width: 340,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 40,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.asset(
                              'images/orange.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          alignment: Alignment.center,
                          child: Text('Votre numéro de téléphone',
                              style: GoogleFonts.roboto(
                                fontSize: 16,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                color: text_noir,
                              )),
                        ),
                        SizedBox(height: 4),
                        Container(
                          alignment: Alignment.center,
                          child: Text('Vous recevrez un code de confirmation',
                              style: GoogleFonts.roboto(
                                fontSize: 14,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffbcbcbc),
                              )),
                        ),
                        SizedBox(height: 32),
                        Container(
                          padding: EdgeInsets.only(top: 10),
                            height: 40,
                            width: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: gris_clair),
                            child: TextFormField(
                              style: GoogleFonts.roboto(
                            color: gris_pur,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 16),
                              decoration: InputDecoration(
                                hintText: '_   _   _   _   _   _   _   _   _   _',
                                hintStyle: GoogleFonts.roboto(
                                    color: grey_icon,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                                filled: true,
                                fillColor: gris_clair,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors
                                          .transparent)),
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
              SizedBox(height: 150),
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
                height: 48,
                width: 340,
                margin: EdgeInsets.only(left: 18, right: 17),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), color: orange),
                child: Text(
                  'Continuer',
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
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
          preferredSize: Size.fromHeight(96),
          child: Stack(
            children: [
              AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 18),
                          child: SvgPicture.asset(
                            'images/back.svg',
                            height: 32,
                            width: 32,
                          ),
                        ),
                      ),
                      Container(
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(right: 17),
                          child: Text(
                            'Réservation',
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontSize: 16,
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
              Container(
                margin: EdgeInsets.only(top: 35),
                alignment: Alignment.center,
                child: Text(fetchedItems.categorie,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 28,
                      color: text_noir,
                    )),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(fetchedItems.nom,
                    style: GoogleFonts.inter(
                        fontSize: 12,
                        color: gris_pur,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500)),
              ),
              SizedBox(height: 97),
              Container(
                child: Text('Paiement Orange',
                    style: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: text_noir)),
              ),
              SizedBox(height: 24),
              Container(
                margin: EdgeInsets.only(left: 18, right: 17),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 24),
                height: 197,
                width: 340,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 40,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.asset(
                              'images/orange.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          alignment: Alignment.center,
                          child: Text('Votre code de confirmation',
                              style: GoogleFonts.roboto(
                                fontSize: 16,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                color: text_noir,
                              )),
                        ),
                        SizedBox(height: 32),
                        Container(
                            child: Form(
                                child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 48,
                                  width: 48,
                                  child: TextFormField(
                                    onChanged: (value) {
                                      if (value.length == 1) {
                                        FocusScope.of(context).nextFocus();
                                      }
                                    },
                                    onSaved: (pin1) {},
                                    style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      color: grey_icon,
                                    ),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(16),
                                      hintText: '_',
                                      hintStyle: GoogleFonts.roboto(
                                        fontSize: 14,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400,
                                        color: grey_icon,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      filled: true,
                                      fillColor: gris_clair,
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                        borderRadius: BorderRadius.circular(8),
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
                                  height: 48,
                                  width: 48,
                                  child: TextFormField(
                                    onChanged: (value) {
                                      if (value.length == 1) {
                                        FocusScope.of(context).nextFocus();
                                      }
                                    },
                                    onSaved: (pin2) {},
                                    style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      color: grey_icon,
                                    ),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(16),
                                      hintText: '_',
                                      hintStyle: GoogleFonts.roboto(
                                        fontSize: 14,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400,
                                        color: grey_icon,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      filled: true,
                                      fillColor: gris_clair,
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                        borderRadius: BorderRadius.circular(8),
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
                                  height: 48,
                                  width: 48,
                                  child: TextFormField(
                                    onChanged: (value) {
                                      if (value.length == 1) {
                                        FocusScope.of(context).nextFocus();
                                      }
                                    },
                                    onSaved: (pin3) {},
                                    style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      color: grey_icon,
                                    ),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(16),
                                      hintText: '_',
                                      hintStyle: GoogleFonts.roboto(
                                        fontSize: 14,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400,
                                        color: grey_icon,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      filled: true,
                                      fillColor: gris_clair,
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                        borderRadius: BorderRadius.circular(8),
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
                                  height: 48,
                                  width: 48,
                                  child: TextFormField(
                                    onChanged: (value) {
                                      if (value.length == 1) {
                                        FocusScope.of(context).nextFocus();
                                      }
                                    },
                                    onSaved: (pin4) {},
                                    style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      color: grey_icon,
                                    ),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(16),
                                      hintText: '_',
                                      hintStyle: GoogleFonts.roboto(
                                        fontSize: 14,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400,
                                        color: grey_icon,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      filled: true,
                                      fillColor: gris_clair,
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                        borderRadius: BorderRadius.circular(8),
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
                        ))),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 170),
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
                height: 48,
                width: 340,
                margin: EdgeInsets.only(left: 18, right: 17),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), color: orange),
                child: Text(
                  'Continuer',
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                )),
          ),
            ],
          ),
        ));
  }
}

