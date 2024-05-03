import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ListeReservation extends StatefulWidget {
  const ListeReservation({Key? key}) : super(key: key);

  @override
  _ListeReservationState createState() => _ListeReservationState();
}

class _ListeReservationState extends State<ListeReservation> {
  List<dynamic> reservations = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    try {
      final response = await http.get(Uri.parse("https://s-p5.com/dale/hatoohci/MyReservation/fetch.php?userId=86"));

      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        if (responseBody['success']) {
          final List<dynamic> rawReservations = responseBody['reservations'];
          final processedReservations = rawReservations.map((reservation) {
            final dynamic infosDecoded = json.decode(reservation['infos']);
            // Log des informations décodées
            print(infosDecoded);
            return {
              ...reservation,
              'infos': infosDecoded,
            };
          }).toList();

          setState(() {
            reservations = processedReservations;
          });
        } else {
          throw Exception('Les données n\'ont pas pu être récupérées correctement.');
        }
      } else {
        throw Exception('Échec de la récupération des données');
      }
    } catch (e) {
      print('Erreur : $e');
    }
  }


  Future<void> deleteReservation(int index) async {
    final String id = reservations[index]['id'];
    const url = 'https://s-p5.com/dale/hatoohci/suppression_hebergement.php';

    try {
      final response = await http.post(
        Uri.parse(url),
        body: {'id': id.toString()},
      );

      if (response.statusCode == 200) {
        setState(() {
          reservations.removeAt(index);
        });
      } else {
        throw Exception('Échec de la suppression');
      }
    } catch (e) {
      print('Erreur : $e');
    }
  }

  Future<void> showConfirmationDialog(int index) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: Text('Souhaitez-vous vraiment annuler votre Réservation ?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(), // Ferme la boîte de dialogue
              child: Text('NON'),
            ),
            TextButton(
              onPressed: () {
                deleteReservation(index);
                Navigator.of(context).pop(); // Ferme la boîte de dialogue
              },
              child: Text('OUI'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // Remplacé 'gris_clair' par une valeur de l'exemple
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(96),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
          ),
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: SvgPicture.asset('images/back.svg', height: 32, width: 32),
          ),
          title: Text(
            'Mes Réservations',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.black, // Remplacé 'text_noir' par une valeur de l'exemple
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 32, bottom: 32),
        child: SingleChildScrollView(
          child: Column(
            children: reservations.map<Widget>((reservation) {
              final Map<String, dynamic> infos = reservation['infos'];
              return Column(
                children: [
                  Container(
                    height: 100,
                    width: 340,
                    margin: EdgeInsets.only(left: 18, right: 17, bottom: 20),
                    child: Image.network("https://i.pinimg.com/736x/3c/21/7c/3c217c7b7784e9f55e8f6cce6780a38e.jpg"),
                  ),
                  Container(
                    height: 100,
                    width: 340,
                    margin: EdgeInsets.only(left: 18, right: 17, bottom: 20),
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(infos['nom'] ?? 'Nom inconnu', style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(height: 4.0),
                            Text(infos['lieu'] ?? 'Lieu inconnu'),
                            Text('${infos['tarif'] ?? 'Tarif inconnu'} FCFA'),
                          ],
                        ),
                        GestureDetector(
                          onTap: () => showConfirmationDialog(reservations.indexOf(reservation)),
                          child: Icon(Icons.delete, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
