import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hatooh/Hebergement/hebergement.dart';
import 'package:hatooh/main.dart';

class BonsPlans extends StatefulWidget {
  late final Item items;

  BonsPlans(this.items);


  @override
  State<BonsPlans> createState() => _BonsPlansState();
}

class _BonsPlansState extends State<BonsPlans> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gris_clair,
      body: Column(
        children: [
          Stack(children: [
          SizedBox(
              height: 270.h,
              width: double.infinity,
              child: Hero(
                  tag: widget.items.id,
                  child: Image.network(widget.items.img_path, fit: BoxFit.fill))),
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                  margin: EdgeInsets.only(left: 18.w, top: 30.h),
                  child: SvgPicture.network('https://www.s-p5.com/dale/icônes/back.svg', color: blanc, height: 30.h)))
        ]),
        ],
      ),
    );
  }
}