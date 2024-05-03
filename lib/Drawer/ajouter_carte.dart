import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hatooh/main.dart';
import 'package:hatooh/Drawer/profil.dart';

class AjouterCarte extends StatelessWidget {
  const AjouterCarte({super.key});

  String? _validateRequired(String value) {
    if (value.isEmpty) {
      return '';
    }
    return null;
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
        child: Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
          child: Stack(children: [
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
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 40, left: 18, bottom: 16),
              child: Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                    child: SvgPicture.asset(
                      'images/back.svg',
                      width: 32,
                      height: 32,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
            Container(
                alignment: Alignment.center,
                padding:
                    EdgeInsets.only(left: 260, top: 50, bottom: 35, right: 17),
                child: Text(
                  'Ajouter carte',
                  style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      color: text_noir),
                )),
          ]),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin:
                  EdgeInsets.only(left: 20, top: 50, right: 150, bottom: 18),
              child: Text(
                'Ajouter un moyen de paiement',
                style: GoogleFonts.roboto(
                    fontSize: 24,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    color: text_noir),
              ),
            ),
            Container(
                height: 209,
                width: 340,
                padding: EdgeInsets.only(left: 24),
                margin: EdgeInsets.only(left: 20, right: 15, bottom: 40),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color(0xffff5c01), Color(0xffffae2e)],
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 20),
                        child: SvgPicture.asset(
                          'images/puce.svg',
                          height: 53,
                          width: 78.2,
                        )),
                  ],
                )),
            Container(
              height: 15,
              width: 134,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 20, bottom: 8),
              child: Text(
                'NUMÉRO DE LA CARTE',
                textAlign: TextAlign.left,
                style: GoogleFonts.inter(
                    fontSize: 12,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    color: grey_icon),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              height: 40,
              width: 340,
              margin: EdgeInsets.only(left: 20, right: 15, bottom: 24),
              child: TextFormField(
                validator: (value) {
                  final requiredError = _validateRequired(value!);
                  if (requiredError != null) {
                    return requiredError;
                  }
                  return null;
                },
                keyboardType: TextInputType.phone,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                  color: grey_icon,
                ),
                decoration: InputDecoration(
                  errorStyle: GoogleFonts.poppins(fontSize: 0),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 1.0),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  hintText: '',
                  hintStyle: GoogleFonts.inter(fontSize: 4),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 15,
                  width: 31,
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 20, bottom: 8),
                  child: Text(
                    'DATE',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      color: grey_icon,
                    ),
                  ),
                ),
                Container(
                  height: 15,
                  width: 26,
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(right: 69, bottom: 8),
                  child: Text(
                    'CVV',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      color: grey_icon,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  width: 50,
                  margin: EdgeInsets.only(left: 20, right: 4, bottom: 60),
                  child: TextFormField(
                    validator: (value) {
                      final requiredError = _validateRequired(value!);
                      if (requiredError != null) {
                        return requiredError;
                      }
                      return null;
                    },
                    keyboardType: TextInputType.phone,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      color: grey_icon,
                    ),
                    decoration: InputDecoration(
                      errorStyle: GoogleFonts.poppins(fontSize: 0),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      hintText: '',
                      hintStyle: GoogleFonts.inter(
                        fontSize: 4,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors
                                .transparent), // Couleur de la bordure en blanc
                        borderRadius: BorderRadius.circular(
                            12), // Couleur de la bordure en blanc lorsque le champ est sélectionné
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(
                            12), // Couleur de la bordure en blanc lorsque le champ est sélectionné
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 50,
                  margin: EdgeInsets.only(left: 4, bottom: 60),
                  child: TextFormField(
                    validator: (value) {
                      final requiredError = _validateRequired(value!);
                      if (requiredError != null) {
                        return requiredError;
                      }
                      return null;
                    },
                    keyboardType: TextInputType.phone,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                    decoration: InputDecoration(
                      errorStyle: GoogleFonts.poppins(fontSize: 0),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      hintText: '',
                      hintStyle: GoogleFonts.inter(
                        fontSize: 4,),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.transparent),
                        borderRadius: BorderRadius.circular(12), 
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 80,
                  margin: EdgeInsets.only(left: 137, bottom: 60),
                  child: TextFormField(
                    validator: (value) {
                      final requiredError = _validateRequired(value!);
                      if (requiredError != null) {
                        return requiredError;
                      }
                      // Ajoutez d'autres validations si nécessaire
                      return null;
                    },
                    keyboardType: TextInputType.phone,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                  fontSize: 12,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
                    decoration: InputDecoration(
                      errorStyle: GoogleFonts.poppins(fontSize: 0),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      hintText: '',
                      hintStyle: GoogleFonts.inter(
                        fontSize: 4,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors
                                .transparent), 
                        borderRadius: BorderRadius.circular(
                            12), 
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(12), 
                      ),
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Profil()));
              },
              child: Container(
                alignment: Alignment.center,
                height: 48,
                width: 340,
                padding: EdgeInsets.only(left: 114, right: 114, top: 14, bottom: 16),
                decoration: BoxDecoration(
                  color: gris_clair2,
                  borderRadius: BorderRadius.circular(8)
                ),
                margin: EdgeInsets.only(left: 18,right: 17 ,bottom: 24),
                child: Text('Terminer',
                style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    color: gris_pur,
                  ),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
