import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hatooh/Hebergement/resultats.dart';
import 'package:hatooh/main.dart';
import 'package:hatooh/Hebergement/reservation_hebergement.dart';
import 'package:intl/intl.dart';

extension StringExtension on String {
  String capitalizeEachWord() {
    List<String> words = split(' ');
    List<String> capitalizedWords = [];
    for (String word in words) {
      if (word.isNotEmpty) {
        capitalizedWords
            .add('${word[0].toUpperCase()}${word.substring(1).toLowerCase()}');
      }
    }
    return capitalizedWords.join(' ');
  }
}

class AfficheResultat extends StatefulWidget {
  final List<Item> fetchedItems;
  final int itemIndex;
  final String selectedType;
  final String selectedCity;
  final String arrivalLabel;
  final String departureLabel;

  AfficheResultat(this.fetchedItems, this.itemIndex, this.selectedType,
      this.selectedCity, this.arrivalLabel, this.departureLabel);

  @override
  State<AfficheResultat> createState() => _AfficheResultatState();
}

class _AfficheResultatState extends State<AfficheResultat> {
  late PageController _pageController;
  late int _currentIndex;

  List<String> avantages = [
    'images/tv.svg',
    'images/wifi.svg',
    'images/option.svg',
    'images/cafe.svg',
  ];

  List<String> offres = [
    'Annulation avant 72h',
    'Pas d\'animaux',
    'Pas de navette',
    'Aucun frais remboursé',
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.itemIndex;
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height);
    return Scaffold(
        backgroundColor: gris_clair,
        body: PageView.builder(
            controller: _pageController,
            itemCount: widget.fetchedItems.length,
            itemBuilder: (context, index) {
              return buildItemDetails(widget.fetchedItems[index]);
            },
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            }));
  }

  Widget buildItemDetails(Item currentItem) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Stack(children: [
          SizedBox(
              height: 270.h,
              width: double.infinity,
              child: Hero(
                  tag: currentItem.id,
                  child: Image.network(currentItem.images, fit: BoxFit.fill))),
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                  margin: EdgeInsets.only(left: 18.w, top: 30.h),
                  child: SvgPicture.asset('images/back.svg', color: blanc, height: 30.h)))
        ]),
        SizedBox(height: 20.h),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
              margin: EdgeInsets.only(left: 18.w),
              child: Text(currentItem.nom.capitalizeEachWord(),
                  style: GoogleFonts.roboto(
                      fontSize: 22.sp, fontWeight: FontWeight.w500))),
          Container(
              alignment: Alignment.center,
              height: 36.h,
              margin: EdgeInsets.only(right: 18.w),
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: orange.withOpacity(0.2)),
              child: Text(
                  '${NumberFormat.decimalPattern('fr').format((double.parse(currentItem.tarif)))} FCFA / jr',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                      fontSize: 16.sp,
                      color: orange,
                      fontWeight: FontWeight.w500)))
        ]),
        SizedBox(height: 4.h),
        Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 18.w),
            child: Text(currentItem.ville.toUpperCase(),
                style: GoogleFonts.inter(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: gris_pur))),
        SizedBox(height: 12.h),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 18.w),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (String image in avantages)
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        height: 48.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: gris_clair2,
                        ),
                        child: SvgPicture.asset(image,
                            height: 32.h, color: orange))
                ])),
        SizedBox(height: 10.h),
        Container(
            height: 85.h,
            alignment: Alignment.topLeft,
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Text(currentItem.commentaire,
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: gris_pur))),
        SizedBox(height: 15.h),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 18.w),
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r), color: gris_clair2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Wrap(
                children: [
                  for (int i = 0; i < offres.length; i += 2)
                    Row(
                      children: [
                        for (var j = i; j < i + 2 && j < offres.length; j++)
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                SvgPicture.asset('images/offers.svg', height: 24.h, color: orange), 
                                Text(offres[j],
                                  style: GoogleFonts.roboto(
                                    fontSize: 12.sp, fontWeight: FontWeight.w400, color: gris_pur))]))])])])),
        SizedBox(height: 50.h),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Reservation(
                        currentItem, widget.selectedType, widget.selectedCity, widget.arrivalLabel, widget.departureLabel)));
          },
          child: Container(
            alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 18.w),
              height: 48.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: orange),
              child: Text(
                'Continuer',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: blanc,
                ),
              )),
        ),
      ],
    ));
  }
}
