//import 'package:bloc/bloc.dart';

//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import '../../layout/news_app/cubit/states.dart';
import '../../modules/archived_tasks/archived_task_screen.dart';
import '../../modules/done_tasks/done_task_screen.dart';
import '../../modules/new_tasks/new_task_screen.dart';
import '../Network/Locale/cach_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen()
  ];
  List<String> titles = [
    'NewTasks',
    'DoneTasks',
    'ArchivedTasks',
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChageBottomNavBarState());
  }

////////----Create database  = create table----////////

  late Database database;

  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archiveTasks = [];
  void createDatabase() {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        database
            .execute(
          'CREATE TABLE TASKS (id INTEGER PRIMARY KEY ,title TEXT,date TEXT,time TEXT,status TEXT)',
        )
            .then((value) {
          print('table created');
        }).onError((error, stackTrace) {
          print('خطأ ${error.toString()}');
        });
      },
      onOpen: (database) {
        getDataFromDatabase(database);
        // setState(() async{
        //   tasks = await db.rawQuery('SELECT * FROM TASKS');
        // print(tasks);
        print('open database');
        // });
      },
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }

  ////////----insert into  database ----////////
  insertToDatabase({
    required String title,
    required String time,
    required String date,
  }) async {
    try {
      await database.transaction((txn) {
        txn.rawInsert(
          'INSERT INTO tasks(title,time,date,status) VALUES(?,?,?,?)',
          // pass the argument values as a list to prevent SQL injection attacks
          [title, time, date, 'new'],
        ).then((value) async {
          // use 'async' here to 'await'
          await getDataFromDatabase(database); // await the data to update it
          emit(AppInsertDatabaseState());
          print('$value inserted successfully');
        }).catchError((error) {
          print('error when inserting new record $error');
        });
        return Future.value(null); // use 'null' instead of 'null' string
      });
    } catch (error) {
      print('error when inserting new record $error');
    }
  }

// pass the type of the database as an argument
  Future<void> getDataFromDatabase(Database database) async {
    newTasks = [];
    doneTasks = [];
    archiveTasks = [];
    final List<Map<String, dynamic>> value = await database.rawQuery(
      'SELECT * FROM tasks',
    );
    // reset the list to ensure there's no conflicting data

    value.forEach(
      (element) {
        if (element['status'] == 'new') {
          newTasks.add(element);
        } else if (element['status'] == 'done') {
          doneTasks.add(element);
        } else {
          archiveTasks.add(element);
        }
        print(element['status']);
      },
    );
    emit(AppGetDatabaseState());
  }

  void updateDatabase({required String status, required int id}) {
    database.rawUpdate('UPDATE tasks SET status = ? WHERE id = ?',
        ['$status', id]).then((value) {
      getDataFromDatabase(database);
      emit(AppUpdateDatabaseState());
    });
  }

  void DeleteDatabase({required int id}) {
    database.rawDelete('Delete FROM tasks WHERE id = ?', [id]).then((value) {
      getDataFromDatabase(database);
      emit(AppDeleteDatabaseState());
    });
  }

  bool isBottomSheetShow = false;
  IconData fabIcon = Icons.edit;
  void ButtomChangeState({required IconData icon, required bool isShow}) {
    isBottomSheetShow = isShow;
    fabIcon = icon;
    emit(AppButtomChangeState());
  }

  bool isDark = false;
  ThemeMode appMode = ThemeMode.dark;
  void changeAppMode({ fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
    } else {
      isDark = !isDark;
    }
    CashHelper.putBoolean(key: 'isDark', value: isDark)
        .then((value) => emit(AppChangeModeState()));
  }
}
