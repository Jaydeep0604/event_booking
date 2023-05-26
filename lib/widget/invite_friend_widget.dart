import 'package:event_booking/model/invite_friend_model.dart';
import 'package:flutter/material.dart';

class InviteFriendWidget extends StatelessWidget {
  InviteFriendWidget({Key? key, required this.inviteFriendModel})
      : super(key: key);
  InviteFriendModel inviteFriendModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: <Widget>[
            Align(
                alignment: Alignment.topLeft,
                child: Container(
                    height: 45,
                    width: 45,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset('${inviteFriendModel.img}',fit: BoxFit.fill,)))),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 0),
                  width: 225,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Text(
                      '${inviteFriendModel.name}',
                      style: TextStyle(fontSize: 17.0, color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width: 225,
                  child: Text(
                    '${inviteFriendModel.followers}',
                    style: TextStyle(fontSize: 17.0, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
