import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:smartdoorapp/main.dart';
import 'package:smartdoorapp/screen/navigation.dart';

class AboutUs extends StatelessWidget {
  final stylehead = const TextStyle(
      fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black);
  final stylenormal = const TextStyle(
      fontSize: 15, fontWeight: FontWeight.normal, color: Colors.black54);

  const AboutUs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5C6BC0),
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          'About Us',
          style: GoogleFonts.prompt(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF5C6BC0),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(10),
          child: Column(
            children: const [
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.power_settings_new_rounded),
            color: Colors.white,
            onPressed: () {
              SystemNavigator.pop();
            },
          )
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 50,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(0))),
          ),
          Container(
            // height: 604,
            color: Colors.white,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Thank You",
                  style: GoogleFonts.prompt(textStyle: stylehead),
                ),
                SizedBox(
                  child: Lottie.asset(
                    'images/lottie/93577-contact.json',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 100,
                  width: 300,
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'We are Software devolope and Mobile devolope team. Please contact us at kmutnb@email.ac.th',
                    style: GoogleFonts.prompt(textStyle: stylenormal),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                RaisedButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return const MyHome();
                  })),
                  color: Colors.blue[300],
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "start",
                    style: GoogleFonts.prompt(
                        color: Colors.white, fontWeight: FontWeight.normal),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
