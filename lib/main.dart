import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_c6_sat/firebase_options.dart';
import 'package:todo_c6_sat/home/home_screen.dart';
import 'package:todo_c6_sat/my_theme.dart';
import 'package:todo_c6_sat/provider/tasks_provider.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.disableNetwork();
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (buildContext)=>TasksProvider(),
      child: MaterialApp(
        theme: MyTheme.lightTheme,
        routes: {
          HomeScreen.routeName : (buildContext)=> HomeScreen()
        },
        initialRoute: HomeScreen.routeName,
      ),
    );
  }
}