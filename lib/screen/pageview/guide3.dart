import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class intro3 extends StatefulWidget {
  const intro3({Key key}) : super(key: key);

  @override
  _intro3State createState() => _intro3State();
}

class _intro3State extends State<intro3> {
  final stylehead = const TextStyle(
      fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black);
  final stylenormal = const TextStyle(
      fontSize: 15, fontWeight: FontWeight.normal, color: Colors.black54);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 200,
              //child:  Text("Connecting with",style: TextStyle(color: Colors.pinkAccent),),
              child: //Lottie.network("https://assets6.lottiefiles.com/packages/lf20_gigyrcoy.json", animate: true),
                  Lottie.asset(
                'images/lottie/95434-history.json',
              ),
            ),
            Text(
              "Check your history",
              style: GoogleFonts.kanit(textStyle: stylehead),
            ),
            const SizedBox(
              height: 30,
            ),
            Text('ท่านสามารถตรวจสอบการใช้งานได้ผ่าน',
                style: GoogleFonts.prompt(textStyle: stylenormal)),
            Text('history ที่ระบุทั้งเวลาและวันที่',
                style: GoogleFonts.prompt(textStyle: stylenormal)),
            const SizedBox(
              height: 150,
            ),
            Text(
              '                                           เลื่อนเพื่อดูหน้าถัดไปหน้าถัดไป->',
              style: GoogleFonts.prompt(
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
