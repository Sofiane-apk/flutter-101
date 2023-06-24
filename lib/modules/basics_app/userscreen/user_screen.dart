import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class UserModel {
final   int id;
final String name;
final String phone;
  UserModel({
    required this.id,
    required this.name,
    required this.phone,
  });

  
}


class UserScreen extends StatelessWidget {
   //UserScreen({super.key});

List<UserModel>user=[
UserModel(id: 1, name: 'Sofiane', phone: '+213669936890'),
UserModel(id: 2, name: 'Sid ahme', phone: '+213669789890'),
UserModel(id: 3, name: 'abdelhalim', phone: '+213668936890'),
UserModel(id: 4, name: 'abdellah', phone: '+2136689368790'),
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => buildContact(user[index]),
          separatorBuilder: (context, index) => Padding(
            padding: const EdgeInsetsDirectional.only(start: 20),
            child: Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.grey[300],
                ),
          ),
          itemCount: user.length),
    );
  }

  /// 1.build item
  /// 2.build list
  /// 3.add list to list
  ///
  Widget buildContact(UserModel user) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              child: Text(
                '${user.id}',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${user.name}',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${user.phone}',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            )
          ],
        ),
      );
}
