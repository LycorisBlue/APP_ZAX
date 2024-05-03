import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hatooh/Hebergement/resultats.dart';
import 'package:hatooh/main.dart';
import 'package:hatooh/Drawer/modifier_carte.dart';
import 'package:hatooh/Hebergement/reservation_confirmee.dart';

class VisaPaiement extends StatelessWidget {
  final Item fetchedItems;
  final String selectedType;
  final String selectedCity;
  final String arrivalLabel;
  final String departureLabel;

  VisaPaiement(
    this.fetchedItems,
    this.selectedType,
    this.selectedCity,
    this.arrivalLabel,
    this.departureLabel,
  );

  @override
  Widget build(BuildContext context) {
    BoxConstraints(
      maxWidth: MediaQuery.of(context).size.width,
      maxHeight: MediaQuery.of(context).size.height,
    );
    return Scaffold(
      backgroundColor: gris_clair,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Material(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
          child: Stack(
            children: [
              AppBar(
                leading: Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 20, left: 20),
                  child: Builder(
                    builder: (BuildContext context) {
                      return IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      );
                    },
                  ),
                ),
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
              ),
              Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(right: 20),
                  padding: EdgeInsets.only(top: 35),
                  child: Text(
                    'Réservation',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  )),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
            margin: EdgeInsets.only(top: 35),
            alignment: Alignment.center,
            child: Text(fetchedItems.categorie,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.black)),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            alignment: Alignment.center,
            child: Text(fetchedItems.nom,
                style: GoogleFonts.poppins(fontSize: 15, color: Colors.grey)),
          ),
          SizedBox(height: 100),
          Container(
            child: Text('Paiement par carte',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                )),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            height: 150,
            width: 400,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 90, left: 20),
                  alignment: Alignment.centerLeft,
                  child: Text('CARTE ENREGISTRÉE',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Colors.grey
                      )),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 60, left: 20),
                      child: Text('Visa',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Colors.grey
                      )
                      ),
                    ),
                    Container(
                      height: 10,
                      width: 10,
                      margin: EdgeInsets.only(top: 60, left: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 60, left: 10),
                      child: Text('5738',
                      style: GoogleFonts.poppins(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      )
                      ),
                    ),
                    GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ModifierCarte()));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 75, right: 20, top: 60),
                    alignment: Alignment.center,
                    height: 20,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.black),
                      color: Colors.transparent,
                    ),
                    child: Text(
                      'MODIFIER',
                      style: GoogleFonts.poppins(
                          fontSize: 13, color: Colors.black),
                    ),
                  ),
                ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 100, left: 20),
                  height: 40,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'images/visa.jpg',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                ],
            ),
          ),
          SizedBox(height: 200),
          GestureDetector(
            onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ReservationConfirmee(fetchedItems, selectedType,
                                    selectedCity,
                                    arrivalLabel,
                                    departureLabel,)));
                  },
            child: Container(
              width: 320,
              decoration: BoxDecoration(
                      color: orange,
                      borderRadius: BorderRadius.circular(5),
                    ),
              child: Text(
                'Continuer',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
          )
          ],
        ),
      )
    );
  }
}