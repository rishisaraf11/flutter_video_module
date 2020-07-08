class BakarVideo {
  String id;
  String fb_id;
  String liked;
  String videoUrl;
  String thum;
  String gif;
  String description;

  BakarVideo(this.id, this.fb_id, this.liked, this.videoUrl, this.thum,
      this.gif, this.description);

  BakarVideo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fb_id = json['fb_id'];
    liked = json['liked'];
    videoUrl = json['video'];
    thum = json['thum'];
    thum = json['gif'];
    description = json['description'];
  }
}
