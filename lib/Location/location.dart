import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hatooh/main.dart';

class Location extends StatefulWidget {
  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    BoxConstraints(
      maxWidth: MediaQuery.of(context).size.width,
      maxHeight: MediaQuery.of(context).size.height,
    );
    return Column(
      children: [
        SizedBox(height: 8),
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(right: 100, left: 18),
          child: Text('Obtenez la meilleure voiture',
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w600, color: text_noir, fontSize: 24)),
        ),
        SizedBox(height: 24),
        Card(
          color: blanc,
          margin: EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
                child: Image.asset('images/plage 4.png', height: 175, fit: BoxFit.cover),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'carModel',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'modelYear',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'price',
                  style: TextStyle(fontSize: 24, color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
