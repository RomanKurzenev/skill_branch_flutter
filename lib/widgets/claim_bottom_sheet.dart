import 'package:FlutterGalleryApp/res/res.dart';
import 'package:flutter/material.dart';

class ClaimBottomSheet extends StatelessWidget {
  final List<String> claim = [
    'adult',
    'harm',
    'bully',
    'spam',
    'copyright',
    'hate'
  ];
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(
          Icons.more_vert,
          color: Colors.grey,
        ),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: claim
                        .map((element) => InkWell(
                              child: Container(
                                height: 50,
                                child: Center(
                                  child: Text(
                                    element.toUpperCase(),
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                  ),
                                ),
                              ),
                              onTap: () => Navigator.pop(context),
                              splashColor: AppColors.dodgerBlue,
                            ))
                        .toList());
              });
        });
  }
}
