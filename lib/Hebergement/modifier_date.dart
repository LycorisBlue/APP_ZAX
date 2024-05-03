import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:hatooh/main.dart';

class ModifierDate extends StatefulWidget {
  final String arrivalLabel;
  final String departureLabel;

  ModifierDate(this.arrivalLabel, this.departureLabel);

  @override
  _ModifierDateState createState() => _ModifierDateState();
}

class _ModifierDateState extends State<ModifierDate> {
  late DateTime selectedArrivalDate;
  late DateTime selectedDepartureDate;
  bool isModified = false;

  void validateModification() {
    setState(() {
      isModified = true;
    });
    Navigator.pop(
      context,
      {
        'isModified': true,
        'arrival': selectedArrivalDate,
        'departure': selectedDepartureDate,
      },
    );
  }

  @override
  void initState() {
    super.initState();
    selectedArrivalDate = DateFormat('dd MMMM yyyy', 'fr').parse(widget.arrivalLabel);
    selectedDepartureDate =
        DateFormat('dd MMMM yyyy', 'fr').parse(widget.departureLabel);
  }

  String formatDate(DateTime date) {
  String formattedDate = DateFormat('dd MMMM', 'fr').format(date);
  formattedDate = formattedDate.replaceRange(3, 4, formattedDate[3].toUpperCase());

  return formattedDate;
}

  Future<void> _selectDate(bool isArrival) async {
  DateTime initialDate =
      isArrival ? selectedArrivalDate : selectedDepartureDate;

  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: initialDate,
    firstDate: DateTime.now(),
    lastDate: DateTime(DateTime.now().year + 2),
  );

  if (pickedDate != null && pickedDate != initialDate) {
    setState(() {
      if (isArrival) {
        selectedArrivalDate = pickedDate;
      } else {
        selectedDepartureDate = pickedDate;
      }
    });

    // Passer les nouvelles dates sélectionnées à l'écran précédent
    Navigator.pop(context, {
      'arrival': selectedArrivalDate,
      'departure': selectedDepartureDate,
    });
  }
}


  @override
  Widget build(BuildContext context) {
    BoxConstraints(
      maxWidth: MediaQuery.of(context).size.width,
      maxHeight: MediaQuery.of(context).size.height,
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 26,
              width: 89,
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 40, left: 135, bottom: 108),
              child: Text(
                'Modifier',
                style: GoogleFonts.roboto(
                  fontSize: 24,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                  color: text_noir,
                ),
              ),
            ),
            _buildDateContainer(
              'ARRIVÉE',
              selectedArrivalDate,
              true,
            ),
            _buildDateContainer(
              'DÉPART',
              selectedDepartureDate,
              false,
            ),
            SizedBox(height: 350),
            GestureDetector(
              onTap: () {
                Navigator.pop(context, {
                  'arrival': selectedArrivalDate,
                  'departure': selectedDepartureDate,
                });
              },
              child: Container(
                alignment: Alignment.center,
                height: 48,
                width: 340,
                margin: EdgeInsets.only(left: 18, right: 17),
                padding:
                    EdgeInsets.only(left: 114, right: 114, top: 14, bottom: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: gris_clair2,
                ),
                child: Text(
                  'Terminer',
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    color: gris_pur,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDateContainer(
      String label, DateTime selectedDate, bool isArrival) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 15,
          width: 50,
          margin: EdgeInsets.only(left: 18, bottom: 8),
          child: Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              color: gris_pur,
            ),
          ),
        ),
        GestureDetector(
          onTap: () => _selectDate(isArrival),
          child: Container(
            margin: EdgeInsets.only(left: 18, right: 17, bottom: 24),
            padding: EdgeInsets.only(left: 8, top: 4, bottom: 4),
            alignment: Alignment.center,
            height: 48,
            width: 340,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: gris_clair,
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  isArrival ? 'images/date plus.svg' : 'images/date moins.svg',
                  color: grey_icon,
                  height: 20,
                  width: 20,
                ),
                SizedBox(width: 8),
                Text(
                  formatDate(selectedDate),
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    color: gris_pur,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
