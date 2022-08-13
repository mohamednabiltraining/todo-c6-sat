import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_c6_sat/home/tasks_list/task_widget.dart';
import 'package:todo_c6_sat/my_database.dart';
import 'package:todo_c6_sat/task.dart';
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
          Expanded(child:
              FutureBuilder<List<Task>>(
                future: MyDataBase.getTasks(),
                builder:(buildContext,snapshot){
                  if(snapshot.hasError){
                    return Text(snapshot.error.toString());
                    // show Try again
                  }else if(snapshot.connectionState ==ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator());
                  }
                  var data= snapshot.data;
                 return  ListView.separated(itemBuilder: (buildContext,index){
                    return TaskWidget(data!.elementAt(index));
                  },itemCount:(data?.length) ??0 ,
                    separatorBuilder: (_,__)=>SizedBox(height: 8,),
                  );
                } ,
              )
          )
        ],
      ),
    );
  }
}
