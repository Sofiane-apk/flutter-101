import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/modules/done_tasks/done_task_screen.dart';
import 'package:flutter_application_1/modules/new_tasks/new_task_screen.dart';
import 'package:flutter_application_1/shared/component/components.dart';
import 'package:flutter_application_1/shared/component/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

import '../../modules/archived_tasks/archived_task_screen.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class HomeLayout extends StatefulWidget {
  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

// 1.creeate database
// 2. create table
// 3. open database
// 4. insert to database
// 5. get from database
// 6. update in database
// 7. delete from database

class _HomeLayoutState extends State<HomeLayout> {
  //const HomeLayout({Key? key}) : super(key: key);

  var scaffoldkKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

 
  // void initState() {
  //   // TODO: implement initState
  //   // super.initState();
  //  // createDatabase();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AppCubit()..createDatabase(),
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (BuildContext context, AppStates State) {
            if(State is AppInsertDatabaseState){
              Navigator.pop(context);
            }
          },
          builder: (BuildContext context, AppStates State) {
            AppCubit cubit = AppCubit.get(context);
            return Scaffold(
              key: scaffoldkKey,
              appBar: AppBar(
                title: Text(cubit.titles[cubit.currentIndex]),
              ),
              body: cubit.newTasks.length == 0
                  ? Center(child: cubit.screens[cubit.currentIndex])
                  : cubit.screens[cubit.currentIndex],
              floatingActionButton: FloatingActionButton(
                  child: Icon( cubit.fabIcon),
                  onPressed: () {
                    if (cubit.isBottomSheetShow) {
                      if (formKey.currentState!.validate()) {
                        cubit.insertToDatabase(title:titleController.text,date:dateController.text,time:timeController.text );
                        //   insertToDatabase(
                        //         title: titleController.text,
                        //         date: dateController.text,
                        //         time: timeController.text)
                        //     .then((value) => null);

                   //     Navigator.pop(context);

                        // setState(() {
                        //isBottomSheetShow = false;
                        //   fabIcon = Icons.edit;
                        //tasks =value ;
                        // print('tasks $tasks');
                        // });
                      }
                    } else {
                      scaffoldkKey.currentState
                          ?.showBottomSheet((context) {
                            return Container(
                                color: Colors.grey[100],
                                padding: const EdgeInsets.all(20.0),
                                child: Form(
                                    key: formKey,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ///////////////---------Form field tASK---------///////////////

                                        defaultFormField(
                                            // onTap: () {
                                            //   print("task");
                                            // },
                                            controller: titleController,
                                            type: TextInputType.text,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'title must not be empty';
                                              }
                                              return null;
                                            },
                                            label: 'Task Title',
                                            prefix: Icons.title),
                                        const SizedBox(
                                          height: 15,
                                        ),

                                        ///////////////---------Form field time---------///////////////
                                        defaultFormField(
                                            // onTap: () {
                                            //   showTimePicker(
                                            //           context: context,
                                            //           initialTime:
                                            //               TimeOfDay.now())
                                            //       .then((value) {
                                            //     timeController.text = value!
                                            //         .format(context)
                                            //         .toString();
                                            //   });
                                            // },
                                            controller: timeController,
                                            type: TextInputType.datetime,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'time must not be empty';
                                              }
                                              return null;
                                            },
                                            label: 'Task time',
                                            prefix: Icons.watch_later_outlined),

                                        SizedBox(
                                          height: 15,
                                        ),
                                        ///////////////---------Form field  date---------///////////////
                                        defaultFormField(
                                            // onTap: () {
                                            //   showDatePicker(
                                            //     context: context,
                                            //     initialDate: DateTime.now(),
                                            //     firstDate: DateTime.now(),
                                            //     lastDate: DateTime.parse(
                                            //         '2024-05-03'),
                                            //   ).then((value) {
                                            //     dateController.text =
                                            //         DateFormat.yMMMd()
                                            //             .format(value!);
                                            //   });
                                            // },
                                            controller: dateController,
                                            type: TextInputType.datetime,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'date must not be empty';
                                              }
                                              return null;
                                            },
                                            label: 'Task date',
                                            prefix: Icons.date_range),
                                      ],
                                    )));
                          })
                          .closed
                          .then((value) {
                            cubit.ButtomChangeState(
                                icon: Icons.edit, isShow: false);
                            // setState(() {
                            //   fabIcon = Icons.edit;
                            // });
                          });
                    cubit.ButtomChangeState(icon:Icons.add , isShow:true);
                      // setState(() {
                      //   fabIcon = Icons.add;
                      // });
                    }
                  }),
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: cubit.currentIndex,
                onTap: (index) {
                  cubit.changeIndex(index);
                  // setState(() {
                  //   currentIndex = index;
                  // });
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.menu),
                    label: 'Tasks',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.check_circle_outline),
                    label: 'Done',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.archive_outlined),
                    label: 'Archived',
                  ),
                ],
              ),
            );
          },
        ));
  }
}
