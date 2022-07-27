import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:smartdoorapp/bluetooth/connection.dart';
import 'package:smartdoorapp/provider/savedata_provider.dart';
import 'package:smartdoorapp/screen/door.dart';
import 'package:smartdoorapp/screen/navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return SavedataProvider();
        })
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'smartdoorapp',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryColor: const Color(0xFF5C6BC0),
        ),
        home: FutureBuilder(
          future: FlutterBluetoothSerial.instance.requestEnable(),
          builder: (context, future) {
            //loading
            if (future.connectionState == ConnectionState.waiting) {
              return Scaffold(
                body: SizedBox(
                  height: double.infinity,
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 500,
                          child: Lottie.asset(
                            'images/lottie/101299-sad-emotion.json',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else if (future.connectionState == ConnectionState.done) {
              //connect to homepage
              return const MyHome();
            } else {
              //connect to homepage and ask to open bluetooth
              return const MyHome();
            }
          },
        ),
      ),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({Key key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final stylehead = const TextStyle(
      fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white);
  final stylenormal = const TextStyle(
      fontSize: 15, fontWeight: FontWeight.normal, color: Colors.black54);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color(0xFF5C6BC0),
            drawer: NavigationDrawerWidget(),
            appBar: AppBar(
              elevation: 0,
              backgroundColor: const Color(0xFF5C6BC0),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(350),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 200,
                        child: Lottie.asset(
                          'images/lottie/11323-sad-search.json',
                        ),
                      ),
                      Text(
                        "Select your device",
                        style: GoogleFonts.prompt(textStyle: stylehead),
                      ),
                      const SizedBox(
                        height: 80,
                      )
                    ],
                  ),
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
            body: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(0))),
                ),
                SelectBondedDevicePage(
                  onCahtPage: (device1) {
                    BluetoothDevice device = device1;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ChatPage(server: device);
                        },
                      ),
                    );
                  },
                ),
              ],
            )));
  }
}
