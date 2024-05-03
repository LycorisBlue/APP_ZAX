import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hatooh/Hebergement/affiche_resultat.dart';
import 'package:hatooh/Hebergement/modifier_date.dart';
import 'package:hatooh/Hebergement/resultats.dart';
import 'package:hatooh/Hebergement/Paiement/mastercard.dart';
import 'package:hatooh/Hebergement/Paiement/moov.dart';
import 'package:hatooh/Hebergement/Paiement/mtn.dart';
import 'package:hatooh/Hebergement/Paiement/orange.dart';
import 'package:hatooh/Hebergement/Paiement/wave.dart';
import 'package:hatooh/main.dart';
import 'package:hatooh/Hebergement/Paiement/visa.dart';
import 'package:intl/intl.dart';

class Reservation extends StatefulWidget {
  final Item fetchedItems;
  final String selectedType;
  final String selectedCity;
  final String arrivalLabel;
  final String departureLabel;

  Reservation(this.fetchedItems, this.selectedType, this.selectedCity,
      this.arrivalLabel, this.departureLabel,);

  @override
  State<Reservation> createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> {

  String formatDate(String date) {
    final DateFormat inputFormat = DateFormat('dd MMMM yyyy', 'fr');
    final DateFormat outputFormat = DateFormat('dd MMM', 'fr');

    final DateTime dateTime = inputFormat.parse(date);
    String formattedDate = outputFormat.format(dateTime);
    formattedDate =
        formattedDate.replaceRange(3, 4, formattedDate[3].toUpperCase());
    formattedDate = formattedDate.replaceAll(RegExp(r'\.'), '');

    return formattedDate;
  }

  int getDifferenceInDays(String arrival, String departure) {
    final DateFormat formatter = DateFormat('dd MMMM yyyy', 'fr');
    final DateTime arrivalDate = formatter.parse(arrival);
    final DateTime departureDate = formatter.parse(departure);

    Duration difference = departureDate.difference(arrivalDate);

    return difference.inDays.abs();
  }

  int calculateTotalCost(int numberOfDays, int dailyRate) {
    return numberOfDays * dailyRate;
  }

  @override
  Widget build(BuildContext context) {
    BoxConstraints(
      maxWidth: MediaQuery.of(context).size.width,
      maxHeight: MediaQuery.of(context).size.height,
    );
    String formattedArrivalDate = formatDate(widget.arrivalLabel);
    String formattedDepartureDate = formatDate(widget.departureLabel);

    int numberOfDays =
        getDifferenceInDays(widget.arrivalLabel, widget.departureLabel);

    int totalCost = calculateTotalCost(numberOfDays, int.tryParse(widget.fetchedItems.tarif) ?? 0);


    String formattedTotalCost =
        NumberFormat.decimalPattern('fr').format(totalCost);
    return Scaffold(
      backgroundColor: gris_clair,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(96.h),
        child: Stack(
          children: [
            AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: blanc,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24.r),
                  bottomRight: Radius.circular(24.r),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 18.w),
                        child: SvgPicture.asset(
                          'images/back.svg',
                          height: 32.h,
                        ),
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(right: 17.w),
                        child: Text(
                          'Réservation',
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: 16.sp,
                            color: text_noir,
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(height: 32.h),
            Container(
                alignment: Alignment.center,
                child: Text(widget.fetchedItems.categorie,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 28.sp,
                      color: text_noir,
                    ))),
            Container(
                alignment: Alignment.center,
                child: Text(widget.fetchedItems.nom.capitalizeEachWord(),
                    style: GoogleFonts.inter(
                        fontSize: 12.h,
                        color: gris_pur,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500))),
            SizedBox(height: 35.h),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 18.w),
              child: Text(
                'Info de réservation',
                textAlign: TextAlign.start,
                style: GoogleFonts.roboto(
                  fontSize: 18.sp,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 18.w),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r), color: blanc),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ModifierDate(
                                  widget.arrivalLabel,
                                  widget.departureLabel)));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 210.w),
                      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(
                            color: gris_pur, style: BorderStyle.solid),
                        color: transparent,
                      ),
                      child: Text(
                        'MODIFIER',
                        style: GoogleFonts.inter(
                            fontSize: 12.sp,
                            color: gris_pur,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              color: gris_clair,
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset('images/Home.svg',
                                    color: grey_icon, height: 20.h),
                                SizedBox(width: 8.w),
                                Text(
                                  widget.fetchedItems.categorie,
                                  style: GoogleFonts.roboto(
                                    fontSize: 16.sp,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    color: gris_pur,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding:
                                EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              color: gris_clair,
                            ),
                            child: Text(
                              widget.fetchedItems.nom.capitalizeEachWord(),
                              style: GoogleFonts.roboto(
                                fontSize: 16.sp,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                color: gris_pur,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: gris_clair,
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset('images/date plus.svg',
                                color: grey_icon, height: 20.h),
                                SizedBox(width: 8.w),
                            Text(
                              '$formattedArrivalDate - $formattedDepartureDate',
                              style: GoogleFonts.roboto(
                                fontSize: 16.sp,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                color: gris_pur,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: gris_clair,
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset('images/locatlisation.svg',
                                color: grey_icon, height: 20.h),
                            SizedBox(width: 8.w),
                            Text(
                              widget.selectedCity,
                              style: GoogleFonts.roboto(
                                fontSize: 16.sp,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                color: gris_pur,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            Container(
                margin: EdgeInsets.only(left: 18.w),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Infos de paiement',
                  style: GoogleFonts.roboto(
                    fontSize: 18.sp,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    color: text_noir,
                  ),
                )),
                SizedBox(height: 8.h),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 18.w),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r), color: blanc),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'COÛT TOTAL',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          color: gris_pur,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: orange.withOpacity(0.1)),
                        child: Text(
                          '${numberOfDays == 1 ? '1 jour' : '$numberOfDays jours'}',
                          style: GoogleFonts.inter(
                            fontSize: 12.sp,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            color: orange,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text('$formattedTotalCost FCFA',
                        style: GoogleFonts.roboto(
                          fontSize: 24.sp,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          color: text_noir,
                        )),
                  ),
                  Divider(
                    color: gris_pur,
                    thickness: 0.2,
                    indent: 0,
                    endIndent: 0,
                  ),
                  SizedBox(height: 4.h),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text('MOYEN DE PAIEMENT',
                        style: GoogleFonts.inter(
                          fontSize: 12.sp,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          color: gris_pur,
                        )),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OrangePaiement(
                                        widget.fetchedItems,
                                        widget.selectedType,
                                        widget.selectedCity,
                                        formattedArrivalDate,
                                        formattedDepartureDate,
                                      )));
                        },
                        child: SizedBox(
                          height: 35.h,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.h),
                            child: Image.asset(
                              'images/orange.png',
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WavePaiement(
                                        widget.fetchedItems,
                                        widget.selectedType,
                                        widget.selectedCity,
                                        formattedArrivalDate,
                                        formattedDepartureDate,
                                      )));
                        },
                        child: SizedBox(
                          height: 35.h,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: Image.asset(
                              'images/Wave.png',
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MTNPaiement(
                                        widget.fetchedItems,
                                        widget.selectedType,
                                        widget.selectedCity,
                                        formattedArrivalDate,
                                        formattedDepartureDate,
                                      )));
                        },
                        child: SizedBox(
                          height: 35.h,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: Image.asset(
                              'images/MTN.jpg',
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MoovPaiement(
                                        widget.fetchedItems,
                                        widget.selectedType,
                                        widget.selectedCity,
                                        formattedArrivalDate,
                                        formattedDepartureDate,
                                      )));
                        },
                        child: SizedBox(
                          height: 35.h,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: Image.asset(
                              'images/Moov.png',
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VisaPaiement(
                                        widget.fetchedItems,
                                        widget.selectedType,
                                        widget.selectedCity,
                                        formattedArrivalDate,
                                        formattedDepartureDate,
                                      )));
                        },
                        child: SizedBox(
                          height: 35.h,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: Image.asset(
                              'images/visa.jpg',
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MastercardPaiement(
                                        widget.fetchedItems,
                                        widget.selectedType,
                                        widget.selectedCity,
                                        formattedArrivalDate,
                                        formattedDepartureDate,
                                      )));
                        },
                        child: SizedBox(
                          height: 30.h,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: Image.asset(
                              'images/Mastercard.png',
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        )),
      );
  }
}
