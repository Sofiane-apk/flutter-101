import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/shared/component/components.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({Key? key}) : super(key: key);
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar() ,
      body: Column(
        children: [
          defaultFormField(
              controller: searchController,
              type: TextInputType.text,
              validator: ( value) {
                if (value!.isEmpty) {
                  return 'search must not be empty ';
                } else {
                  return null;
                }
              },
              label: 'Search',
              prefix: Icons.search)
        ],
      ),
    );
  }
}
