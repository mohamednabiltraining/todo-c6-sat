import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_c6_sat/dialoge_utils.dart';
import 'package:todo_c6_sat/my_database.dart';
import 'package:todo_c6_sat/provider/tasks_provider.dart';
import 'package:todo_c6_sat/task.dart';

class AddTaskBottomSheet extends StatefulWidget {

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(24),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Add Task'),
              TextFormField(
                controller: titleController,
                validator: (currentText){
                  if(currentText==null||currentText.trim().isEmpty){
                    return 'please enter title';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
              ),
              TextFormField(
                controller: descController,
                validator: (text){
                  if(text==null||text.isEmpty){
                    return 'please enter details';
                  }
                  return null;
                },
                minLines: 4,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: 'Details',
                ),
              ),
              InkWell(
                onTap: (){
                  showDatePickerDialog();
                },
                child: Container(
                    padding: EdgeInsets.all(12),
                    // how to format datetime in dart -> intl
                    //"yyyy/MM/dd"
                    child: Text('${selectedDate.year}/${selectedDate.month}/${selectedDate.day}',
                    style: Theme.of(context).textTheme.bodyMedium,
                    )),
              ),
              ElevatedButton(
                  style:ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              side: BorderSide(color: Theme.of(context).primaryColor)
                          )
                      )
                  ),
                  onPressed: (){
                    validateForm();
              }, child:Text('Add',style: TextStyle(
                fontSize: 18
              ),) )
            ],
          ),
        ),
      ),
    );
  }
  void validateForm()async{
    var provider = Provider.of<TasksProvider>(context,listen: false);

    if(formKey.currentState?.validate()==true){
      // title, desc,date
      String title = titleController.text;
      String desc = descController.text;
      var newTask = Task(title: title,
          dateTime: selectedDate,
          content: desc,
          isDone: false);

      showLoading(context,'Loading...',isCancelable: false);
      MyDataBase.addTask(newTask)
      .then((value) {
        provider.retrieveTasks();
        hideLoading(context);
        showMessage(context, 'task added successfully',
        posActionName: 'ok',posActionCallBack: (){
          Navigator.pop(context);
            });

//        Navigator.pop(context);
      }).onError((error, stackTrace) {
        hideLoading(context);
        showMessage(context, error.toString());
      }).timeout(Duration(seconds: 3),onTimeout:() {
        hideLoading(context);
        provider.retrieveTasks();
        showMessage(context, 'Error connecting to server,'
            'please try again',posActionName: 'ok');
      },).timeout(Duration(seconds: 5,),onTimeout: (){
        hideLoading(context);
        showMessage(context, 'task added locally',
            posActionName:'ok');
      });
    }
  }
  var titleController = TextEditingController();
  var descController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  void showDatePickerDialog()async{
    DateTime? dateTime = await showDatePicker(context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if(dateTime!=null){
      selectedDate = dateTime;
      setState(() {});
    }
  }
}