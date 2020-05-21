//import 'package:FlutterGalleryApp/res/res.dart';

import 'package:FlutterGalleryApp/res/res.dart';
import 'package:FlutterGalleryApp/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import 'package:FlutterGalleryApp/widgets/widgets.dart';
//'https://i.pinimg.com/236x/bb/55/bb/bb55bbdac2bc9f6a8720b560e2e22424.jpg'
class FullScreenImage extends StatefulWidget {
  String altDescription;
  String name;
  String userName;
  String photo;
  String heroTag;

  FullScreenImage({Key key, altDescription, name, userName, photo, heroTag})
      : super(key: key) {
    this.heroTag = heroTag;
    this.altDescription = altDescription ?? 'description empty';
    this.name = name ?? 'name empty';
    this.userName = userName ?? 'nickName empty';
    this.photo = photo ??
        'https://pbs.twimg.com/profile_images/690927346883231744/x1AAbU9__400x400.jpg';
  }
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
        centerTitle: true,
        title: const Text('Photo', style: TextStyle(color: Colors.black)),
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
              style: AppStyles.h3,
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
                      child: UserAvatar(
                          'https://pbs.twimg.com/profile_images/690927346883231744/x1AAbU9__400x400.jpg'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Opacity(
                      opacity: animationUserName(),
                      child: Column(
                        children: <Widget>[
                          Text(widget.name, style: AppStyles.h1Black),
                          Text(
                            '@' + widget.userName,
                            style: AppStyles.h5Black
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
              SizedBox(width: 12),
              _buildButton('Save'),
              SizedBox(width: 12),
              _buildButton('Visit'),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text) {
    return GestureDetector(
      child: Container(
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
      onTap: () {},
    );
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
