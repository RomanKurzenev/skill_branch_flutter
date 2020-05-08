import 'package:FlutterGalleryApp/res/res.dart';
import 'package:FlutterGalleryApp/screens/photo_screen.dart';
import 'package:FlutterGalleryApp/widgets/widgets.dart';
import 'package:flutter/material.dart';
const String kGirl = 'https://wallpapersmug.com/download/1920x1080/5955d5/barbara_palvin_supermodel_4k.jpg';
const String kFlutterDash = 'https://flutter.dev/assets/404/dash_nest-c64796b59b65042a2b40fae5764c13b7477a592db79eaf04c86298dcb75b78ea.png';

class Feed extends StatefulWidget {
  Feed({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FeedState();
  }
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
        return Column(children: <Widget>[
          _buildItem(index),
          Divider(
            thickness: 2.0,
            color: AppColors.mercury,
          )
        ]);
      }),
    );
  }

  Widget _buildItem(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:<Widget>[
        GestureDetector(
          onTap: (){
            Navigator.push(context, 
              MaterialPageRoute(builder: (BuildContext context) => FullScreenImage(
                name: 'Sasha Gray',
                userName: 'PandaJoey',
                photo: kGirl,
                altDescription: 'An app bar consists of a toolbar and potentially other widgets, such as a TabBar and a FlexibleSpaceBar. App bars typically expose one or more common actions with IconButtons which are optionally followed by a PopupMenuButton for less common operations (sometimes called the "overflow menu").',
              )));
          },
          child: Photo(
          photoLink: kGirl,
        ),
        ),
        _buildPhotoMeta(index),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5
          ),
          child: Text(
          'This is Flutter Dash. I love him :)',
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: AppStyles.h3,
        ),)
      ]
    );
  }
  Widget _buildPhotoMeta(int index){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              UserAvatar('https://pbs.twimg.com/profile_images/690927346883231744/x1AAbU9__400x400.jpg'),
              SizedBox(width: 6),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                children: <Widget>[
                  Text('Sasha Gray', style: AppStyles.h2Black),
                  Text('@SGray', style: AppStyles.h5Black.copyWith(color: AppColors.manatee))
                ],
              )
            ]
          ),
          LikeButton(true, 10), 
        ]
      ),
    );
  }
}
