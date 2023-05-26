class GlobleModel {
  String? id;
  String? imgUrl;
  String? title;
  bool followed;
  // About about;
  // Event event;
  // Reviews reviews;
  GlobleModel(this.id, this.imgUrl, this.title, this.followed,);
}

class About {
  String? aboutData;
  About(this.aboutData);
}

class Event {
  String? id;
  String? imgUrl;
  String? date;
  String? title;
  Event(this.id, this.imgUrl, this.date, this.title);
}

class Reviews {
  String? id;
  String? imgUrl;
  String? name;
  String? date;
  int rating;
  String? review;
  Reviews(this.id, this.imgUrl, this.name, this.date, this.rating, this.review);
}
