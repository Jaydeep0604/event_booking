class NotificationModel {
  String? id;
  String? img;
  String? followerName;
  bool invite;
  String? inviteFrom;
  bool follow;
  bool like;
  String? joinEvent;
  String? timing;
  NotificationModel(this.id, this.img, this.followerName, this.invite,this.inviteFrom,
      this.follow, this.like, this.joinEvent, this.timing);
}
