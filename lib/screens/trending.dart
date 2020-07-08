import 'dart:convert';

import 'package:bakar/classes/bakar_video.dart';
import 'package:bakar/classes/tiktok.dart';
import 'package:bakar/config/api.dart';
import 'package:bakar/screens/tiktokvideo.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:http/http.dart' as http;


class Trending extends StatefulWidget {
  @override
  _TrendingState createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  PageController pageController;
  RequestController api = RequestController();
  List<Widget> tikTokVideos = [];

  getTrending() async {
//    var cookies = await api.getCookie();
//    api.setCookie(cookies);
    try {
      var response = await http.post(
        api.url,
        headers: api.headers,
        body: jsonEncode(<String, String>{
         'fb_id': "105314401473625586300",
         'token': "cY05-qEiD7Y:APA91bHkVQxbco-O_M2-dhgqRkNftNtKbpMGGwIdDNp3oLlFaBKAWlA1bmujdW22YnMTVKXHOkm5CeedGagLqM64-cTbvPX9UaJe0uFQBExMc8IaOx2SaPXz-sjnA4ckTuavPsSJ7GLZ",
      }),
      );
      Map<String, dynamic>  body = jsonDecode(response.body);
      List<dynamic>  msg = body['msg'];
      List<BakarVideo> bakarVideos = List();
      msg.forEach((videoMap) {
        BakarVideo bakarVideo = BakarVideo.fromJson(videoMap);
        tikTokVideos.add(TikTokVideo(data: bakarVideo));
      });
    } catch (ex) {
      print(ex);
    }
  }

  @override
  void initState() {
    super.initState();
    getTrending();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      controller: pageController,
      children: tikTokVideos.length == 0
          ? <Widget>[
              Container(
                color: Colors.black,
                child: Center(
                  child: GFLoader(
                    type: GFLoaderType.circle,
                    loaderColorOne: Colors.blueAccent,
                    loaderColorTwo: Colors.black,
                    loaderColorThree: Colors.pink,
                  ),
                ),
              )
            ]
          : tikTokVideos,
    );
  }
}
