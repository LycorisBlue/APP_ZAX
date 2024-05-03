import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hatooh/main.dart';
import 'package:hatooh/Hebergement/reservation_confirmee.dart';
import 'package:hatooh/Hebergement/resultats.dart';

class MastercardPaiement extends StatelessWidget {
  final Item fetchedItems;
  final String selectedType;
  final String selectedCity;
  final String arrivalLabel;
  final String departureLabel;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _validateRequired(String value) {
    if (value.isEmpty) {
      return '';
    }
    return null;
  }

  MastercardPaiement(
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
          child: Form(
            key: _formKey,
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
                      style: GoogleFonts.poppins(
                          fontSize: 15, color: Colors.grey)),
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
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 90, left: 20),
                        alignment: Alignment.centerLeft,
                        child: Text('CARTE ENREGISTRÉE',
                            style: GoogleFonts.poppins(
                                fontSize: 15, color: Colors.grey)),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 60, left: 20),
                            child: Text('Visa',
                                style: GoogleFonts.poppins(
                                    fontSize: 20, color: Colors.grey)),
                          ),
                          Container(
                            height: 10,
                            width: 10,
                            margin: EdgeInsets.only(top: 60, left: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.grey),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 60, left: 10),
                            child: Text('5738',
                                style: GoogleFonts.poppins(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (BuildContext context) {
                                  return Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.8,
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 20),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Center(
                                              child: Image.asset(
                                                'images/fil.png',
                                                height: 20,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            'Ajouter une nouvelle carte',
                                            style: GoogleFonts.poppins(
                                              fontSize: 15,
                                            ),
                                          ),
                                          SizedBox(height: 30),
                                          Container(
                                              height: 120,
                                              width: 320,
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                  colors: [
                                                    Colors.orange[900]!,
                                                    Colors.orangeAccent
                                                  ],
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(0.2),
                                                    spreadRadius: 1,
                                                    blurRadius: 5,
                                                    offset: Offset(0, 2),
                                                  ),
                                                ],
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    margin: EdgeInsets.only(
                                                        left: 20),
                                                    child: ClipRRect(
                                                        child: Image.asset(
                                                      'images/puce.png',
                                                      fit: BoxFit.contain,
                                                      height: 50,
                                                    )),
                                                  ),
                                                ],
                                              )),
                                          SizedBox(height: 20),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            margin: EdgeInsets.only(left: 20),
                                            child: Text(
                                              'NUMÉRO DE LA CARTE',
                                              style: GoogleFonts.poppins(
                                                fontSize: 15,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: 20, right: 20),
                                            child: TextFormField(
                                              validator: (value) {
                                                final requiredError =
                                                    _validateRequired(value!);
                                                if (requiredError != null) {
                                                  return requiredError;
                                                }
                                                return null;
                                              },
                                              keyboardType: TextInputType.phone,
                                              style: GoogleFonts.poppins(
                                                color: Colors
                                                    .grey, // Couleur du texte en blanc
                                                fontWeight: FontWeight.w500,
                                                fontSize: 17,
                                              ),
                                              decoration: InputDecoration(
                                                errorStyle: GoogleFonts.poppins(
                                                    fontSize: 0),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.red,
                                                      width: 1.0),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                hintText: '',
                                                hintStyle: GoogleFonts.poppins(
                                                  color: Colors
                                                      .grey, // Couleur du texte en blanc
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12,
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors
                                                          .transparent), // Couleur de la bordure en blanc
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12), // Couleur de la bordure en blanc lorsque le champ est sélectionné
                                                ),
                                                filled: true,
                                                fillColor: Colors.grey.withOpacity(
                                                    0.2), // Couleur du fond en noir avec opacité réduite
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.transparent),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12), // Couleur de la bordure en blanc lorsque le champ est sélectionné
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                alignment: Alignment.centerLeft,
                                                margin:
                                                    EdgeInsets.only(left: 20),
                                                child: Text(
                                                  'DATE',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 15,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 20),
                                              Container(
                                                alignment: Alignment.centerLeft,
                                                margin:
                                                    EdgeInsets.only(right: 50),
                                                child: Text(
                                                  'CVV',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 15,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 5),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 50,
                                                width: 60,
                                                margin:
                                                    EdgeInsets.only(left: 20),
                                                child: TextFormField(
                                                  validator: (value) {
                                                    final requiredError =
                                                        _validateRequired(
                                                            value!);
                                                    if (requiredError != null) {
                                                      return requiredError;
                                                    }
                                                    return null;
                                                  },
                                                  keyboardType:
                                                      TextInputType.phone,
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.poppins(
                                                    color: Colors
                                                        .grey, // Couleur du texte en blanc
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 17,
                                                  ),
                                                  decoration: InputDecoration(
                                                    errorStyle:
                                                        GoogleFonts.poppins(
                                                            fontSize: 0),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.red,
                                                          width: 1.0),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    hintText: '',
                                                    hintStyle:
                                                        GoogleFonts.poppins(
                                                      color: Colors
                                                          .grey, // Couleur du texte en blanc
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 12,
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent), // Couleur de la bordure en blanc
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12), // Couleur de la bordure en blanc lorsque le champ est sélectionné
                                                    ),
                                                    filled: true,
                                                    fillColor: Colors.grey
                                                        .withOpacity(
                                                            0.2), // Couleur du fond en noir avec opacité réduite
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12), // Couleur de la bordure en blanc lorsque le champ est sélectionné
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 50,
                                                width: 60,
                                                margin:
                                                    EdgeInsets.only(left: 10),
                                                child: TextFormField(
                                                  validator: (value) {
                                                    final requiredError =
                                                        _validateRequired(
                                                            value!);
                                                    if (requiredError != null) {
                                                      return requiredError;
                                                    }
                                                    return null;
                                                  },
                                                  keyboardType:
                                                      TextInputType.phone,
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.poppins(
                                                    color: Colors
                                                        .grey, // Couleur du texte en blanc
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 17,
                                                  ),
                                                  decoration: InputDecoration(
                                                    errorStyle:
                                                        GoogleFonts.poppins(
                                                            fontSize: 0),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.red,
                                                          width: 1.0),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    hintText: '',
                                                    hintStyle:
                                                        GoogleFonts.poppins(
                                                      color: Colors
                                                          .grey, // Couleur du texte en blanc
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 12,
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent), // Couleur de la bordure en blanc
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12), // Couleur de la bordure en blanc lorsque le champ est sélectionné
                                                    ),
                                                    filled: true,
                                                    fillColor: Colors.grey
                                                        .withOpacity(
                                                            0.2), // Couleur du fond en noir avec opacité réduite
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12), // Couleur de la bordure en blanc lorsque le champ est sélectionné
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 50,
                                                width: 60,
                                                margin:
                                                    EdgeInsets.only(left: 130),
                                                child: TextFormField(
                                                  validator: (value) {
                                                    final requiredError =
                                                        _validateRequired(
                                                            value!);
                                                    if (requiredError != null) {
                                                      return requiredError;
                                                    }
                                                    // Ajoutez d'autres validations si nécessaire
                                                    return null;
                                                  },
                                                  keyboardType:
                                                      TextInputType.phone,
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.poppins(
                                                    color: Colors
                                                        .grey, // Couleur du texte en blanc
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 17,
                                                  ),
                                                  decoration: InputDecoration(
                                                    errorStyle:
                                                        GoogleFonts.poppins(
                                                            fontSize: 0),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.red,
                                                          width: 1.0),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    hintText: '',
                                                    hintStyle:
                                                        GoogleFonts.poppins(
                                                      color: Colors
                                                          .grey, // Couleur du texte en blanc
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 12,
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent), // Couleur de la bordure en blanc
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12), // Couleur de la bordure en blanc lorsque le champ est sélectionné
                                                    ),
                                                    filled: true,
                                                    fillColor: Colors.grey
                                                        .withOpacity(
                                                            0.2), // Couleur du fond en noir avec opacité réduite
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12), // Couleur de la bordure en blanc lorsque le champ est sélectionné
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 120),
                                          GestureDetector(
                                            onTap: () {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                Navigator.pop(context);
                                              }
                                            },
                                            child: Container(
                                              width: 320,
                                              decoration: BoxDecoration(
                                                color: orange,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Text(
                                                'Continuer',
                                                style: GoogleFonts.poppins(
                                                  fontWeight:
                                                      FontWeight.bold,
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Container(
                              margin:
                                  EdgeInsets.only(left: 75, right: 20, top: 60),
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
                                  fontSize: 13,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 110, left: 20),
                        height: 20,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'images/Mastercard.png',
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
                            builder: (context) => ReservationConfirmee(
                                fetchedItems,
                                selectedType,
                                selectedCity,
                                arrivalLabel,
                                departureLabel)));
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
          ),
        ));
  }
}
