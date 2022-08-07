import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion: DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (buildContext){

            },
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft:Radius.circular(12)
            ),
            spacing: 12,
          )
        ],
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 24),
        margin: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              height: 80,
              width: 4,
              margin: EdgeInsets.only(right: 24),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('this is Title',style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.start,
                  ),
                  SizedBox(height:8,),
                  Row(
                    children: [
                      Icon(Icons.access_time),
                      Text('12:30 Am',style: Theme.of(context).textTheme.bodySmall,)
                    ],
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.symmetric(vertical: 8,horizontal: 24),
              child: Image.asset('assets/images/ic_check.png'),
            )
          ],
        ),
      ),
    );
  }
}
