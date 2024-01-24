import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final String photoUrl;
  final String userName;
  final String userEmail;
  final String phoneNumber;

  UserCard({
    required this.photoUrl,
    required this.userName,
    required this.userEmail,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: buildUserCardContent(),
      ),
    );
  }

  Widget buildUserCardContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildUserPhoto(),
        SizedBox(width: 16.0),
        buildUserInfo(),
      ],
    );
  }

  Widget buildUserPhoto() {
    return Container(
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 2, color: Colors.grey),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(photoUrl),
        ),
      ),
    );
  }

  Widget buildUserInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildUserName(),
          SizedBox(height: 4.0),
          Text(userEmail),
          Text(phoneNumber),
        ],
      ),
    );
  }

  Widget buildUserName() {
    return Text(
      userName,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
    );
  }
}
