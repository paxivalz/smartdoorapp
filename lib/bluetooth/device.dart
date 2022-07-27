import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:google_fonts/google_fonts.dart';

class BluetoothDeviceListEntry extends StatelessWidget {
  final Function onTap;
  final BluetoothDevice device;

  const BluetoothDeviceListEntry({this.onTap, @required this.device});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
      child: ListTile(
        onTap: onTap,
        leading: const Icon(Icons.devices),
        title: Text(
          device.name ?? "Unknown device",
          style: GoogleFonts.prompt(),
        ),
        subtitle: Text(
          device.address.toString(),
          style: GoogleFonts.prompt(),
        ),
        trailing: FlatButton(
          child: Text(
            'connect',
            style: GoogleFonts.prompt(color: Colors.white, fontSize: 12),
          ),
          onPressed: onTap,
          color: const Color(0xFF5C6BC0),
          shape: const RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(const Radius.circular(10))),
        ),
      ),
    );
  }
}
