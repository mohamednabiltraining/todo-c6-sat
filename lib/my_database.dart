import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_c6_sat/dateUtils.dart';
import 'package:todo_c6_sat/task.dart';

class MyDataBase {
  static CollectionReference<Task> getTasksCollection() {
    return FirebaseFirestore.instance
        .collection(Task.collectionName)
        .withConverter<Task>(fromFirestore: (snapshot, options) {
      return Task.fromFireStore(snapshot.data() ?? {});
    }, toFirestore: (task, options) {
      return task.toFireStore();
    });
  }

  static Future<void> addTask(Task task) {
    var taskDoc = getTasksCollection()
        .doc();
    task.dateTime = dateOnly(task.dateTime!);
    task.id = taskDoc.id;
    return taskDoc.set(task);
  }
  static Future<QuerySnapshot<Task>> getTasks(
      DateTime dateTime)async{
    var collection = getTasksCollection()
    .where('dateTime',isEqualTo: dateOnly(dateTime).millisecondsSinceEpoch);
    return collection.get();
  }
  static  Stream<QuerySnapshot<Task>>listenForTaskUpdates(){
    var collection = getTasksCollection();
    return collection.snapshots();
  }
  static Future<void>deleteTask(Task task){
    var tasksCollection = getTasksCollection();
    var taskRef = tasksCollection.doc(task.id);
    return taskRef.delete();
  }

}
