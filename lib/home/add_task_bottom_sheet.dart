import 'package:flutter/material.dart';

class AddTaskBottomSheet extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Add Task'),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextFormField(
              minLines: 4,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Details',
              ),
            ),
            Container(
                padding: EdgeInsets.all(12),
                child: Text('Date/Time',
                style: Theme.of(context).textTheme.bodyMedium,
                )),
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

            }, child:Text('Add',style: TextStyle(
              fontSize: 18
            ),) )
          ],
        ),
      ),
    );
  }
}