import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartdoorapp/screen/navigation.dart';
import 'package:smartdoorapp/screen/pageview/guide1.dart';
import 'package:smartdoorapp/screen/pageview/guide2.dart';
import 'package:smartdoorapp/screen/pageview/guide3.dart';
import 'package:smartdoorapp/screen/pageview/guide4.dart';

class Guidepage extends StatelessWidget {
  const Guidepage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5C6BC0),
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Help',
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
      body: Column(
        //padding: const EdgeInsets.all(8),
        children: [
          Container(
            height: 50,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(0))),
          ),
          Expanded(
              child: Container(
            height: 600,
            color: Colors.white,
            child: PageView(
              children: const [intro1(), intro2(), intro3(), intro4()],
            ),
          )),
        ],
      ),
    );
  }
}
