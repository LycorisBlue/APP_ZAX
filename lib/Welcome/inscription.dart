import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hatooh/Welcome/connexion.dart';
import 'package:hatooh/home.dart';
import 'package:hatooh/main.dart';
import 'package:http/http.dart' as http;
import 'package:hive_flutter/hive_flutter.dart';

class Inscription extends StatefulWidget {
  @override
  _InscriptionState createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  void envoyerFormulaire() async {
    final Box _boxUser = Hive.box("accounts");
    var url = 'https://www.s-p5.com/dale/hatoohci/inscription.php';
    var response = await http.post(Uri.parse(url), body: {
      'Nometprenom': nomPrenomController.text,
      'email': emailController.text,
      'ndt': numeroTelephoneController.text
    });

    if (response.statusCode == 200) {
      print('Formulaire envoyé avec succès');
      _boxUser.put("name", nomPrenomController.text);
      _boxUser.put("email", emailController.text);
      _boxUser.put("ndt", numeroTelephoneController.text);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      print('Erreur lors de l\'envoi du formulaire. Code d\'erreur: ${response.statusCode}');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(seconds: 2),
          backgroundColor: gris_clair,
          content: SizedBox(
              height: 16.h,
              child: Text('Erreur lors de l\'inscription. Veuillez réessayer.', style: GoogleFonts.roboto(fontSize: 14.sp, color: rouge)))));
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nomPrenomController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController numeroTelephoneController =
      TextEditingController();
      bool _emptyFieldErrorShown = false;

  String? _validateRequired(String value, String fieldName) {
    if (value.isEmpty && !_emptyFieldErrorShown) {
      _emptyFieldErrorShown = true;
      return 'champ_vide'.tr;
    }
    return null;
  }

  String? _validateNom(String value) {
    final RegExp nomRegExp = RegExp(r'^[a-zA-ZÀ-ÿ\s]+$');
    if (!nomRegExp.hasMatch(value)) {
      return 'alerte_nom'.tr;
    }
    return null;
  }

  String? _validateEmail(String value) {
    if (!RegExp(r'^[a-zA-Z0-9]+@[a-z]+\.[a-z]+$').hasMatch(value)) {
      return 'alerte_e-mail'.tr;
    }

    final parts = value.split('@');
    final validExtensions = ['com', 'net', 'org', 'edu', 'fr', 'ci'];
    final domainParts = parts[1].split('.');
    if (!validExtensions.contains(domainParts[1])) {
      return 'alerte_extension'.tr;
    }

    final validDomains = ['gmail', 'yahoo', 'hotmail'];
    if (!validDomains.contains(domainParts[0])) {
      return 'alerte_domaine'.tr;
    }

    return null;
  }

  String? _validatePhoneNumber(String value) {
    final RegExp phoneRegExp = RegExp(r'^[0-9+]+$');
    if (!phoneRegExp.hasMatch(value)) {
      return 'alerte_numero'.tr;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height);
    return Scaffold(
        backgroundColor: gris_clair,
        body: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(children: [
                        Transform.translate(
                            offset: Offset(0.0, -11.h),
                            child: ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                    noir.withOpacity(0.5), BlendMode.srcATop),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(32.r), bottomRight: Radius.circular(32.r)),
                                    child: Image.asset('images/plageci4.jpg',
                                        fit: BoxFit.cover, height: 170.h, width: double.infinity)))),
                        Transform.translate(
                            offset: Offset(0.0, -11.h),
                            child: Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(top: 80.h),
                                child: Image.asset('images/hatooh_blanc.png', height: 64.h)))]),
                      SizedBox(height: 33.h),
                      Transform.translate(
                          offset: Offset(0.0, -11.h),
                          child: Text('inscription'.tr,
                              style: GoogleFonts.roboto(fontSize: 28.sp, fontWeight: FontWeight.w500, color: noir))),
                      SizedBox(height: 8.h),
                      Transform.translate(
                          offset: Offset(0.0, -11.h),
                          child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 80.w),
                              child: Text('inscription_message'.tr,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w400, fontSize: 16.sp, color: gris_pur)))),
                      SizedBox(height: 27.h),
                      Transform.translate(
                          offset: Offset(0.0, -11.h),
                          child: Container(
                              height: 155.h,
                              margin: EdgeInsets.symmetric(horizontal: 18.w),
                              padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 8.h),
                              decoration: BoxDecoration(
                                  color: blanc, borderRadius: BorderRadius.circular(16.r)),
                              child: Column(
                                children: [
                                SizedBox(
                                    height: 48.h,
                                    child: TextFormField(
                                        controller: nomPrenomController,
                                        validator: (value) {
                                          final requiredError = _validateRequired(value!, 'nom'.tr);
                                          if (requiredError != null) {
                                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                duration: const Duration(seconds: 2),
                                                backgroundColor: gris_clair,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.only(
                                                        topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r))),
                                                content: Container(
                                                    height: 16.h,
                                                    alignment: Alignment.center,
                                                    child: Text(requiredError,
                                                        style: GoogleFonts.roboto(
                                                            fontSize: 14.sp, color: rouge)))));
                                            return '';
                                          }
                                          final nomError = _validateNom(value);
                                          if (nomError != null) {
                                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                    duration: const Duration(seconds: 2),
                                                    backgroundColor: gris_clair,
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.only(
                                                                topLeft: Radius.circular(16.r),
                                                                topRight: Radius.circular(16.r))),
                                                    content: Container(
                                                        height: 16.h,
                                                        alignment: Alignment.center,
                                                        child: Text(
                                                          nomError,
                                                          style: GoogleFonts.roboto(
                                                                  fontSize: 14.sp,
                                                                  color: rouge)))));
                                            return '';
                                          }
                                          return null;
                                        },
                                        style: GoogleFonts.roboto(
                                            color: text_noir,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 16.sp),
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(left: 16.w, right: 16.w),
                                            errorStyle: GoogleFonts.poppins(fontSize: 0),
                                            errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: rouge, width: 1.w),
                                                borderRadius: BorderRadius.circular(8.r)),
                                            hintText: 'nom'.tr,
                                            hintStyle: GoogleFonts.roboto(
                                                color: gris_pur,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16.sp),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(color: transparent),
                                                borderRadius: BorderRadius.circular(8.r)),
                                            filled: true,
                                            fillColor: gris_clair,
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(color: transparent),
                                                borderRadius: BorderRadius.circular(8.r))))),
                                SizedBox(
                                    height: 48.h,
                                    child: TextFormField(
                                        controller: emailController,
                                        validator: (value) {
                                          final requiredError = _validateRequired(value!, 'e-mail'.tr);
                                          if (requiredError != null) {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                duration: const Duration(seconds: 2),
                                                backgroundColor: gris_clair,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.only(
                                                        topLeft:Radius.circular(16.r),
                                                        topRight:Radius.circular(16.r))),
                                                content: Container(
                                                    height: 16.h,
                                                    alignment: Alignment.center,
                                                    child: Text(requiredError,
                                                        style: GoogleFonts.roboto(
                                                            fontSize: 14.sp,
                                                            color: rouge)))));
                                            return '';
                                          }
                                          final emailError = _validateEmail(value);
                                          if (emailError != null) {
                                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                duration: const Duration(seconds: 2),
                                                backgroundColor: gris_clair,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.only(
                                                        topLeft: Radius.circular(16.r),
                                                        topRight: Radius.circular(16.r))),
                                                content: Container(
                                                    height: 16.h,
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      emailError,
                                                        style: GoogleFonts.roboto(
                                                            fontSize: 14.sp,
                                                            color: rouge)))));
                                            return '';
                                          }
                                          return null;
                                        },
                                        keyboardType: TextInputType.emailAddress,
                                        style: GoogleFonts.roboto(
                                            color: text_noir,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16.sp),
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(left: 16.w, right: 16.w),
                                            errorStyle: GoogleFonts.poppins(fontSize: 0),
                                            errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: rouge, width: 1.w),
                                                borderRadius: BorderRadius.circular(8.r)),
                                            hintText: 'e-mail'.tr,
                                            hintStyle: GoogleFonts.roboto(
                                                color: gris_pur,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16.sp),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(color: transparent),
                                                borderRadius: BorderRadius.circular(8.r)),
                                            filled: true,
                                            fillColor: gris_clair,
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(color: transparent),
                                                borderRadius:BorderRadius.circular(8.r))))),
                                SizedBox(
                                    height: 48.h,
                                    child: TextFormField(
                                        controller: numeroTelephoneController,
                                        validator: (value) {
                                          final requiredError = _validateRequired(
                                                  value!, 'numero'.tr);
                                          if (requiredError != null) {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                duration: const Duration(seconds: 2),
                                                backgroundColor: gris_clair,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.only(
                                                        topLeft: Radius.circular(16.r),
                                                        topRight: Radius.circular(16.r))),
                                                content: Container(
                                                    height: 16.h,
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      requiredError,
                                                        style: GoogleFonts.roboto(
                                                            fontSize: 14.sp,
                                                            color: rouge)))));
                                            return '';
                                          }
                                          final phoneError = _validatePhoneNumber(value);
                                          if (phoneError != null) {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                duration: const Duration(seconds: 2),
                                                backgroundColor: gris_clair,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.only(
                                                        topLeft: Radius.circular(16.r),
                                                        topRight: Radius.circular(16.r))),
                                                content: Container(
                                                    height: 16.h,
                                                    alignment: Alignment.center,
                                                    child: Text(phoneError,
                                                        textAlign: TextAlign.center,
                                                        style: GoogleFonts.roboto(
                                                            fontSize: 14.sp,
                                                            color: rouge)))));
                                            return '';
                                          }
                                          return null;
                                        },
                                        keyboardType: TextInputType.phone,
                                        style: GoogleFonts.roboto(
                                            color: text_noir,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16.sp),
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                                            errorStyle: GoogleFonts.poppins(fontSize: 0),
                                            errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: rouge, width: 1.w),
                                                borderRadius: BorderRadius.circular(8.r)),
                                            hintText: 'numero'.tr,
                                            hintStyle: GoogleFonts.roboto(
                                                color: gris_pur,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16.sp),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(color: transparent),
                                                borderRadius: BorderRadius.circular(8.r)),
                                            filled: true,
                                            fillColor: gris_clair,
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(color: transparent),
                                                borderRadius: BorderRadius.circular(8.r)))))]))),
                      SizedBox(height: 99.h),
                      GestureDetector(
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              var numeroTelephone = numeroTelephoneController.text;
                              var url = 'https://www.s-p5.com/dale/hatoohci/inscription.php';
                              var response = await http.post(Uri.parse(url), body: {
                                'Nometprenom': nomPrenomController.text,
                                'email': emailController.text,
                                'ndt': numeroTelephone,
                              });
                              if (response.statusCode == 200) {
                                if (response.body == 'Ce numéro de téléphone est déjà enregistré. Veuillez utiliser un autre numéro.') {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          backgroundColor: gris_clair,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(16.r),
                                                  topRight: Radius.circular(16.r))),
                                          content: Container(
                                              height: 16.h,
                                              alignment: Alignment.center,
                                              child: Text(
                                                  'numero_enregistré'.tr,
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 14.sp,
                                                      color: rouge)))));
                                } else {
                                  envoyerFormulaire();
                                }
                              } else {
                                print('Erreur lors de l\'envoi du formulaire. Code d\'erreur: ${response.statusCode}');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: gris_clair,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(16.r),
                                            topRight: Radius.circular(16.r))),
                                    content: Container(
                                        height: 16.h,
                                        alignment: Alignment.center,
                                        child: Text(
                                            'erreur_inscription'.tr,
                                            style: GoogleFonts.roboto(
                                                fontSize: 14.sp,
                                                color: rouge)))));
                              }
                            }
                          },
                          child: Container(
                              height: 48.h,
                              alignment: Alignment.center,
                              margin: EdgeInsets.symmetric(horizontal: 18.w),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  color: orange),
                              child: Text(
                                'continuer'.tr,
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp,
                                      color: blanc)))),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Connexion()));
                          },
                          child: Container(
                              height: 48.h,
                              alignment: Alignment.center,
                              margin: EdgeInsets.symmetric(horizontal: 18.w),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r)),
                              child: Text('compte_existant'.tr,
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp,
                                      color: gris_pur))))]))));
  }
}
