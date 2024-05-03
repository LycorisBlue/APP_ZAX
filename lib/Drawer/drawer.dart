import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hatooh/Drawer/infos_conditions.dart';
import 'package:hatooh/Drawer/liste_reservation.dart';
import 'package:hatooh/Welcome/onboarding.dart';
import 'package:hatooh/home.dart';
import 'package:hatooh/main.dart';
import 'package:hatooh/Drawer/profil.dart';
import 'package:hive/hive.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerPage extends StatefulWidget {
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  String _urlweb = 'https://www.hatooh-ci.com';
  String _urlfacebook = 'https://www.facebook.com/profile.php?id=100077322855112';
  String _urlx = 'https://twitter.com/hatoohci/status/1618187116294569986?t=WmPqrs4UjNsVow64MgjKGw&s=19';
  String _urlinstagram = 'https://www.instagram.com/hatoohci/?igshid=YmMyMTA2M2Y%3D';

  void _launchURLweb() async {
    if (!await launch(_urlweb)) throw 'Could not launch $_urlweb';
  }
  void _launchURLfacebook() async {
    if (!await launch(_urlfacebook)) throw 'Could not launch $_urlfacebook';
  }
  void _launchURLx() async {
    if (!await launch(_urlx)) throw 'Could not launch $_urlx';
  }
  void _launchURLinstagram() async {
    if (!await launch(_urlinstagram)) throw 'Could not launch $_urlinstagram';
  }

  void _deconnexion() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();
  await Hive.deleteBoxFromDisk("login");
  await Hive.deleteBoxFromDisk("accounts");
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => Onboarding()),
    (Route<dynamic> route) => false,
  );
}
  @override
  Widget build(BuildContext context) {
    BoxConstraints(
      maxWidth: MediaQuery.of(context).size.width,
      maxHeight: MediaQuery.of(context).size.height,
    );
    var screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: screenSize.width * 0.9,
          height: screenSize.height,
      child: SizedBox(
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(screenSize.width * 0.07),
              bottomRight: Radius.circular(screenSize.width * 0.07)),
          child: Drawer(
            backgroundColor: blanc,
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                Stack(
                  children: [
                    Container(
                      width: screenSize.width * 1,
                      height: screenSize.width * 0.35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(screenSize.width * 0.3),
                          border:
                              Border.all(color: transparent, width: 0)),
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                            noir.withOpacity(0.5), BlendMode.srcATop),
                        child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(screenSize.width * 0.1)),
                            child: Image.asset(
                              'images/plage10.jpg',
                              fit: BoxFit.cover,
                            )),
                      ),
                    ),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: screenSize.width * 0.05, top: screenSize.width * 0.2),
                        child: ClipRRect(
                          child: Image.network(
                            'https://www.s-p5.com/dale/icônes/hatooh_blanc.png',
                            fit: BoxFit.cover, height: 40.h,
                          ),
                        ),
                      ),
                        Container(
                          margin: EdgeInsets.only(right: screenSize.width * 0.05, top: screenSize.width * 0.2),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                            },
                            child: SvgPicture.asset('images/close.svg',
                                color: blanc),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: screenSize.height * 0.07),
                Container(
                  margin: EdgeInsets.only(left: screenSize.width * 0.05),
                  child: Text(
                    'MENU',
                    style: GoogleFonts.inter(
                        fontSize: screenSize.width * 0.03,
                        fontWeight: FontWeight.w500,
                        color: text_noir),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.02),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePage()));
                  },
                  child: Container(
                    height: screenSize.width * 0.13,
                    width: screenSize.width * 0.4,
                    padding: EdgeInsets.only(left: screenSize.width * 0.04),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(screenSize.width * 0.02),
                      color: gris_clair2,
                    ),
                    margin: EdgeInsets.only(left: screenSize.width * 0.05, right: screenSize.width * 0.05),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'images/accueil.svg',
                          color: grey_icon,
                          height: screenSize.width * 0.05,
                          width: screenSize.width * 0.05,
                        ),
                        SizedBox(width: screenSize.width * 0.03),
                        Text('Accueil',
                            style: GoogleFonts.roboto(
                              color: text_noir,
                              fontSize: screenSize.width * 0.045,
                              fontWeight: FontWeight.w400,
                            ))
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.01),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ListeReservation()));
                  },
                  child: Container(
                    height: screenSize.width * 0.13,
                  width: screenSize.width * 0.4,
                    padding: EdgeInsets.only(left: screenSize.width * 0.04),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(screenSize.width * 0.02),
                      border: Border.all(color: gris_clair2),
                      color: Colors.transparent,
                    ),
                    margin: EdgeInsets.only(left: screenSize.width * 0.05, right: screenSize.width * 0.05),
                    child: Row(children: [
                      SvgPicture.asset(
                        'images/ticket.svg',
                        color: grey_icon,
                        height: screenSize.width * 0.05,
                        width: screenSize.width * 0.05,
                      ),
                      SizedBox(width: screenSize.width * 0.03),
                      Text('Réservations',
                          style: GoogleFonts.roboto(
                            color: text_noir,
                            fontSize: screenSize.width * 0.045,
                            fontWeight: FontWeight.w400,
                          )),
                    ]),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.01),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Profil()));
                  },
                  child: Container(
                    height: screenSize.width * 0.13,
                  width: screenSize.width * 0.4,
                    padding: EdgeInsets.only(left: screenSize.width * 0.04),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(screenSize.width * 0.02),
                      border: Border.all(color: gris_clair2),
                      color: Colors.transparent,
                    ),
                    margin: EdgeInsets.only(left: screenSize.width * 0.05, right: screenSize.width * 0.05),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'images/ticket.svg',
                          color: grey_icon,
                          height: screenSize.width * 0.05,
                        width: screenSize.width * 0.05,
                        ),
                        SizedBox(width: screenSize.width * 0.03),
                        Text('Profil',
                            style: GoogleFonts.roboto(
                              color: text_noir,
                              fontSize: screenSize.width * 0.045,
                              fontWeight: FontWeight.w400,
                            )),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.01),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InfosConditionsPage()));
                  },
                  child: Container(
                    height: screenSize.width * 0.13,
                  width: screenSize.width * 0.4,
                    padding: EdgeInsets.only(left: screenSize.width * 0.04),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(screenSize.width * 0.02),
                      border: Border.all(color: gris_clair2),
                      color: Colors.transparent,
                    ),
                    margin: EdgeInsets.only(left: screenSize.width * 0.05, right: screenSize.width * 0.05),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'images/info.svg',
                          color: grey_icon,
                          height: screenSize.width * 0.05,
                        width: screenSize.width * 0.05,
                        ),
                        SizedBox(width: screenSize.width * 0.03),
                        Text('Infos et conditions',
                            style: GoogleFonts.roboto(
                              color: text_noir,
                              fontSize: screenSize.width * 0.045,
                              fontWeight: FontWeight.w400,
                            )),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.3),
                GestureDetector(
                  onTap: () {
                    _deconnexion();
                  },
                  child: Container(
                    height: screenSize.width * 0.13,
                  width: screenSize.width * 0.4,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(screenSize.width * 0.02),
                      color: Colors.transparent,
                    ),
                    margin: EdgeInsets.only(left: screenSize.width * 0.05),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'images/logout.svg',
                          color: grey_icon,
                          height: screenSize.width * 0.05,
                        width: screenSize.width * 0.05,
                        ),
                        SizedBox(width: screenSize.width * 0.03),
                        Text('Déconnexion',
                            style: GoogleFonts.roboto(
                              color: grey_icon,
                              fontSize: screenSize.width * 0.045,
                              fontWeight: FontWeight.w400,
                            )),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.002),
                Row(
                  children: [
                    SizedBox(width: screenSize.width * 0.05,),
                    GestureDetector(
                        onTap: _launchURLfacebook,
                        child: SvgPicture.asset(
                          'images/Facebook.svg',
                          height: screenSize.width * 0.1,
                        width: screenSize.width * 0.1,
                        )),
                    SizedBox(width: screenSize.width * 0.03),
                    GestureDetector(
                        onTap: _launchURLx,
                        child: SvgPicture.asset(
                          'images/x.svg',
                          color: Colors.black,
                          height: screenSize.width * 0.05,
                        width: screenSize.width * 0.1,
                        )),
                    SizedBox(width: screenSize.width * 0.03),
                    GestureDetector(
                        onTap: _launchURLinstagram,
                        child: SvgPicture.asset(
                          'images/Instagram.svg',
                          height: screenSize.width * 0.1,
                        width: screenSize.width * 0.1,
                        color: Colors.black,
                        )),
                    SizedBox(width: screenSize.width * 0.03),
                    GestureDetector(
                        onTap: _launchURLweb,
                        child: SvgPicture.asset('images/web.svg',
                        color: Colors.black,
                        height: screenSize.width * 0.07,
                        width: screenSize.width * 0.07))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
