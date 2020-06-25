

import 'package:FlutterGalleryApp/res/res.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
import 'app.dart';

void main() {
  //debugRepaintRainbowEnabled = true;
  runApp(MyApp());
} 

class ConnectivityOverlay {
  static OverlayEntry overlayEntry;
  static final ConnectivityOverlay _instance = ConnectivityOverlay._internal();
  factory ConnectivityOverlay() {
    return _instance;
  }

  ConnectivityOverlay._internal();

  void showOverlay(BuildContext context, Widget widget) {
    if (overlayEntry == null) {
      overlayEntry = OverlayEntry(builder: (BuildContext context) {
        return Positioned(
          top: MediaQuery.of(context).viewInsets.top + 75,
          child: Material(
            color: Colors.transparent,
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                decoration: BoxDecoration(
                    color: AppColors.mercury,
                    borderRadius: BorderRadius.circular(12)),
                child: widget,
              ),
            ),
          ),
        );
      });
    }
    OverlayState overlayState = Overlay.of(context);
    overlayState.insert(overlayEntry);
    //await Future.delayed(Duration(seconds: 10));
    //overlayEntry.remove();
  }

  void removeOverlay(BuildContext context) {
    if (overlayEntry != null) {
      overlayEntry.remove();
    }
  }
}




