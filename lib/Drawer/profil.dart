import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hatooh/Drawer/ajouter_carte.dart';
import 'package:hatooh/Drawer/drawer.dart';
import 'package:hatooh/home.dart';
import 'package:hatooh/main.dart';
import 'package:http/http.dart' as http;
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:convert';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  Map<String, dynamic>? userData;
    final Box _boxUser = Hive.box("accounts");


  Future<void> fetchUserData() async {
    try {
      final response = await http.get(Uri.parse('https://s-p5.com/dale/hatoohci/recuperation_utilisateurs.php'));
      if (response.statusCode == 200) {
        setState(() {
          userData = json.decode(response.body)['data'][0];
        });
      } else {
        print('Erreur lors de la récupération des données');
      }
    } catch (e) {
      print('Exception: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUserData();
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
        child: Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25.r),
              bottomRight: Radius.circular(25.r),
            ),
          ),
          child: Stack(children: [
            AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: blanc,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24.r),
                  bottomRight: Radius.circular(24.r),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 40.h, left: 18.w, bottom: 16.h),
              child: Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                    child: SvgPicture.asset(
                      'images/menu.svg',
                      height: 20.h,
                    ),
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                  );
                },
              ),
            ),
            Container(
                alignment: Alignment.centerRight,
                padding:
                    EdgeInsets.only(top: 50.h, bottom: 35.h, right: 17.w),
                child: Text(
                  'Profil',
                  style: GoogleFonts.roboto(
                      fontSize: 16.sp,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      color: text_noir),
                )),
          ]),
        ),
      ),
      drawer: DrawerPage(),
      body: userData == null
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
          SizedBox(height: 85.h),
          Container(
            width: 340,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16), color: blanc),
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.symmetric(horizontal: 18.w),
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  height: 56,
                  width: 324,
                  padding: EdgeInsets.only(left: 16, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: gris_clair),
                  child: Text(
                    _boxUser.get("name"),
                    style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        color: text_noir),
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  height: 56,
                  width: 324,
                  padding:
                      EdgeInsets.only(left: 16, top: 10, bottom: 10, right: 16),
                  margin: EdgeInsets.only(top: 64),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: gris_clair),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _boxUser.get("ndt"),
                        style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            color: text_noir),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 23.h,
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: gris_pur),
                              color: Colors.transparent),
                          child: Text(
                            'MODIFIER',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                                fontSize: 12,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                color: gris_pur),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 56,
                  width: 324,
                  padding: EdgeInsets.only(left: 16, top: 10, bottom: 10, right: 16),
                  margin: EdgeInsets.only(top: 128),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: gris_clair),
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _boxUser.get("email"),
                        style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            color: text_noir),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 23,
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: gris_pur),
                              color: Colors.transparent),
                          child: Text(
                            'MODIFIER',
                            style: GoogleFonts.roboto(
                                fontSize: 12,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                color: gris_pur),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 56,
                  width: 324,
                  padding: EdgeInsets.only(left: 16, top: 10, right: 16),
                  margin: EdgeInsets.only(top: 192),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: gris_clair),
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Moyen de paiement',
                            style: GoogleFonts.roboto(
                                fontSize: 16,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                color: gris_pur),
                          ),
                          Text(
                            'Aucune carte',
                            style: GoogleFonts.roboto(
                                fontSize: 14,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                color: text_noir),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => AjouterCarte()));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 23,
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: gris_pur),
                              color: Colors.transparent),
                          child: Text(
                            'MODIFIER',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                                fontSize: 12,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                color: gris_pur),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
