import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_c6_sat/home/tasks_list/task_widget.dart';
class TasksListTab extends StatefulWidget {

  @override
  State<TasksListTab> createState() => _TasksListTabState();
}

class _TasksListTabState extends State<TasksListTab> {
  DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CalendarTimeline(
            showYears: false,
            initialDate: _selectedDate,
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365 )),
            onDateSelected: (date) => setState(() => _selectedDate = date!),
            leftMargin: 20,
            monthColor: Colors.black,
            dayColor: Colors.black,
            dayNameColor: Theme.of(context).primaryColor,
            activeDayColor: Theme.of(context).primaryColor,
            activeBackgroundDayColor: Colors.white,
            dotsColor: Color(0xFF333A47),
            selectableDayPredicate: (date) => date.day != 23,
            locale: 'en',
          ),
          Expanded(child: ListView.separated(itemBuilder: (buildContext,indext){
            return TaskWidget();
          },itemCount: 20,
          separatorBuilder: (_,__)=>SizedBox(height: 8,),
          ))
        ],
      ),
    );
  }
}
