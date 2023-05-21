import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import '../cubit/cubit.dart';

Widget defaultButton({
  bool isUpperCASE = true,
  double width = double.infinity,
  double radius = 0.0,
  required String text,
  required Function function,
  Color Background = Colors.blueAccent,
}) =>
    Container(
      width: width,
      decoration: BoxDecoration(
          color: Background, borderRadius: BorderRadius.circular(radius)),
      child: MaterialButton(
        onPressed: function(),
        child: Text(
          isUpperCASE ? text.toUpperCase() : text,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
Widget defaultFormField({
  required TextEditingController? controller,
  required TextInputType? type,
  ValueChanged<String>? onFieldSubmitted,
  FormFieldValidator<String>? validator,
  //required VoidCallback onTap,
  required String label,
  required IconData prefix,
  IconData? suffix,
  bool isPassword = false,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: type,
   // onTap: onTap,
    onFieldSubmitted: onFieldSubmitted,
    validator: validator,
    obscureText: isPassword,
    decoration: InputDecoration(
      labelText: label,
      prefixIcon: Icon(prefix),
      suffixIcon: suffix != null ? Icon(suffix) : null,
      border: const OutlineInputBorder(),
    ),
  );
}

Widget buildTaskItem(Map model, context) => Dismissible(
      key: Key(model['id]'].toString()),
      onDismissed: (direction) {
        AppCubit.get(context).DeleteDatabase(id: model['id']);
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(children: [
          CircleAvatar(
            radius: 40.0,
            child: Text('${model['time']}'),
          ),
          SizedBox(width: 20.0),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${model['title']}',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${model['date']}',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
          SizedBox(width: 20.0),
          IconButton(
            icon: Icon(
              Icons.check_circle,
              color: Colors.green,
            ),
            onPressed: () {
              AppCubit.get(context)
                  .updateDatabase(status: 'done', id: model['id']);
            },
          ),
          IconButton(
            icon: Icon(Icons.archive, color: Colors.black45),
            onPressed: () {
              AppCubit.get(context)
                  .updateDatabase(status: 'Archive', id: model['id']);
            },
          ),
        ]),
      ),
    );

//////////////----no task yet please add some tasks
Widget tasksBuilder({required List<Map> tasks}) => ConditionalBuilder(
      condition: tasks.length > 0,
      builder: (context) => ListView.separated(
          itemBuilder: (context, index) => buildTaskItem(tasks[index], context),
          separatorBuilder: (context, index) => myDivider(),
          itemCount: tasks.length),
      fallback: (context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.data_usage,
              size: 100,
              color: Colors.grey,
            ),
            Text(
              'No Tasks Yet, Please Add Some Tasks',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
          ],
        ),
      ),
    );

/////////////----Divider /////////-
Widget myDivider() => Padding(
      padding: EdgeInsetsDirectional.only(start: 20.0),
      child: Container(
        width: double.infinity,
        height: 1,
        color: Colors.grey[300],
      ),
    );

//////////////----builArticleIteme /////////--

Widget builArticleItem(article, context) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage('${article['urlToImage']}'),
                  fit: BoxFit.cover,
                )),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Container(
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text('${article['title']}',
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1),
                  ),
                  Text('${article['publishedAt']}',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );

///////-----ArticleBuilder ------------
Widget articleBuilder(list, context) => ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) =>
              builArticleItem(list[index], context),
          separatorBuilder: (context, index) => myDivider(),
          itemCount: list.length),
      fallback: (context) => Center(child: CircularProgressIndicator()),
    );
///////-----Navigator widget --------
void navigateTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));
