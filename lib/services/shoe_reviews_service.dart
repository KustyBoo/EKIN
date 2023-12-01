import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pa_ekin/models/reviews_models.dart';

class ShoeReviewsService {
  Future<void> addReviewToFirebase(String shoeUid, Reviews review, String userEmail) async {
    try {
      CollectionReference shoeReviewsCollection = FirebaseFirestore.instance.collection("Shoe_Reviews");
      DocumentReference shoeDocument = shoeReviewsCollection.doc(shoeUid);
      CollectionReference reviewsCollection = shoeDocument.collection("Review");
      DocumentReference userReviewDocument = reviewsCollection.doc(userEmail);

      Map<String, dynamic> reviewMap = {
        'Username': review.username,
        'Review': review.reviews,
      };

      await userReviewDocument.set(reviewMap);
    } catch (error) {
      print("Error adding review to Firebase: $error");
    }
  }
}
