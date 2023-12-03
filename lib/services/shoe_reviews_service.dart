import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pa_ekin/models/reviews_models.dart';

class ShoeReviewsService {
  Future<void> addReviewToFirebase(String shoeID, Reviews review, String userEmail) async {
    try {
      CollectionReference shoeReviewsCollection = FirebaseFirestore.instance.collection("shoes");
      
      DocumentReference shoeDocument = shoeReviewsCollection.doc(shoeID);
    
      CollectionReference reviewsCollection = shoeDocument.collection("reviews");
    
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

  Future<void> deleteReviewFromFirebase(String shoeID, Reviews review, String userEmail) async {
    try {
      CollectionReference shoeReviewsCollection = FirebaseFirestore.instance.collection("shoes");
      
      DocumentReference shoeDocument = shoeReviewsCollection.doc(shoeID);
    
      CollectionReference reviewsCollection = shoeDocument.collection("reviews");
    
      DocumentReference userReviewDocument = reviewsCollection.doc(userEmail);

      Map<String, dynamic> reviewMap = {
        'Username': review.username,
        'Review': review.reviews,
      };

      await userReviewDocument.delete();
    } catch (error) {
      print("Error delete review to Firebase: $error");
    }
  }
}
