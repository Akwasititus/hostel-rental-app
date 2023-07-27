import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class StoreData {
  Future<String> uploadImageToStorage(String fileName, Uint8List file) async {
    String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    String uniqueFileName = '${fileName}_$timestamp';

    Reference ref = _storage.ref().child(uniqueFileName);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadURL = await snapshot.ref.getDownloadURL();

    return downloadURL;
  }

  Future<String> saveData({
    required String hostelName,
    required String hostelLocation,
    required String hostelDesc,
    required String hostelEmail,
    //required String numberOfRoomAvailable,
    required Uint8List file,
  }) async {
    String resp = "some error occurred";

    try {
      if (hostelName.isNotEmpty ||
          hostelLocation.isNotEmpty ||
         // numberOfRoomAvailable.isNotEmpty ||
          hostelDesc.isNotEmpty ||
          hostelEmail.isNotEmpty 
          ) {
        String imageUrl = await uploadImageToStorage('profileImage', file);
        await _firestore.collection('addHostel').add({
          'hostelName': hostelName,
          'hostelLocation': hostelLocation,
          'hostelDesc': hostelDesc,
          'hostelEmail': hostelEmail,
          //'numberOfRoomAvailable': numberOfRoomAvailable,
          'imageLink': imageUrl,
        });

        resp = 'success';
      }
    } catch (err) {
      resp = err.toString();
    }
    return resp;
  }
}
