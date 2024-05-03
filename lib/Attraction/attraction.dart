import 'dart:async';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hatooh/Attraction/reservation_attraction.dart';
import 'package:intl/intl.dart';
import 'package:hatooh/main.dart';

class AttractionModel {
  final int id;
  final String nom;
  final String commentaire;
  final String date;
  final String heure;
  final String tarif;
  final String lieu;
  final String images;

  AttractionModel({
    required this.id,
    required this.nom,
    required this.commentaire,
    required this.date,
    required this.heure,
    required this.tarif,
    required this.lieu,
    required this.images,
  });

  factory AttractionModel.fromJson(Map<String, dynamic> json) {
    return AttractionModel(
      id: json['id'],
      nom: json['nom'],
      commentaire: json['commentaire'],
      date: json['date'],
      heure: json['heure'],
      tarif: json['tarif'].toString(),
      lieu: json['lieu'],
      images: json['images'],
    );
  }
}

Future<List<AttractionModel>> fetchAttractions() async {
  try {
    final response = await http.get(Uri.parse(
        'https://s-p5.com/dale/formulaire_hatooh/recuperation_attraction.php'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((data) => AttractionModel.fromJson(data))
          .toList();
    } else {
      throw Exception('Failed to load attractions');
    }
  } catch (e) {
    throw Exception('Failed to load attractions: $e');
  }
}

class Attraction extends StatefulWidget {
  @override
  _AttractionState createState() => _AttractionState();
}

class _AttractionState extends State<Attraction> {
  late Future<List<AttractionModel>> futureAttractions;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    futureAttractions = fetchAttractions();
    _timer = Timer.periodic(Duration(seconds: 15),
        (Timer t) => _refreshAttractions());
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _refreshAttractions() async {
    if (mounted) {
      setState(() {
        futureAttractions = fetchAttractions();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    BoxConstraints(
      maxWidth: MediaQuery.of(context).size.width,
      maxHeight: MediaQuery.of(context).size.height,
    );
    return FutureBuilder<List<AttractionModel>>(
      future: futureAttractions,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return RefreshIndicator(
            onRefresh: _refreshAttractions,
            child: Column(
              children: [
                SizedBox(height: 8),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(right: 70, left: 18),
                  child: Text('Profitez des meilleurs évènements du moment',
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w600,
                          color: text_noir,
                          fontSize: 24)),
                ),
                SizedBox(height: 24),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    AttractionModel attraction = snapshot.data![index];
                    return Card(
                      color: blanc,
                      margin: EdgeInsets.only(left: 18, right: 18, bottom: 18),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16)),
                            child: Image.network(attraction.images,
                                width: 340, height: 200, fit: BoxFit.cover),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 18, vertical: 9),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(attraction.nom,
                                    style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w600,
                                        color: text_noir,
                                        fontSize: 20)),
                                SizedBox(height: 15),
                                Text(attraction.commentaire,
                                    style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w400,
                                        color: grey_icon,
                                        fontSize: 15)),
                                SizedBox(height: 15),
                                Row(
                                  children: [
                                    Container(
                                      height: 29,
                                      width: 150,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8),
                                      decoration: BoxDecoration(
                                          color: gris_clair,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                              'images/date plus.svg',
                                              height: 20,
                                              width: 20,
                                              color: gris_pur),
                                          SizedBox(width: 8),
                                          Text(
                                              DateFormat('d MMM y', 'fr_FR')
                                                  .format(DateTime.parse(
                                                      attraction.date)),
                                              style: GoogleFonts.roboto(
                                                  fontWeight: FontWeight.w400,
                                                  color: gris_pur,
                                                  fontSize: 15))
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Container(
                                      height: 29,
                                      width: 71,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8),
                                      decoration: BoxDecoration(
                                          color: gris_clair,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset('images/time.svg',
                                              height: 20,
                                              width: 20,
                                              color: gris_pur),
                                          SizedBox(width: 8),
                                          Text(
                                              DateFormat('H\'h\'').format(
                                                  DateTime.parse(
                                                      '2022-01-01 ' +
                                                          attraction.heure)),
                                              style: GoogleFonts.roboto(
                                                  fontWeight: FontWeight.w400,
                                                  color: gris_pur,
                                                  fontSize: 15))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 15),
                                Divider(
                                  height: 0.h,
                                  color: gris_clair2,
                                  thickness: 1.h,
                                ),
                                SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                        "Tarif : ${NumberFormat('#,##0', 'fr_FR').format(int.parse(attraction.tarif))} FCFA",
                                        style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w600,
                                            color: orange,
                                            fontSize: 16)),
                                    SizedBox(width: 8),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ReservationAttraction(
                                                    attraction),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 36,
                                        width: 102,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: orange),
                                        child: Text('Participer',
                                            style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w600,
                                                color: blanc,
                                                fontSize: 16)),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text("${snapshot.error}"));
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
