import 'package:FlutterGalleryApp/res/res.dart';
import 'package:FlutterGalleryApp/screens/photo_screen.dart';
import 'package:FlutterGalleryApp/widgets/widgets.dart';
import 'package:flutter/material.dart';

const String kGirl =
    'https://wallpapersmug.com/download/1920x1080/5955d5/barbara_palvin_supermodel_4k.jpg';
const String kUserAvatar =
    "https://pbs.twimg.com/profile_images/690927346883231744/x1AAbU9__400x400.jpg";
const String kFlutterDash =
    'https://flutter.dev/assets/404/dash_nest-c64796b59b65042a2b40fae5764c13b7477a592db79eaf04c86298dcb75b78ea.png';

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
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/fullScreenImage',
                arguments: FullScreenImageArguments(
                  routeSettings: RouteSettings(
                    arguments: 'Some title',
                  ),
                  heroTag: 'photo_$index',
                  name: 'Roman Kurzenev',
                  userName: 'PandaJoey',
                  photo: kGirl,
                  userPhoto: kUserAvatar,
                  altDescription:
                      'An app bar consists of a toolbar and potentially other widgets, such as a TabBar and a FlexibleSpaceBar. App bars typically expose one or more common actions with IconButtons which are optionally followed by a PopupMenuButton for less common operations (sometimes called the "overflow menu").',
                ),
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (BuildContext context) => FullScreenImage(
                //                 heroTag: 'photo_$index',
                //                 name: 'Sasha Gray',
                //                 userName: 'PandaJoey',
                //                 photo: kGirl,
                //                 userPhoto: kUserAvatar,
                //                 altDescription:
                //                     'An app bar consists of a toolbar and potentially other widgets, such as a TabBar and a FlexibleSpaceBar. App bars typically expose one or more common actions with IconButtons which are optionally followed by a PopupMenuButton for less common operations (sometimes called the "overflow menu").',
              );
            },
            child: Hero(
              tag: 'photo_$index',
              child: Photo(photoLink: kGirl),
            ),
          ),
          _buildPhotoMeta(index),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              'This is Flutter Dash. I love him :)',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headline3, //AppStyles.h3
            ),
          )
        ]);
  }

  Widget _buildPhotoMeta(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(children: <Widget>[
              UserAvatar(kUserAvatar),
              SizedBox(width: 6),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Roman Kurzenev', style: Theme.of(context).textTheme.headline2 ),//AppStyles.h2Black
                  Text('@PandaJoey',
                      style:
                          Theme.of(context).textTheme.headline5.copyWith(color: AppColors.manatee)) //AppStyles.h5Black
                ],
              )
            ]),
            LikeButton(true, 10),
          ]),
    );
  }
}
