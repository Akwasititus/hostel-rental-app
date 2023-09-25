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
    required String agentEmail,

    //room type
     int? oneinaRoom,
     int? twoInaRoom,
     int? threeinaRoom,
     int? fourinaRoom,
     
    
    required Uint8List file,
  }) async {
    String resp = "some error occurred";

    try { 
      if (hostelName.isNotEmpty ||
          hostelLocation.isNotEmpty ||
          hostelDesc.isNotEmpty ||
          agentEmail.isNotEmpty 

          // //room type
          // oneinaRoom != "" ||
          // twoInaRoom != ""  ||
          // threeinaRoom != ""  ||
          // fourinaRoom != ""  


          ) {
        String imageUrl = await uploadImageToStorage('profileImage', file);
        await _firestore.collection('addHostel').add({
          'hostelName': hostelName,
          'hostelLocation': hostelLocation,
          'hostelDesc': hostelDesc,
          'hostelEmail': agentEmail,


          //room types
          'oneinaRoom': oneinaRoom,
          'twoInaRoom': twoInaRoom,
          'threeinaRoom': threeinaRoom,
          'fourinaRoom': fourinaRoom,

          // image URL
          'imageLink': imageUrl,
        });

        resp = 'success';
      }
    } catch (err) {
      resp = err.toString();
      //-----------------------------------------------------------------------
      print('resp $resp');
      //------------------------------------------------------------
    }
    return resp;
  }
}
