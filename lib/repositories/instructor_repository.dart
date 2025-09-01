import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learning_app/models/user_model.dart';

class InstructorRepository {
  final _firestore = FirebaseFirestore.instance;

  Future<UserModel?> getInstructorById(String instructorId) async {
    try {
      final doc = await _firestore.collection('users').doc(instructorId).get();
      if (doc.exists) {
        return null;
      }
      return UserModel.fromFirestore(doc);
    } catch (e) {
      throw Exception('Failed to fetch instructor: $e');
    }
  }

  Future<Map<String, UserModel>> getInstructorsByIds(
    List<String> instructorIds,
  ) async {
    try {
      if (instructorIds.isEmpty) {
        return {};
      }

      final docs = await _firestore
          .collection('users')
          .where(FieldPath.documentId, whereIn: instructorIds)
          .get();
          
      return { for (var doc in docs.docs) doc.id: UserModel.fromFirestore(doc)};
    } catch (e) {
      throw Exception('Failed to fetch instructors: $e');
    }
  }
}
