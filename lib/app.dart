import 'dart:io';

import 'package:FlutterGalleryApp/res/res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'screens/home.dart';
import 'screens/photo_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: buildAppTextTheme(),
        ),
        home: Home(), //Feed()//FullScreenImage()
        onUnknownRoute: (RouteSettings settings){
          return MaterialPageRoute(builder: (BuildContext context){
            return Scaffold(
              body: Center(
                child: Column(
                  children: <Widget>[
                    Text('404'),
                    Text('Page not found'),
                  ],
                ),
              ),
            );
          });
        },
        onGenerateRoute: (RouteSettings settings) {
          if (settings.name == '/fullScreenImage') {
            FullScreenImageArguments args =
                (settings.arguments as FullScreenImageArguments);
            final route = FullScreenImage(
              photo: args.photo,
              altDescription: args.altDescription,
              userName: args.userName,
              name: args.name,
              userPhoto: args.userPhoto,
              heroTag: args.heroTag,
              key: args.key,
            );

            if (Platform.isAndroid) {
              return MaterialPageRoute(builder: (context) => route, settings: args.routeSettings);
            } else if (Platform.isIOS) {
              return CupertinoPageRoute(builder: (context) => route, settings: args.routeSettings);
            }
          }
        });
  }
}
