import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hatooh/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Navette extends StatefulWidget {
  @override
  _NavetteState createState() => _NavetteState();
}

class _NavetteState extends State<Navette> {
  List<dynamic> navettesData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    // Remplace l'URL par l'endpoint de ton API
    final response = await http.get(Uri.parse('https://s-p5.com/dale/formulaire_hatooh/recuperation_navette.php'));
    if (response.statusCode == 200) {
      setState(() {
        navettesData = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    BoxConstraints(
      maxWidth: MediaQuery.of(context).size.width,
      maxHeight: MediaQuery.of(context).size.height,
    );
    return Column(
      children: [
        SizedBox(height: 8.h),
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(right: 40.h, left: 18.w),
          child: Text(
            'Déplacez-vous en toute sûreté avec nos navettes',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w600,
              color: text_noir,
              fontSize: 24.sp,
            ),
          ),
        ),
        SizedBox(height: 24.h),
        ListView.builder(
          shrinkWrap: true,
          itemCount: navettesData.length,
          itemBuilder: (context, index) {
            final navette = navettesData[index];
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              margin: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: orange,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.network(
                            'https://www.s-p5.com/dale/icônes/diamond.svg',
                            color: blanc,
                            height: 16.h,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            navette['categorie'],
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w500,
                              color: blanc,
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '${navette['places']} PLACES',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          color: blanc,
                          fontSize: 12.sp,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    margin: EdgeInsets.only(right: 70.w),
                    child: Text(
                      navette['avantages'].join(' - '),
                      style: GoogleFonts.roboto(
                        color: blanc,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Image.network('https://www.s-p5.com/dale/icônes/car1.webp',
                      fit: BoxFit.fill,
                      height: 150.h,
                      width: double.infinity,
                    ),
                  ),
                  Divider(
                    color: blanc,
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Text(
                      '${navette['tarif']} FCFA',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w500,
                        color: blanc,
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
