import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learning_app/models/review.dart';

class ReviewRepository {
  final _firestore = FirebaseFirestore.instance;
  Future<List<Review>> getCourseReviews(String courseId) async {
    try {
      final courseDoc =
          await _firestore.collection('courses').doc(courseId).get();
      if (!courseDoc.exists) {
        return [];
      }

      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await _firestore
              .collection('reviews')
              .where('courseId', isEqualTo: courseId)
              .get();

      final reviews =
          snapshot.docs.map((doc) {
            final data = doc.data();

            final reviewData = {...data, 'id': doc.id};
            return Review.fromJson(reviewData);
          }).toList();
      return reviews;
    } catch (e) {
      return [];
    }
  }

  Future<void> addReview(Review review) async {
    try {
      final docRef = _firestore.collection('reviews').doc();

      final reviewWithId = Review(
        id: docRef.id,
        courseId: review.courseId,
        userId: review.userId,
        userName: review.userName,
        rating: review.rating,
        comment: review.comment,
        createdAt: review.createdAt,
      );

      final reviewData = reviewWithId.toJson();

      final dataToSave = Map<String, dynamic>.from(reviewData)..remove('id');
      await docRef.set(dataToSave);

      await _updateCourseRating(review.courseId);
    } catch (e) {
      throw Exception('Failed to add review: $e');
    }
  }

  Future<void> _updateCourseRating(String courseId) async {
    try {
      final reviews = await getCourseReviews(courseId);
      if (reviews.isEmpty) {
        await _firestore.collection('courses').doc(courseId).update({
          'averageRating': 0.0,
          'reviewCount': 0,
        });
      }

      double totalRating = 0;
      for (var review in reviews) {
        totalRating += review.rating;
      }
      final averageRating = totalRating / reviews.length;

      await _firestore.collection('courses').doc(courseId).update({
        'averageRating': averageRating,
        'reviewCount': reviews.length,
      });
    } catch (e) {}
  }

  Future<void> updateReview(Review review) async {
    try {
      final reviewData = review.toJson();

      final dataToUpdate = Map<String, dynamic>.from(reviewData)..remove('id');
      await _firestore
          .collection('reviews')
          .doc(review.id)
          .update(dataToUpdate);

      await _updateCourseRating(review.courseId);
    } catch (e) {
      throw Exception('Failed to update review: $e');
    }
  }

  Future<void> deleteReview(String reviewId) async {
    try {
      final reviewDoc =
          await _firestore.collection('reviews').doc(reviewId).get();
      final courseId = reviewDoc.data()?['courseId'] as String?;

      await _firestore.collection('reviews').doc(reviewId).delete();
      if (courseId != null) {
        await _updateCourseRating(courseId);
      }
    } catch (e) {
      throw Exception('Failed to delete review: $e');
    }
  }
}
