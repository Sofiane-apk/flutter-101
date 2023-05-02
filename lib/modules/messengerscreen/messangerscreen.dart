import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {
  //const MessengerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 20.0,
        title: Row(
          children: const [
            CircleAvatar(
                radius: 20.0,
                backgroundImage: NetworkImage(
                    'https://e7.pngegg.com/pngimages/416/62/png-clipart-anonymous-person-login-google-account-computer-icons-user-activity-miscellaneous-computer-thumbnail.png')),
            SizedBox(
              width: 10,
            ),
            Text(
              'Chats',
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const CircleAvatar(
              child: Icon(
                Icons.edit,
                size: 20,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const CircleAvatar(
              child: Icon(
                Icons.camera_alt,
                size: 20.0,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black26),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const [
                    Icon(
                      Icons.search,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'search',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),

            //////////////////////////-- Story Item---///////////
            Container(
              height: 110,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) => builStoryItem()),
                  separatorBuilder: (context, idex) => SizedBox(
                        width: 10,
                      ),
                  itemCount: 20),
            ),

            ///////////////////////-----chatItem -------///////

            ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: ((context, index) => builChatItem()),
                separatorBuilder: (context, idex) => SizedBox(
                      height: 10,
                    ),
                itemCount: 20),
          ]),
        ),
      ),
    );
  }

  Widget builChatItem() => Row(
        children: [
          Stack(alignment: AlignmentDirectional.bottomEnd, children: [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(
                  'https://e7.pngegg.com/pngimages/416/62/png-clipart-anonymous-person-login-google-account-computer-icons-user-activity-miscellaneous-computer-thumbnail.png'),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 3.0, end: 3.0),
              child: CircleAvatar(
                radius: 7.0,
                backgroundColor: Colors.green,
              ),
            ),
          ]),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Maaradji Abdelbasset',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 10),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        width: 5.0,
                        height: 5.0,
                        decoration: BoxDecoration(
                            color: Colors.blue, shape: BoxShape.circle),
                      ),
                    ),
                    Text('2:00 PM'),
                  ],
                ),
              ],
            ),
          )
        ],
      );
  Widget builStoryItem() => Container(
        width: 60,
        child: Column(
          children: [
            Stack(alignment: AlignmentDirectional.bottomEnd, children: [
              CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage(
                    'https://e7.pngegg.com/pngimages/416/62/png-clipart-anonymous-person-login-google-account-computer-icons-user-activity-miscellaneous-computer-thumbnail.png'),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.only(bottom: 3.0, end: 3.0),
                child: CircleAvatar(
                  radius: 7.0,
                  backgroundColor: Colors.green,
                ),
              ),
            ]),
            SizedBox(
              height: 10,
            ),
            Text(
              'Sofiane Maaradji ',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      );
}
