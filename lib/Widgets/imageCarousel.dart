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
    return widget.speciesData.length == 0
        ? Container()
        : Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: GestureDetector(
              onTap: () {
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) =>));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("See More"),
                  Icon(CupertinoIcons.right_chevron)
                ],
              ),
            ),
          ),

          // ListView.builder(
          //   scrollDirection: Axis.horizontal,
          //   itemCount: widget.speciesData.length,
          //   prototypeItem: ListTile(
          //     title: Text("Endemic"),
          //
          //   ),
          //   itemBuilder: (context, index) {
          //     return Container(height: 200,
          //                 width: 180,
          //                 child: FittedBox(
          //                     fit: BoxFit.fill,
          //                     child: Image.network(
          //                         widget.speciesData[index].image1)));
          //   },
          // )


          // CarouselSlider.builder(carouselController: CarouselDemo(),
          //   itemCount: 15,
          //   itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          //       Container(
          //         child: Text(itemIndex.toString()),
          //       ),
          // )
          //
          // // CarouselSlider(
          //   itemCount: 15,
          //   options: CarouselOptions(
          //     height: 200, // Customize the height of the carousel
          //     // You can customize more options like autoPlay, pauseAutoPlayOnTouch, etc.
          //   ),
          //   itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          //       Container(
          //         color: Colors.blue, // Example: Set a background color for the container
          //         child: Center(
          //           child: Text(
          //             itemIndex.toString(),
          //             style: TextStyle(
          //               fontSize: 24,
          //               color: Colors.white,
          //             ),
          //           ),
          //         ),
          //       ),
          // )


          // CarouselSlider(
          //   options: CarouselOptions(height: 400.0),
          //   items: [widget.speciesData[0]].map((i) {
          //     return Builder(
          //       builder: (BuildContext context) {
          //         return Container(
          //             width: MediaQuery.of(context).size.width,
          //             margin: EdgeInsets.symmetric(horizontal: 5.0),
          //             decoration: BoxDecoration(
          //                 color: Colors.amber
          //             ),
          //             child: Text('text $i', style: TextStyle(fontSize: 16.0),)
          //         );
          //       },
          //     );
          //   }).toList(),
          // ),


          CarouselSlider.builder(
            itemCount: widget.speciesData.length,
            itemBuilder: (BuildContext context, int itemIndex,
                int pageViewIndex) =>
                Stack(children: [
                  Container(
                      height: 200,
                      width: 180,
                      child: FittedBox(
                          fit: BoxFit.fill,
                          child: Image.network(
                              widget.speciesData[itemIndex].image1)))
                ]),
            options: CarouselOptions(
                animateToClosest: true,
                scrollDirection: Axis.horizontal,
                autoPlay: false,
                enableInfiniteScroll: true),
          )
        ],
      ),
    );
  }
}


// class CarouselDemo extends StatelessWidget {
//   CarouselController buttonCarouselController = CarouselController();
//
//   @override
//   Widget build(BuildContext context) => Column(
//       children: <Widget>[
//         CarouselSlider(
//           items: child,
//           carouselController: buttonCarouselController,
//           options: CarouselOptions(
//             autoPlay: false,
//             enlargeCenterPage: true,
//             viewportFraction: 0.9,
//             aspectRatio: 2.0,
//             initialPage: 2,
//           ),
//         ),
//         RaisedButton(
//           onPressed: () => buttonCarouselController.nextPage(
//               duration: Duration(milliseconds: 300), curve: Curves.linear),
//           child: Text('→'),
//         )
//       ]
//   );
// }