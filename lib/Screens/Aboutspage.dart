import 'package:flutter/material.dart';
class Aboutus extends StatelessWidget {
  const Aboutus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("About us"),
          backgroundColor: Color(0xFF184f8d),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(
                height: 180,
               // width: 370,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/logo-removebg-preview.png'),fit: BoxFit.contain
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("Gateway Distriparks Limited is an integrated inter-modal logistics service provider. "
                  "It has a network of 10 Inland Container Depots and Container Freight Stations strategically "
                  "located across the country, operating a fleet of 31 trainsets along with 500+ trailers for transportation between its facilities and maritime ports, "
                  "as well as first & last mile connectivity to provide end to end solutions to the EXIM industry. "
                  "The company offers general & bonded warehousing, rail & road transportation, container handling "
                  "services and other value added services.", textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 17.0,),),
            ),
          ],
        ),
      ),
    );
  }
}
