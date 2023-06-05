import 'package:flutter/material.dart';

// final ButtonStyle _elevatedButtonStyle = ElevatedButton.styleFrom(
//   foregroundColor: Colors.black87, backgroundColor: const Color.fromRGBO(149, 185, 1, 1),
//   minimumSize: Size(88, 36),
//   padding: EdgeInsets.symmetric(horizontal: 16),
//   shape: const RoundedRectangleBorder(
//     borderRadius: BorderRadius.all(Radius.circular(10)),
//   ),
// );


ButtonStyle elevatedButtonStyle(){
  return
      ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: const Color.fromRGBO(149, 185, 1, 1),
        minimumSize: const Size(88, 36),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      );
}

