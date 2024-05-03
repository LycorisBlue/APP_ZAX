import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hatooh/Drawer/cgv.dart';
import 'package:hatooh/Drawer/politique.dart';
import 'package:hatooh/main.dart';

class InfosConditionsPage extends StatelessWidget {
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 18),
                  child: SvgPicture.asset(
                    'images/back.svg',
                    height: 40, 
                    width: 40,
                  ),
                ),
              ),
            SizedBox(height: 200),
            Image.asset('images/logo_hatooh.png', height: 90, width: 150),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('images/home smile.svg',
                    height: 20, width: 20, color: orange),
                SizedBox(width: 8),
                Text(
                  'Contactez-nous au 1373 (Service client)',
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: text_noir,
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PolitiqueConfidentialitePage()));
              },
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 340,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: orange,
                ),
                margin: EdgeInsets.only(left: 18, right: 17),
                child: Text('POLITIQUE DE CONFIDENTIALITÉ',
                style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white, 
                  )),
              ),
            ),
            SizedBox(height: 25),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ConditionsGeneralesVentePage()));
              },
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 340,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: orange,
                ),
                margin: EdgeInsets.only(left: 18, right: 17),
                child: Text('CONDITIONS GÉNÉRALES DE VENTE',
                style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white, 
                  )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
