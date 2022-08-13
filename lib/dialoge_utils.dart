import 'package:flutter/material.dart';

void showMessage(BuildContext context, String message,
    {String? posActionName,
    VoidCallback? posActionCallBack,
    String? negActionName,
    VoidCallback? negActionCallback}) {
  showDialog(
      context: context,
      builder: (buildContext) {
        List<Widget> actions = [];
        if (posActionName != null) {
          actions.add(TextButton(
              onPressed: () {
                Navigator.pop(buildContext);
                if (posActionCallBack != null) posActionCallBack();
              },
              child: Text(posActionName)));
        }
        if (negActionName != null) {
          actions.add(TextButton(
              onPressed: () {
                Navigator.pop(buildContext);
                if (negActionCallback != null) negActionCallback();
              },
              child: Text(negActionName)));
        }
        return AlertDialog(
          actions: actions,
          content: Container(
            padding: EdgeInsets.all(12),
            child: Text(
              '$message',
              style: Theme.of(buildContext).textTheme.bodySmall,
            ),
          ),
        );
      });
}

void showLoading(BuildContext context,String message,
    {bool isCancelable = true}){
  showDialog(context: context, builder: (builder){
    return AlertDialog(
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircularProgressIndicator(),
            SizedBox(width: 12,),
            Text(message)
          ],
        ),
      ),
    );
  },barrierDismissible: isCancelable);

}

void hideLoading(BuildContext context){
  Navigator.pop(context);
}