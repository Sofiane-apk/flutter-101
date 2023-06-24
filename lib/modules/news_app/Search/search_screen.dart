import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/layout/news_app/cubit/states.dart';
import 'package:flutter_application_1/shared/component/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/news_app/cubit/cubit.dart';


class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                    controller: searchController,
                    type: TextInputType.text,
                    onTap: (value)=>NewsCubit.get(context).getSearch(value),
                    
                    
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'search must not be empty ';
                      } else {
                        return null;
                      }
                    },
                    label: 'Search',
                    prefix: Icons.search),
              ),
              Expanded(child: articleBuilder(list, context, isSearch:true)),
            ],
          ),
        );
      },
    );
  }
}
