import 'package:cloud_firestore/cloud_firestore.dart';

//instantiate cloud firestore
class FirebaseTodoAPI {
  static final FirebaseFirestore db = FirebaseFirestore.instance;

  //takes a to do object
  Future<String> addTodo(Map<String, dynamic> todo) async {
    try {
      //instance of firestore
      await db.collection("todos").add(todo);

      //
      return "Successfully added todo!";
    } on FirebaseException catch (e) {
      return "Failed with error '${e.code}: ${e.message}";
    }
  }

  //kinukuha lahat ng laman ng todos (continuous maguupdate)
  Stream<QuerySnapshot> getAllTodos() {
    return db.collection("todos").snapshots();
  }

  Future<String> deleteTodo(String? id) async {
    try {
      //kinukuha doc na may id
      await db.collection("todos").doc(id).delete();

      return "Successfully deleted todo!";
    } on FirebaseException catch (e) {
      return "Failed with error '${e.code}: ${e.message}";
    }
  }
}
