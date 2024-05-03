import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hatooh/Hebergement/resultats.dart';
import 'package:hatooh/home.dart';
import 'package:hatooh/main.dart';

class ReservationConfirmee extends StatefulWidget {
  final Item fetchedItems;
  final String selectedType;
  final String selectedCity;
  final String arrivalLabel;
  final String departureLabel;

  ReservationConfirmee(
    this.fetchedItems,
    this.selectedType,
    this.selectedCity,
    this.arrivalLabel,
    this.departureLabel,
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
              height: 102,
              width: 340,
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.only(left: 18, right: 17),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 29,
                        width: 120,
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: gris_clair),
                        child: Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset('images/Home.svg',
                                    color: grey_icon, height: 20, width: 20),
                                    SizedBox(width: 8),
                                Text(
                                  widget.fetchedItems.categorie,
                                  style: GoogleFonts.roboto(
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      color: gris_pur),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 29,
                        width: 145,
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: gris_clair),
                        child: Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset('images/locatlisation.svg',
                                    color: grey_icon, height: 20, width: 20),
                                    SizedBox(width: 8),
                                Text(
                                  widget.fetchedItems.nom,
                                  style: GoogleFonts.roboto(
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      color: gris_pur),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 29,
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: gris_clair),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset('images/date plus.svg',
                                color: grey_icon,
                                height: 20,
                                width: 20),
                                SizedBox(width: 8),
                            Row(
                              children: [
                                Text(
                                  widget.arrivalLabel,
                                  style: GoogleFonts.roboto(
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      color: gris_pur),
                                ),
                                Text(
                                  ' - ',
                                  style: GoogleFonts.roboto(
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      color: gris_pur),
                                ),
                                Text(
                                  widget.departureLabel,
                                  style: GoogleFonts.roboto(
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      color: gris_pur),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 29,
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: gris_clair),
                        child: Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset('images/locatlisation.svg',
                                    color: grey_icon, height: 20, width: 20),
                                    SizedBox(width: 8),
                                Text(
                                  widget.selectedCity,
                                  style: GoogleFonts.roboto(
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      color: gris_pur),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 170),
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
    var url = 'https://www.s-p5.com/dale/hatoohci/hebergement.php';

    var response = await http.post(
      Uri.parse(url),
      body: {
        'types': widget.fetchedItems.categorie,
        'nom': widget.fetchedItems.nom,
        'arrivee': widget.arrivalLabel,
        'depart': widget.departureLabel,
        'ville': widget.selectedCity,
        'images' : widget.fetchedItems.images,
      },
    );

    if (response.statusCode == 200) {
      print('Données envoyées avec succès');
    } else {
      print('Erreur lors de l\'envoi des données: ${response.reasonPhrase}');
    }
  }
}

