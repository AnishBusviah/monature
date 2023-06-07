import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class CarouselSlider extends StatefulWidget {
  /// The widgets to display in the [ImageSlideshow].
  ///
  /// Mainly intended for image widget, but other widgets can also be used.
  List<Widget> children;

  /// Width of the [ImageSlideshow].
  //double width;

  /// Height of the [ImageSlideshow].
  //double height;

  /// The page to show when first creating the [ImageSlideshow].
  int initialPage;

  /// The color to paint the indicator.
  Color indicatorColor;

  /// The color to paint behind th indicator.
  Color indicatorBackgroundColor;

  /// Called whenever the page in the center of the viewport changes.
  //ValueChanged<int> onPageChanged;

  /// Auto scroll interval.
  ///
  /// Do not auto scroll with null or 0.
  int autoPlayInterval;

  /// Loops back to first slide.
  bool isLoop;

  /// Radius of circle indicator.
  double indicatorRadius;

  /// Disable page changes by the user.
  bool disableUserScrolling;

  CarouselSlider({
    Key? key,
    this.children = const [Text("Image1"), Text("Image2"), Text("Image3")],

    // this.width,
    // this.height,
    this.initialPage = 0,
    this.indicatorColor = Colors.white,
    this.indicatorBackgroundColor = Colors.white,
    //this.onPageChanged,
    this.autoPlayInterval = 0,
    this.isLoop = true,
    this.indicatorRadius = 5,
    this.disableUserScrolling = false,
  }) : super(key: key);

  @override
  State<CarouselSlider> createState() => _CarouselSliderState();
}

class _CarouselSliderState extends State<CarouselSlider> {
  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      /// Width of the [ImageSlideshow].
      width: double.infinity,

      /// Height of the [ImageSlideshow].
      height: 200,

      /// The page to show when first creating the [ImageSlideshow].
      initialPage: 0,

      /// The color to paint the indicator.
      indicatorColor: Colors.blue,

      /// The color to paint behind th indicator.
      indicatorBackgroundColor: Colors.grey,

      /// The widgets to display in the [ImageSlideshow].
      /// Add the sample image file into the images folder
      children: widget.children,

      /// Called whenever the page in the center of the viewport changes.
      onPageChanged: (value) {
        print('Page changed: $value');
      },

      /// Auto scroll interval.
      /// Do not auto scroll with null or 0.
      autoPlayInterval: 3000,

      /// Loops back to first slide.
      isLoop: true,
    );
  }
}
