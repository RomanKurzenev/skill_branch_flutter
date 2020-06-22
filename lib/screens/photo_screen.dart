//import 'package:FlutterGalleryApp/res/res.dart';



import 'package:FlutterGalleryApp/res/res.dart';
import 'package:FlutterGalleryApp/widgets/claim_bottom_sheet.dart';
import 'package:FlutterGalleryApp/widgets/widgets.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';

//import 'package:FlutterGalleryApp/widgets/widgets.dart';
//'https://i.pinimg.com/236x/bb/55/bb/bb55bbdac2bc9f6a8720b560e2e22424.jpg'

class FullScreenImageArguments {
  FullScreenImageArguments({
    this.altDescription,
    this.name,
    this.userName,
    this.photo,
    this.userPhoto,
    this.heroTag,
    this.key,
    this.routeSettings,
  });

  final String altDescription;
  final String name;
  final String userName;
  final String photo;
  final String userPhoto;
  final String heroTag;
  final Key key;
  final RouteSettings routeSettings;
}

class FullScreenImage extends StatefulWidget {
  final String altDescription;
  final String name;
  final String userName;
  final String photo;
  final String userPhoto;
  final String heroTag;

  const FullScreenImage({
    Key key,
    this.altDescription = '',
    this.name = '',
    this.userName = '',
    this.photo = '',
    this.userPhoto = '',
    this.heroTag,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FullScreenImage();
  }
}

class _FullScreenImage extends State<FullScreenImage>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          ClaimBottomSheet(),
        ],
        centerTitle: true,
        title: Text('Photo',
            style: Theme.of(context)
                .textTheme
                .headline1), //TextStyle(color: Colors.black)
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              CupertinoIcons.back,
              color: Colors.grey,
            ),
            onPressed: () => Navigator.pop(context)),
      ),
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Hero(
            tag: widget.heroTag,
            child: Photo(photoLink: widget.photo),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: Text(
              widget.altDescription,
              style: Theme.of(context).textTheme.headline3, //AppStyles.h3,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget child) {
                return Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Opacity(
                      opacity: animationUserAvatar(),
                      child: UserAvatar(widget.userPhoto),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Opacity(
                      opacity: animationUserName(),
                      child: Column(
                        children: <Widget>[
                          Text(widget.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1), //AppStyles.h1Black
                          Text(
                            '@' + widget.userName,
                            style: Theme.of(context)
                                .textTheme
                                .headline5 //AppStyles.h5Black
                                .copyWith(color: AppColors.manatee),
                          )
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                    )
                  ],
                );
              }),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(children: <Widget>[
              LikeButton(true, 10),
              SizedBox(width: 14),
              Expanded(
                child: _buildButton(
                  'Save',
                  () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: const Text('Downloading photos'),
                              content: const Text(
                                  'Are you sure you want to upload a photo?'),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text('Download'),
                                  onPressed: () async {
                                    await GallerySaver.saveImage(widget.photo);
                                    Navigator.pop(context);
                                  },
                                ),
                                FlatButton(
                                  child: Text('Close'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            ));
                  },
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _buildButton('Visit', () async {
                  OverlayState overlayState = Overlay.of(context);

                  OverlayEntry overlayEntry =
                      OverlayEntry(builder: (BuildContext context) {
                    return Positioned(
                      top: MediaQuery.of(context).viewInsets.top + 50,
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
                            child: Text('SkillBranch'),
                          ),
                        ),
                      ),
                    );
                  });
                  overlayState.insert(overlayEntry);
                  await Future.delayed(Duration(seconds: 10));
                  overlayEntry.remove();
                }),
              )
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text, VoidCallback callback) {
    return GestureDetector(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.dodgerBlue,
            borderRadius: BorderRadius.circular(7.0),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
        onTap: callback);
  }

  double animationUserAvatar() {
    return Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(
            parent: _controller, curve: Interval(0.0, 0.5, curve: Curves.ease)))
        .value;
  }

  double animationUserName() {
    return Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(
            parent: _controller, curve: Interval(0.5, 1.0, curve: Curves.ease)))
        .value;
  }
}
