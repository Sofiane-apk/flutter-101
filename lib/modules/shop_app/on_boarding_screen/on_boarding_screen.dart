import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/shared/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../shared/component/components.dart';
import '../login/shop_login_screen.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;
  BoardingModel({
    required this.title,
    required this.image,
    required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
        title: 'On board 1 Title',
        image: 'assets/img/OnBoarding.png',
        body: 'On board 1 Body'),
    BoardingModel(
        title: 'On board 2 Title',
        image: 'assets/img/OnBoarding.png',
        body: 'On board 2 Body'),
    BoardingModel(
        title: 'On board 3 Title',
        image: 'assets/img/OnBoarding.png',
        body: 'On board 3 Body'),
  ];

  bool isLast = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        defaultTextButton(
            onPressed: () {
              navigateToFinish(context, ShopLoginScreen());
            },
            text: 'Skip'),
      ]),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: boardController,
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                SmoothPageIndicator(
                    controller: boardController,
                    count: boarding.length,
                    effect: const ExpandingDotsEffect(
                        activeDotColor: defaultColor,
                        dotColor: Colors.grey,
                        dotWidth: 10,
                        dotHeight: 10,
                        spacing: 5.0)),
                const Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast) {
                      navigateToFinish(context, ShopLoginScreen());
                    }
                    boardController.nextPage(
                      duration: const Duration(milliseconds: 750),
                      curve: Curves.fastLinearToSlowEaseIn,
                    );
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image(
              image: AssetImage('${model.image}'),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text('${model.title}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              )),
          SizedBox(
            height: 30,
          ),
          Text('${model.body}',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              )),
        ],
      );
}
