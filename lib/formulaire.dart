import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Item{
  final String id;
  final String categorie;
  final String nom;
  final String tarif;
  final String commodites;
  final String images;

  Item({
    required this.id,
    required this.categorie,
    required this.nom,
    required this.tarif,
    required this.commodites,
    required this.images,
  });
}

 Future<List<Item>> _fetchFormulaires() async {
    final response = await http.get(Uri.parse('http://192.168.252.237/formulaire_hatooh/recuperation.php'));

    print('test test');
    if (response.statusCode == 200) {
      final List<dynamic> a = json.decode(response.body);
      print("response body $a");
      final List<Item> b = a.map((elem) {
          return Item(id: elem['id'], categorie: elem['categorie'], nom: elem['nom'], tarif: elem['tarif'], commodites: elem['commodites'], images: elem['images']);
        }).toList();
        print("result");
        return b;
    } else {
      throw Exception('Erreur lors de la récupération des données');
    }
  }

class FormulairesPage extends StatefulWidget {
  @override
  _FormulairesPageState createState() => _FormulairesPageState();
}

class _FormulairesPageState extends State<FormulairesPage> {
  late Future<List<Item>> formulaires;
  // late Timer _timer;

  @override
  void initState() {
    super.initState();
    formulaires = _fetchFormulaires();
    // _timer = Timer.periodic(Duration(seconds: 60), (Timer t) => _refreshData());
  }

  

  @override
  void dispose() {
    // _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des formulaires'),
      ),
      body: FutureBuilder(future: formulaires, builder: (context, snapshot) {
        if(snapshot.hasError) {
          return Text("Snapshot Error: ${snapshot.error}");
        }else if(snapshot.hasData) {
          final data = snapshot.data!;
          return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return  CardPerso(information: data[index]);},
      );
        }else{
          return Center(child: SizedBox(width: 100, height: 100, child: CircularProgressIndicator()),);
        }
      }),
    );
  }
}

class CardPerso extends StatelessWidget{
  const CardPerso({super.key, required this.information});

  final Item information;
  @override 
  Widget build (BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: (size.width/2),
      height: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: (size.width/2) - 10,
            width: (size.width/2) - 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8))
            ),
            child: Column(
              children: [
                Image.network(information.images),
                Text(information.categorie),
                Text(information.nom),
                Text(information.id)
              ],
            ))
        ],
      )
    );
  }
}
