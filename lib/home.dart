import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hatooh/Attraction/attraction.dart';
import 'package:hatooh/Hebergement/hebergement.dart';
import 'package:hatooh/Location/location.dart';
import 'package:hatooh/Navette/navette.dart';
import 'package:hatooh/Drawer/drawer.dart';
import 'package:hatooh/main.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentCarouselIndex = 0;
  DateTime? _lastPressedTime;
  final CarouselController _carouselController = CarouselController();
  final List<bool> _buttonStates = [true, false, false, false];
  List<Widget> get carouselItems => [
        GestureDetector(
          onTap: () {
            _carouselController.animateToPage(0);
            _updateButtonStates(0);
          },
          child: Container(
            margin: EdgeInsets.only(right: 8.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: _buttonStates[0] ? blanc : gris_clair2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.network(
                  'https://www.s-p5.com/dale/icônes/home smile.svg',
                  height: 20.h, color: _buttonStates[0] ? orange : grey_icon),
                SizedBox(width: 8.w),
                Text(
                  'HÉBERGEMENT',
                  style: GoogleFonts.roboto(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    color: _buttonStates[0] ? orange : grey_icon))]))),
        GestureDetector(
          onTap: () {
            _carouselController.animateToPage(1);
            _updateButtonStates(1);
          },
          child: Container(
            width: 100.w,
              margin: EdgeInsets.only(right: 8.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: _buttonStates[1] ? blanc : gris_clair2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.network(
                    'https://www.s-p5.com/dale/icônes/car 1.svg',
                    height: 20.h, color: _buttonStates[1] ? orange : grey_icon),
                  SizedBox(width: 8.w),
                  Text(
                    'NAVETTE',
                    style: GoogleFonts.roboto(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      color: _buttonStates[1] ? orange : grey_icon))]))),
        GestureDetector(
          onTap: () {
            _carouselController.animateToPage(2);
            _updateButtonStates(2);
          },
          child: Container(
            margin: EdgeInsets.only(right: 8.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: _buttonStates[2] ? blanc : gris_clair2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.network(
                  'https://www.s-p5.com/dale/icônes/party.svg',
                  height: 20.h, color: _buttonStates[2] ? orange : grey_icon),
                SizedBox(width: 8.w),
                Text(
                  'ATTRACTION',
                  style: GoogleFonts.roboto(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: _buttonStates[2] ? orange : grey_icon))]))),
        GestureDetector(
          onTap: () {
            _carouselController.animateToPage(3);
            _updateButtonStates(3);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: _buttonStates[3] ? blanc : gris_clair2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.network(
                  'https://www.s-p5.com/dale/icônes/car 2.svg',
                  height: 20.h, color: _buttonStates[3] ? orange : grey_icon),
                SizedBox(width: 8.w),
                Text(
                  'LOCATION',
                  style: GoogleFonts.roboto(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    color: _buttonStates[3] ? orange : grey_icon))])))];

  void _updateButtonStates(int index) {
  setState(() {
    _currentCarouselIndex = index;
    for (int i = 0; i < _buttonStates.length; i++) {
      _buttonStates[i] = i == index;
    }
  });
}

  List<Widget> get contentWidgets => [
        SingleChildScrollView(child: Hebergement()),
        SingleChildScrollView(child: Navette()),
        SingleChildScrollView(child: Attraction()),
        Location(),
      ];

  @override
  Widget build(BuildContext context) {
    BoxConstraints(
      maxWidth: MediaQuery.of(context).size.width,
      maxHeight: MediaQuery.of(context).size.height);
    return WillPopScope(
      onWillPop: () async {
        DateTime now = DateTime.now();
        if (_lastPressedTime == null ||
            now.difference(_lastPressedTime!) > const Duration(seconds: 2)) {
          _lastPressedTime = now;
          Fluttertoast.showToast(
            msg: "Appuyez de nouveau pour quitter l'application",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: gris_pur,
            textColor: blanc,
            fontSize: 14.sp);
          return false;
        }
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
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
                    bottomRight: Radius.circular(24.r)))),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                    top: 40.h,
                    left: 18.w),
                child: Builder(
                  builder: (BuildContext context) {
                    return GestureDetector(
                      child: SvgPicture.network('https://www.s-p5.com/dale/icônes/menu.svg', height: 18.h),
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      });
                  })),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 40.h),
                child: Image.asset('images/logo_hatooh.png', height: 55.h))])),
        drawer: DrawerPage(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 15.h),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 18.w),
              child: CarouselSlider(
                items: carouselItems,
                carouselController: _carouselController,
                options: CarouselOptions(
                  padEnds: false,
                  height: 44.h,
                  viewportFraction: 0.45,
                  initialPage: _currentCarouselIndex,
                  enableInfiniteScroll: false,
                  disableCenter: true,
                  onPageChanged: (index, _) {
                    setState(() {
                      _currentCarouselIndex = index;
                    });
                  }))),
            SizedBox(height: 15.h),
          Expanded(
            child: IndexedStack(
              index: _currentCarouselIndex,
              children: contentWidgets))])));
  }
}