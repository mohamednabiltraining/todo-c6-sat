import 'package:cloud_firestore/cloud_firestore.dart';
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
    task.id = taskDoc.id;
    return taskDoc.set(task);
  }
  static Future<List<Task>> getTasks()async{
    var querySnapShot = await getTasksCollection()
        .get();
    return querySnapShot.docs.map((docSnapshot) => docSnapshot.data()).toList();
  }
}
