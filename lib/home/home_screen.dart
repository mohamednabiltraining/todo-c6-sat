import 'package:flutter/material.dart';
import 'package:todo_c6_sat/home/add_task_bottom_sheet.dart';
import 'package:todo_c6_sat/home/settings/settings_tab.dart';
import 'package:todo_c6_sat/home/tasks_list/tasks_list.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: StadiumBorder(
            side: BorderSide(
                color: Colors.white, width: 4)),
        onPressed: (){
          showAddTaskBottomSheet();
        },
        child: Icon(
          Icons.add
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index){
            selectedIndex = index;
            setState(() {

            });
          },
          showUnselectedLabels: false,
          showSelectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: ''
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: ''
            ),
          ],
        ),
      ),
      body: tabs[selectedIndex],
    );
  }

  List<Widget>tabs = [TasksListTab(),SettingsTab()];

  void showAddTaskBottomSheet(){
    showModalBottomSheet(context: context, builder: (buildContext){
      return AddTaskBottomSheet();
    });
  }
}
