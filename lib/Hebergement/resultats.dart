import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hatooh/Hebergement/affiche_resultat.dart';
import 'package:hatooh/Welcome/delay_animation.dart';
import 'package:hatooh/main.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Item{
  final String id;
  final String categorie;
  final String nom;
  final String tarif;
  final String ville;
  final String commentaire;
  final String images;

  Item({
    required this.id,
    required this.categorie,
    required this.nom,
    required this.tarif,
    required this.ville,
    required this.commentaire,
    required this.images,
  });
}

Future<List<Item>> _fetchFormulaires() async {
    final response = await http.get(Uri.parse('https://s-p5.com/dale/formulaire_hatooh/recuperation.php'));
    print('test test');
    if (response.statusCode == 200) {
      final List<dynamic> a = json.decode(response.body);
      print("response body $a");
      final List<Item> b = a.map((elem) {
          return Item(id: elem['id'], categorie: elem['categorie'], nom: elem['nom'], tarif: elem['tarif'], ville: elem['ville'], commentaire: elem['commentaire'], images: elem['images']);
        }).toList();
        print("result");
        return b;
    } else {
      throw Exception('Erreur lors de la récupération des données');
    }
  }

class Resultats extends StatefulWidget {
  const Resultats(
      {super.key,
      required this.selectedType,
      required this.selectedCity,
      required this.arrivalLabel,
      required this.departureLabel});

  final String selectedType;
  final String selectedCity;
  final String arrivalLabel;
  final String departureLabel;

  @override
  State<Resultats> createState() => _ResultatsState();
}

class _ResultatsState extends State<Resultats> {

late Future<List<Item>> _futureItems;

  @override
  void initState() {
    super.initState();
    _futureItems = _fetchFormulaires();
  }

  @override
  Widget build(BuildContext context) {
    BoxConstraints(
      maxWidth: MediaQuery.of(context).size.width,
      maxHeight: MediaQuery.of(context).size.height);
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
                  bottomLeft: Radius.circular(24.r),
                  bottomRight: Radius.circular(24.r)))),
            Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 40.h, left: 18.w),
                child: Builder( builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: () {
                          Navigator.pop(context);
                        },
                      child: SvgPicture.asset('images/back.svg', height: 32));
                  })),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(right: 17.w),
              padding: EdgeInsets.only(top: 40.h),
              child: Text('Résultats',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: text_noir)))])),
      body: FutureBuilder<List<Item>>(
        future: _futureItems,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.data}'));
          } else {
            List<Item> fetchedItems = snapshot.data ?? [];
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 8.w, right: 8.w, top: 10.h, bottom: 20.h),
                    child: DelayedAnimation(
                      delay: 500,
                      child: Column(
                        children: [ for (var i = 0; i < fetchedItems.length; i += 2)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                for (var j = i;
                                    j < i + 2 && j < fetchedItems.length;
                                    j++)
                                  Expanded(
                                    child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context, MaterialPageRoute(builder: (context) => AfficheResultat(
                                                  fetchedItems, j, widget.selectedType, widget.selectedCity, widget.arrivalLabel, widget.departureLabel)));
                                          },
                                      child: Card(
                                        color: blanc,
                                        margin: EdgeInsets.only(bottom: 15.h, left: 4.w, right: 4.w),
                                        child: Column(
                                          children: [
                                              Hero(
                                                tag: fetchedItems[j].id,
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.only(
                                                    topRight: Radius.circular(12.r),
                                                    topLeft: Radius.circular(12.r)),
                                                  child: Image.network(
                                                    fetchedItems[j].images,
                                                    fit: BoxFit.fill,
                                                    height: 115.h))),
                                            Column(
                                              children: [
                                                Container(
                                                  alignment: Alignment.topLeft,
                                                  margin: EdgeInsets.only(top: 8.h, left: 8.w),
                                                  child: Text(fetchedItems[j].categorie,
                                                    style: GoogleFonts.roboto(
                                                      fontWeight: FontWeight.w400,
                                                      color: text_noir,
                                                      fontSize: 16.sp))),
                                                Container(
                                                  alignment: Alignment.topLeft,
                                                  margin: EdgeInsets.only(top: 4.h, left: 8.w),
                                                  child: Text(fetchedItems[j].nom,
                                                    style: GoogleFonts.roboto(
                                                      fontWeight: FontWeight.w400,
                                                      color: grey_icon,
                                                      fontSize: 14.sp))),
                                                Container(
                                                  alignment: Alignment.topLeft,
                                                  margin: EdgeInsets.only(top: 16.h, left: 8.w, bottom: 5.h),
                                                  child: Text('${NumberFormat.decimalPattern('fr').format((double.parse(fetchedItems[j].tarif)))} FCFA / jr',
                                                    style: GoogleFonts.roboto(
                                                      color: orange,
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 16.sp)))])]))))])])))]));
          }
        }));
  }
}