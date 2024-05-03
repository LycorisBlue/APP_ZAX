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

class WavePaiement extends StatefulWidget {
  final Item fetchedItems;
  final String selectedType;
  final String selectedCity;
  final String arrivalLabel;
  final String departureLabel;

  WavePaiement(
    this.fetchedItems,
    this.selectedType,
    this.selectedCity,
    this.arrivalLabel,
    this.departureLabel,
  );

  @override
  State<WavePaiement> createState() => _WavePaiementState();
}

class _WavePaiementState extends State<WavePaiement> {
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
      'pays' : 'CI',
      'operateurs' : 'WaveSN',
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
                child: Text('Paiement Wave',
                    style: GoogleFonts.roboto(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: text_noir
                    )),
              ),
              SizedBox(height: 24),
          Container(
                margin: EdgeInsets.only(left: 18, right: 17),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                height: 138,
                width: 340,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 40,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.asset(
                          'images/Wave.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      alignment: Alignment.center,
                      child: Text(
                        'Pour confirmer votre paiement, ouvrez Wave et cliquer sur Confirmer',
                        textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400,
                                        color: text_noir,
                                      ),),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 230),
          GestureDetector(
                onTap: () {
                  userAuth();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ReservationConfirmee(widget.fetchedItems, widget.selectedType,
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
                    borderRadius: BorderRadius.circular(8),
                    color: gris_clair2
                  ),
                  child: Text(
                        'Ouvrir Wave',
                        style: GoogleFonts.roboto(
                              fontSize: 16,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              color: gris_pur,
                            ),
                      )),
                ),
        ])));
  }
}
