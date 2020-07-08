import 'package:bakar/classes/bakar_video.dart';
import 'package:bakar/classes/tiktok.dart';
import 'package:bakar/widget/leftItems.dart';
import 'package:bakar/widget/rightItems.dart';
import 'package:bakar/widget/videoPlayer.dart';
import 'package:flutter/material.dart';

class TikTokVideo extends StatelessWidget {
  final BakarVideo data;

  const TikTokVideo({@required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          TikTokVideoPlayer(url: data.videoUrl),
          title(),
          RightItems(
            comments: "",
            userImg: data.thum,
            favorite: 10,
            coverImg: data.thum,
          ),
          LeftItems(
            description: data.description,
            musicName: "My music",
            authorName: "Rishi",
            userName: "Rishi",
          )
        ],
      ),
    );
  }

  Widget title() => Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 28.0),
          child: Text(
            "Trending | For You",
            style: TextStyle(color: Colors.white, fontSize: 19.0),
          ),
        ),
      );
}
