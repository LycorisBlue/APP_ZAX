import 'dart:convert';
import 'package:hatooh/Hebergement/bonplan.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hatooh/Hebergement/resultats.dart';
import 'package:intl/intl.dart';
import 'package:hatooh/main.dart';

class Item {
  final String id;
  final String title;
  final String description;
  final String other;
  final String img_path;
  final String reg_date;

  Item(
      {required this.id,
      required this.title,
      required this.description,
      required this.other,
      required this.img_path,
      required this.reg_date});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        other: json['other'],
        img_path: json['img_path'],
        reg_date: json['reg_date']);
  }
}

class Hebergement extends StatefulWidget {
  @override
  _HebergementState createState() => _HebergementState();
}

class _HebergementState extends State<Hebergement> {
  bool formSubmitted = false;
  bool isRadioSelected = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController searchController = TextEditingController();
  String selectedCity = 'Ville';
  String selectedType = 'Type';
  String arrivalLabel = 'Arrivée';
  String departureLabel = 'Départ';
  DateTime selectedArrivalDate = DateTime.now();
  DateTime selectedDepartureDate = DateTime.now();
  late Future<List<Item>> futureItems;

  void _showBottomSheet(BuildContext context, String title, Widget content) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32.r), topRight: Radius.circular(32.r)),
                  color: blanc),
              child: Column(mainAxisSize: MainAxisSize.min, 
              children: <Widget>[
                SizedBox(height: 15.h),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Center(
                        child: Image.network('https://www.s-p5.com/dale/icônes/fil.png', height: 20.h))),
                SizedBox(height: 15.h),
                Center(
                    child: Text(
                      title,
                        style: GoogleFonts.roboto(
                            color: text_noir, fontWeight: FontWeight.w400, fontSize: 24.sp))),
                      content]));
        });
  }

  final List<String> cities = [
    'Abidjan',
    'Bouaké',
    'Daoukro',
    'Daloa',
    'Divo',
    'Bassam',
    'Korhogo',
    'Man',
    'San-Pédro',
    'Yakro'
  ];

  final List<String> options = [
    'Colocation',
    'Résidence',
    'Hôtel',
    'Villa',
  ];

  List<bool> selectedOptions = List.generate(4, (index) => false);

  Widget _buildTypeOption(int index1, int index2) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      _buildTypeOptionWithRadio(index1),
      if (index2 < options.length) SizedBox(width: 40.w),
      if (index2 < options.length) _buildTypeOptionWithRadio(index2)]);
  }

  Widget _buildTypeOptionWithRadio(int index) {
    return Expanded(
        child: GestureDetector(
            onTap: () {
              setState(() {
                selectedType = options[index];
                isRadioSelected = true;
              });
            },
            child: Row(
              children: [
              Theme(
                  data: ThemeData(unselectedWidgetColor: gris_clair),
                  child: Radio(
                      value: options[index],
                      groupValue: selectedType,
                      onChanged: (value) {
                        setState(() {
                          selectedType = value.toString();
                          isRadioSelected = true;
                        });
                      },
                      activeColor: orange)),
              SizedBox(width: 15.w),
              Transform.translate(
                  offset: Offset(-20.w, 0),
                  child: Text(
                    options[index],
                      style: GoogleFonts.roboto(
                        fontSize: 14.sp, fontWeight: FontWeight.w400, fontStyle: FontStyle.normal, color: gris_pur)))])));
  }

  List<String> amenities = [
    'Climatisation',
    'Piscine',
    'Wi-Fi',
    'Animal de compagnie',
    'Chauffe-eau',
    'Pressing',
  ];

  List<bool> selectedAmenities = List.generate(6, (index) => false);

  Widget _buildAmenityOption(int index1, int index2) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      _buildCheckbox(index1),
      if (index2 < amenities.length) SizedBox(width: 40.w),
      if (index2 < amenities.length) _buildCheckbox(index2)]);
  }

  Widget _buildCheckbox(int index) {
    return Expanded(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
          margin: EdgeInsets.only(bottom: 16.h, left: 16.w),
          height: 24.h,
          decoration: BoxDecoration(border: Border.all(color: noir), borderRadius: BorderRadius.circular(5.r)),
          child: InkWell(
              onTap: () {
                setState(() {
                  selectedAmenities[index] = !selectedAmenities[index];
                });
              },
              child: selectedAmenities[index]
                  ? SvgPicture.network('https://www.s-p5.com/dale/icônes/check.svg', color: orange)
                  : SizedBox(width: 24.w, height: 24.h))),
      SizedBox(width: 8.w),
      Container(
          margin: EdgeInsets.only(bottom: 16.h),
          width: 90.w,
          child: Text(
            amenities[index],
              style: GoogleFonts.roboto(fontWeight: FontWeight.w400, color: gris_pur, fontSize: 14.sp)))]));
  }

  void _showAmenitiesBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
              alignment: Alignment.center,
              height: 300.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(32.r), topRight: Radius.circular(32.r)),
                  color: blanc),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 15.h),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.network('https://www.s-p5.com/dale/icônes/fil.png', height: 20.h)),
                    SizedBox(height: 15.h),
                    Center(
                        child: Text('Filtre',
                            style: GoogleFonts.roboto(color: text_noir, fontWeight: FontWeight.w400, fontSize: 24.sp))),
                    SizedBox(height: 15.h),
                    Container(
                        alignment: Alignment.center,
                        height: 150.h,
                        decoration: const BoxDecoration(color: blanc),
                        child: ListView(
                          children: [
                          for (int i = 0; i < amenities.length; i += 2)
                            _buildAmenityOption(i, i + 1)])),
                    GestureDetector(
                        onTap: () {
                          _validateFilter();
                        },
                        child: Container(
                            alignment: Alignment.center,
                            height: 40.h,
                            margin: EdgeInsets.symmetric(horizontal: 18.w),
                            decoration: BoxDecoration(
                                color: selectedAmenities.contains(true)
                                    ? orange
                                    : gris_clair2,
                                borderRadius: BorderRadius.circular(8.r)),
                            child: Text(
                              'Terminer',
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                    color: selectedAmenities.contains(true)
                                        ? blanc
                                        : gris_pur))))]));
        });
  }

  void _validateFilter() {
    List<String> selectedAmenitiesList = [];
    for (int i = 0; i < amenities.length; i++) {
      if (selectedAmenities[i]) {
        selectedAmenitiesList.add(amenities[i]);
      }
    }
    print('Équipements sélectionnés : $selectedAmenitiesList');
    Navigator.pop(context);
  }

  void _submitForm() {
    setState(() {
      formSubmitted = true;
    });

    if (selectedType != 'Type' &&
        selectedCity != 'Ville' &&
        arrivalLabel != 'Arrivée' &&
        departureLabel != 'Départ' &&
        (selectedDepartureDate.isAfter(selectedArrivalDate))) {
      Navigator.push(context, MaterialPageRoute(
              builder: (context) => Resultats(
                  departureLabel: departureLabel,
                  selectedType: selectedType,
                  selectedCity: selectedCity,
                  arrivalLabel: arrivalLabel)));
    } else {
      if (selectedDepartureDate.isBefore(selectedArrivalDate) || selectedDepartureDate.isAtSameMomentAs(selectedArrivalDate)) {
        print('La date de départ doit être supérieure à la date d\'arrivée.');
      } else {
        print('Veuillez remplir tous les champs.');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    futureItems = fetchItems();
  }

  Future<List<Item>> fetchItems() async {
    final response = await http
        .get(Uri.parse('https://s-p5.com/dale/hatoohci/bonplan/fetch.php'));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Item> items = data.map((json) => Item.fromJson(json)).toList();
      return items;
    } else {
      throw Exception('Failed to load items');
    }
  }

  @override
  Widget build(BuildContext context) {
    BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height);
    return Column(children: [
      Form(
          key: _formKey,
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 18.w),
              padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 8.h),
              alignment: Alignment.center,
              height: 234.h,
              decoration: BoxDecoration(
                color: blanc,
                borderRadius: BorderRadius.circular(16.r)),
              child: Column(
                children: [
                SizedBox(
                    height: 35.h,
                    child: GestureDetector(
                        onTap: () {
                          _showBottomSheet(
                              context,
                              'Type',
                              Container(
                                  height: 160.h,
                                  margin: EdgeInsets.only(bottom: 15.h),
                                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                                  decoration: const BoxDecoration(color: blanc),
                                  child: ListView(
                                    children: [
                                    SizedBox(height: 5.h),
                                    for (int i = 0; i < options.length; i += 2)
                                      _buildTypeOption(i, i + 1),
                                    SizedBox(height: 20.h),
                                    GestureDetector(
                                        onTap: () { 
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                            alignment: Alignment.center,
                                            height: 40.h,
                                            margin: EdgeInsets.symmetric(horizontal: 15.w),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8.r),
                                                color: isRadioSelected
                                                    ? orange
                                                    : gris_clair2),
                                            child: Text(
                                              'Terminer',
                                                style: GoogleFonts.roboto(
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: isRadioSelected
                                                        ? blanc
                                                        : gris_pur))))])));
                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: gris_clair,
                              border: Border.all(
                                color: (formSubmitted && selectedType == 'Type')
                                    ? rouge
                                    : transparent)),
                            child: Center(
                                child: Row(
                                  children: [
                              SvgPicture.network('https://www.s-p5.com/dale/icônes/Home.svg',
                                  color: selectedType == 'Type'
                                      ? grey_icon
                                      : text_noir,
                                  height: 20.h),
                              SizedBox(width: 10.w),
                              Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    selectedType,
                                      style: GoogleFonts.roboto(
                                          color: selectedType == 'Type'
                                              ? grey_icon
                                              : text_noir,
                                          fontSize: 16.sp,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w400)))]))))),
                SizedBox(height: 6.h),
                GestureDetector(
                    onTap: () {
                      _showBottomSheet(
                          context,
                          'Destination',
                          Column(
                            children: [
                            SizedBox(height: 14.h),
                            Container(
                                height: 270.h,
                                margin: EdgeInsets.symmetric(horizontal: 28.w,),
                                decoration: BoxDecoration(
                                    color: blanc,
                                    borderRadius: BorderRadius.circular(8.r)),
                                child: ListView.separated(
                                    itemCount: cities.length,
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return Divider(
                                          height: 0.h,
                                          color: gris_clair,
                                          thickness: 1.h,
                                          indent: 10.w,
                                          endIndent: 10.w);
                                    },
                                    itemBuilder: (BuildContext context, int index) {
                                      return ListTile(
                                          title: Text(
                                            cities[index],
                                              style: GoogleFonts.roboto(
                                                  fontWeight: FontWeight.w400,
                                                  color: gris_pur,
                                                  fontSize: 16.sp)),
                                          onTap: () {
                                            setState(() {
                                              selectedCity = cities[index];
                                              Navigator.pop(context);
                                            });
                                          });
                                    }))]));
                    },
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        height: 35.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: gris_clair,
                            border: Border.all(
                                color: (formSubmitted && selectedCity == 'Ville')
                                        ? rouge
                                        : transparent)),
                        child: Center(
                            child: Container(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                  SvgPicture.network('https://www.s-p5.com/dale/icônes/locatlisation.svg',
                                      color: selectedCity == 'Ville'
                                          ? grey_icon
                                          : text_noir,
                                      height: 20.h),
                                  SizedBox(width: 10.w),
                                  Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        selectedCity,
                                          style: GoogleFonts.roboto(
                                              color: selectedCity == 'Ville'
                                                  ? grey_icon
                                                  : text_noir,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.normal)))]))))),
                SizedBox(height: 6.h),
                SizedBox(
                    height: 35.h,
                    child: GestureDetector(
                        onTap: () {
                          _showBottomSheet(
                              context,
                              'Arrivée',
                              SizedBox(
                                height: 250.h,
                                child: CalendarDatePicker(
                                    initialDate: selectedArrivalDate,
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(DateTime.now().year + 2),
                                    onDateChanged: (date) {
                                      setState(() {
                                        selectedArrivalDate = date;
                                        arrivalLabel = DateFormat('dd MMMM yyyy', 'fr').format(date);
                                        Navigator.pop(context);
                                      });
                                    })));
                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: gris_clair,
                                border: Border.all(
                                    color: (formSubmitted && arrivalLabel == 'Arrivée')
                                        ? rouge
                                        : transparent)),
                            child: Center(
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Row(children: [
                                      SvgPicture.network('https://www.s-p5.com/dale/icônes/date plus.svg',
                                          color: arrivalLabel == 'Arrivée'
                                              ? grey_icon
                                              : text_noir,
                                          height: 20.h),
                                      SizedBox(width: 10.w),
                                      Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            arrivalLabel,
                                              style: GoogleFonts.roboto(
                                                  color: arrivalLabel == 'Arrivée'
                                                          ? grey_icon
                                                          : text_noir,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w400,
                                                  fontStyle: FontStyle.normal)))])))))),
                SizedBox(height: 6.h),
                SizedBox(
                    height: 35.h,
                    child: GestureDetector(
                        onTap: () {
                          _showBottomSheet(
                              context,
                              'Départ',
                              SizedBox(
                                height: 250.h,
                                child: CalendarDatePicker(
                                    initialDate: selectedDepartureDate,
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(DateTime.now().year + 2),
                                    onDateChanged: (date) {
                                      setState(() {
                                        selectedDepartureDate = date;
                                        departureLabel = DateFormat('dd MMMM yyyy', 'fr').format(date);
                                        Navigator.pop(context);
                                      });
                                    })));
                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: gris_clair,
                                border: Border.all(
                                    color: (formSubmitted && (departureLabel == 'Départ' ||
                                                selectedDepartureDate.isBefore(selectedArrivalDate) || selectedDepartureDate.isAtSameMomentAs(selectedArrivalDate)))
                                        ? rouge
                                        : transparent)),
                            child: Center(
                                child: Row(
                                  children: [
                              SvgPicture.network('https://www.s-p5.com/dale/icônes/date moins.svg',
                                  color: departureLabel == 'Départ'
                                      ? grey_icon
                                      : text_noir,
                                  height: 20.h),
                              SizedBox(width: 10.w),
                              Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    departureLabel,
                                      style: GoogleFonts.roboto(
                                          color: departureLabel == 'Départ'
                                              ? grey_icon
                                              : text_noir,
                                          fontSize: 16.sp,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w400)))]))))),
                SizedBox(height: 25.h),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            _submitForm();
                          },
                          child: Container(
                              alignment: Alignment.center,
                              height: 35.h,
                              width: 260.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  color: orange),
                              child: Text(
                                'Rechercher',
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp,
                                      fontStyle: FontStyle.normal,
                                      color: blanc)))),
                      GestureDetector(
                          onTap: () {
                            _showAmenitiesBottomSheet(context);
                          },
                          child: Container(
                              width: 40.w,
                              height: 35.h,
                              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  color: gris_clair2),
                              child: SvgPicture.network('https://www.s-p5.com/dale/icônes/settings.svg',
                                  color: orange,
                                  height: 20.h)))])]))),
      SizedBox(height: 20.h),
      Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(left: 18.w),
          child: Text(
            'Bons plans',
              style: GoogleFonts.roboto(
                  color: text_noir,
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp))),
      SizedBox(height: 10.h),
      FutureBuilder<List<Item>>(
          future: futureItems,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Erreur : ${snapshot.error}'));
            } else {
              return CarouselSlider(
                  options: CarouselOptions(
                      aspectRatio: 16 / 9,
                      autoPlayAnimationDuration: Duration(seconds: 2),
                      viewportFraction: 0.506,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayCurve: Curves.linear,
                      enlargeCenterPage: false,
                      scrollDirection: Axis.horizontal),
                  items: snapshot.data!.map((item) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => BonsPlans(item)));
                                },
                                child: Card(
                                    color: blanc,
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Hero(
                                            tag: item.id,
                                            child: ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(8.r), topLeft: Radius.circular(8.r)),
                                                child: Image.network(
                                                    item.img_path,
                                                    fit: BoxFit.cover,
                                                    height: 121.h,
                                                    width: 162.w)),
                                          ),
                                          Container(
                                              margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
                                              child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      item.title,
                                                        style: GoogleFonts.roboto(
                                                            fontWeight: FontWeight.w500,
                                                            color: text_noir,
                                                            fontSize: 16.sp)),
                                                    SizedBox(height: 2.h),
                                                    Text(
                                                      item.other,
                                                        style: GoogleFonts.roboto(
                                                            color: gris_pur,
                                                            fontSize: 12.sp,
                                                            fontStyle: FontStyle.normal,
                                                            fontWeight: FontWeight.w400))]))])))]);
                      });
                  }).toList());
            }
          })]);
  }
}
