import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hatooh/Attraction/Paiement/orange.dart';
import 'package:hatooh/Attraction/attraction.dart';
import 'package:hatooh/home.dart';
import 'package:hatooh/main.dart';
import 'package:intl/intl.dart';

class ReservationAttraction extends StatefulWidget {
  final AttractionModel attraction;

  ReservationAttraction(this.attraction);

  @override
  State<ReservationAttraction> createState() => _ReservationAttractionState();
}

class _ReservationAttractionState extends State<ReservationAttraction> {
  final Box _boxUser = Hive.box("accounts");

  Future<void> sendReservationData(infos) async {
    const String apiUrl = "https://s-p5.com/dale/hatoohci/MyReservation/reservation.php";
    final String userId = (_boxUser.get("userId") ?? "0").toString();
    var lol = _boxUser.get("userId");
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'userId': userId,
          'infos': infos,
        },
      );
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        if (responseData['success']) {
          print("Succès : ${responseData['message']}");
        } else {
          print("Échec : ${responseData['message']}");
        }
      } else {
        print('Échec de la requête : Code d\'état ${response.statusCode}');
      }
    } catch (e) {
      print("Erreur lors $lol de l'envoi des données : $e");
    }
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
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                        height: 18,
                        alignment: Alignment.center,
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
              height: 32,
              width: 161,
              margin: EdgeInsets.only(top: 32, bottom: 68),
              alignment: Alignment.center,
              child: Text('',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    fontSize: 28,
                    color: text_noir,
                  ))),
          Container(
            height: 20,
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 18, bottom: 8),
            child: Text(
              'Info de réservation',
              textAlign: TextAlign.start,
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                color: text_noir,
              ),
            ),
          ),
          Container(
            height: 61,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 15),
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
          Container(
              margin: EdgeInsets.only(left: 18, bottom: 8),
              alignment: Alignment.centerLeft,
              child: Text(
                'Infos de paiement',
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                  color: text_noir,
                ),
              )),
          Container(
            height: 186,
            width: 340,
            margin: EdgeInsets.only(left: 18, right: 17),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Stack(
              children: [
                Container(
                  height: 15,
                  width: 77,
                  margin: EdgeInsets.only(right: 5, bottom: 8),
                  child: Text(
                    'COÛT TOTAL',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      color: gris_pur,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 31),
                  child: Text("${NumberFormat('#,##0', 'fr_FR').format(int.parse(widget.attraction.tarif))} FCFA",
                      style: GoogleFonts.roboto(
                        fontSize: 24,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        color: text_noir,
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(top: 72),
                  child: Divider(
                    height: 0,
                    color: gris_pur,
                    thickness: 0.2,
                    indent: 0,
                    endIndent: 0,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 87),
                  child: Text('MOYEN DE PAIEMENT',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        color: gris_pur,
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OrangePaiement(widget.attraction)));
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 114),
                        height: 40,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'images/orange.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OrangePaiement(widget.attraction)));
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 114),
                        height: 40,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'images/Wave.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 114),
                        height: 40,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'images/MTN.jpg',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 114),
                        height: 40,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'images/Moov.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 114),
                        height: 40,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'images/visa.jpg',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 114),
                        height: 25,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'images/Mastercard.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    )
                  ],
                ),

              ],
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              // Création de l'objet JSON pour les infos
              final infos = json.encode({
                "lieu": widget.attraction.lieu,
                "date": widget.attraction.date,
                "heure": widget.attraction.heure,
                "tarif": widget.attraction.tarif,
                "nom": widget.attraction.nom,

              });

              // Envoi des données de réservation
              await sendReservationData(infos);

              // Navigation vers une autre page ou affichage d'un message selon la réponse ici
            },
            child: Text("Réserver"),
            style: ElevatedButton.styleFrom(
              primary: Colors.blue, // Couleur du bouton
            ),
          ),
        ],
      )),
    );
  }
}
