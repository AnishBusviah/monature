import 'dart:ffi';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monature/Model/species.dart';

class ImageCarousel extends StatefulWidget {

  List<Species> speciesData;

  ImageCarousel({Key? key, required this.speciesData}) : super(key: key);

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  @override
  Widget build(BuildContext context) {
    return widget.speciesData.length ==0? Container() : Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Text("See More"), Icon(CupertinoIcons.right_chevron)],
            ),
          ),
          CarouselSlider.builder(
            itemCount: widget.speciesData.length,
            itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                Stack(children: [Container(height: 200, width: 180 ,child: FittedBox(fit: BoxFit.fill, child: Image.network(widget.speciesData[itemIndex].image1)))]), options: CarouselOptions(scrollDirection: Axis.horizontal, autoPlay: false, enableInfiniteScroll: true),
          )
        ],
      ),
    );
  }
}
