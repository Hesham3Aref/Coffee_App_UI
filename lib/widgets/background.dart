
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BackGroundApp extends StatelessWidget {
  const BackGroundApp({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      width: size.width,
      height: size.height,
      child: Stack(
        children: [
          CoffeeBean(right: 160,top: 90,degree: 90,),
          CoffeeBean(right: 160,top: 90,degree: 90,),
          CoffeeBean(right: 160,top: 90,degree: 90,),
        ],
      ),
    );
  }
}

class CoffeeBean extends StatelessWidget {
  final double? top,left,right,bottom,degree;

  const CoffeeBean({super.key,this.bottom,this.degree,this.left,this.right,this.top});


  @override
  Widget build(BuildContext context) {
    return  Positioned(
      top: top,
      right: right,
      left: left,
      bottom: bottom,
      child: Transform.rotate(
        angle: degree! * pi /190,
        child: SvgPicture.asset('assets/coffee-bean.svg'),
      ),
    );
  }
}
