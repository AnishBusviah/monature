import 'package:flutter/material.dart';

class NatureReserves extends StatefulWidget {
  @override
  State<NatureReserves> createState() => _NatureReservesState();
}

class _NatureReservesState extends State<NatureReserves> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Item Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ItemPage(
        name: "...",
        description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla auctor ultrices massa, sed gravida ex feugiat vel. In efficitur bibendum fermentum. Vestibulum auctor accumsan augue, eu mollis turpis. Nunc scelerisque tincidunt vestibulum. Phasellus ut tellus commodo, efficitur metus non, tempus justo. Proin consectetur eu nisi id feugiat. Sed posuere tortor a leo ullamcorper varius. Curabitur nec tristique tellus. Fusce finibus scelerisque justo a euismod. Donec congue purus at tellus dapibus, id tempor odio tincidunt. Ut malesuada turpis quis augue volutpat facilisis. Phasellus eleifend turpis ac congue pellentesque. Sed malesuada risus et luctus varius. Sed eu iaculis turpis, id euismod nulla.',
        // emailAddress: '...',
        location: '...',
        // specialty: '...',
        telNo: '...',
        imageUrl: 'https://mautourco.com/wp-content/uploads/2022/01/1-1.jpg',
      ),
    );
  }
}

class ItemPage extends StatelessWidget {
  final String name;
  final String description;
  // final String specialty;
  final String location;
  // final String emailAddress;
  final String telNo;
  final String imageUrl;

  ItemPage({
    required this.name,
    required this.description,
    // required this.specialty,
    required this.location,
    // required this.emailAddress,
    required this.telNo,
    required this.imageUrl,
  });



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nature Reserve'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Text(
              'Name:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(name),
            SizedBox(height: 16),
            Text(
              'Description:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(description),
            SizedBox(height: 16),
            // Text(
            //   'Specialty:',
            //   style: TextStyle(
            //     fontSize: 18,
            //   ),
            // ),
            // Text(specialty),
            // SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Location:',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(location),
                SizedBox(height: 16),
                // Text(
                //   'Email Address:',
                //   style: TextStyle(
                //     fontSize: 18,
                //   ),
                // ),
                // Text(emailAddress),
                SizedBox(height: 16),
                Text(
                  'Tel No:',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(telNo),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
