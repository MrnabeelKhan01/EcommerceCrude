import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/comments.dart';

class CommentsServices {
  Future<void> addComments(CommentsModel commentsModel) async {
    DocumentReference df =
        FirebaseFirestore.instance.collection("commentsCollection").doc();
    return await df.set(commentsModel.toJson(df.id));
  }
}
