import 'dart:async';
import 'package:hatooh/Attraction/attraction.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hatooh/home.dart';
import 'package:hatooh/main.dart';
import 'package:intl/intl.dart';

class ReservationConfirmee extends StatefulWidget {
  final AttractionModel attraction;

  ReservationConfirmee(
    this.attraction
  );

  @override
  State<ReservationConfirmee> createState() => _ReservationConfirmeeState();
}

class _ReservationConfirmeeState extends State<ReservationConfirmee> {
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      setState(() {
        isButtonEnabled = true;
      });
    });
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
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 113, left: 128, right: 127),
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    'images/Ellipse 2.svg',
                    height: 120,
                    width: 120,
                    color: Color(0xff3ADF00),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 143, left: 158, right: 157),
                    alignment: Alignment.center,
                    child: SvgPicture.asset('images/check.svg'))
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 32, left: 63, right: 63),
              child: Text(
                'Votre réservation a été réalisée avec succès.',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  color: grey_icon,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 92, left: 18),
              child: Text(
                'Résumé',
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 8),
            Container(
            height: 61,
            width: 340,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 12),
            margin: EdgeInsets.only(left: 18, right: 17, bottom: 24),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16), color: blanc),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 12),
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      alignment: Alignment.center,
                      height: 29,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: gris_clair,
                      ),
                      child: Text(
                        widget.attraction.lieu,
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          color: gris_pur,
                        ),
                      ),
                    ),
                    Container(
                      height: 29,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                          color: gris_clair,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        children: [
                          SvgPicture.asset('images/date plus.svg',
                              height: 20, width: 20, color: gris_pur),
                          SizedBox(width: 8),
                          Text(
                              DateFormat('d MMM', 'fr_FR').format(
                                  DateTime.parse(widget.attraction.date)),
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w400,
                                  color: gris_pur,
                                  fontSize: 15))
                        ],
                      ),
                    ),
                    Container(
                      height: 29,
                      width: 71,
                      margin: EdgeInsets.only(right: 12),
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                          color: gris_clair,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        children: [
                          SvgPicture.asset('images/time.svg',
                              height: 20, width: 20, color: gris_pur),
                          SizedBox(width: 8),
                          Text(
                              DateFormat('H\'h\'').format(DateTime.parse(
                                  '2022-01-01 ' + widget.attraction.heure)),
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w400,
                                  color: gris_pur,
                                  fontSize: 15))
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
            SizedBox(height: 190),
            GestureDetector(
               onTap: isButtonEnabled
                  ? () {
                      sendDataToServer();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    }
                  : null,
              child: Container(
                alignment: Alignment.center,
                height: 48,
                width: 340,
                margin: EdgeInsets.only(left: 18, right: 17),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: isButtonEnabled ? Colors.orange : gris_clair2,
                ),
                child: Text(
                  'Terminer',
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    color: isButtonEnabled ? Colors.white : gris_pur,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void sendDataToServer() async {
    var url = 'https://www.s-p5.com/dale/hatoohci/attraction.php';
    var response = await http.post(
      Uri.parse(url),
      body: {
        'nom': widget.attraction.nom,
        'date': widget.attraction.date,
        'heure': widget.attraction.heure,
        'lieu': widget.attraction.lieu,
        'images' : widget.attraction.images,
      },
    );

    if (response.statusCode == 200) {
      print('Données envoyées avec succès');
    } else {
      print('Erreur lors de l\'envoi des données: ${response.reasonPhrase}');
    }
  }
}

