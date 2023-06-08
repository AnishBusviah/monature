import 'package:flutter/material.dart';
import 'package:monature/Widgets/textStyles.dart';

class Authorities extends StatefulWidget {
  const Authorities({Key? key}) : super(key: key);

  @override
  State<Authorities> createState() => _AuthoritiesState();
}

class _AuthoritiesState extends State<Authorities> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 60),
          child: SizedBox(
            child: Image.network(
                "https://www.mauritian-wildlife.org/mwf-files/files/images/logo/logo.png"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 90),
          child: SizedBox(
            width: 350,
              child: Text(
                  "For all enquiries, suggestions or complaints concerning the Mauritian Wildlife Foundation",
              style: authoritiesDescription(),)),
        ),



        Padding(
          padding: const EdgeInsets.only(top: 40, left: 30),
          child: Row(children: [Icon(Icons.pin_drop), Text("Mauritius", style: authoritiesDataTitle(),)]),
        ),



        Padding(
          padding: const EdgeInsets.only(top: 40, left: 30),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Write to: ",
              style: authoritiesDataTitle(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SizedBox(
                  width: 270,
                  child: Text(
                      "Executive Director,\nMauritian Wildlife Foundation,\nGrannum Road, Vacoas 73418", style: authoritiesData(),)),
            )
          ]),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Row(
            children: [Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text("Tel: ", style: authoritiesDataTitle(),),
            ), Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Text("(230) 697-6097", style: authoritiesData(),),
            )],
          ),
        ),



        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Row(
            children: [Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text("Fax: ", style: authoritiesDataTitle(),),
            ), Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Text(" (230) 697-6512", style: authoritiesData(),),
            )],
          ),
        ),


        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Row(
            children: [Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text("Email: ", style: authoritiesDataTitle(),),
            ), Text("executive@mauritian-wildlife.org", style: authoritiesData(),)],
          ),
        )
      ],
    );
  }
}
