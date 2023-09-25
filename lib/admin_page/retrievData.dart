import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HostelBookingResult extends StatefulWidget {
  @override
  _HostelBookingResultState createState() => _HostelBookingResultState();
}

class _HostelBookingResultState extends State<HostelBookingResult> {
  void deleteItem(String documentId) {
  FirebaseFirestore.instance
      .collection('hostelBookings')
      .doc(documentId) // Use the document ID to specify the document to delete
      .delete()
      .then((_) {
    // Item successfully deleted from Firestore
    // You can also update the UI to reflect the deletion if needed
    setState(() {
      // Update your local data (if it's stored in a state variable)
    });
  }).catchError((error) {
    // Handle any errors that occur during the deletion process
    print('Error deleting item: $error');
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hostel Booking Results'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('hostelBookings').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Loading indicator while data is being fetched
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No hostel bookings available.'));
          }
          return ListView(
            reverse: true,
            children: snapshot.data!.docs.map((document) {
              final data = document.data() as Map<String, dynamic>;
              return Card(
                child: ListTile(
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    // Implement the delete action here
                    deleteItem(document.id); // Pass the document ID or any unique identifier
                  },
                ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('USERS SELECTIONS',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'Ubuntu-Regular',
                          letterSpacing: 2,
                        )),
                      SizedBox(height: 15),
                      Text('Hostel Name: ${data['hostelName']}'),
                      SizedBox(height: 5),
                      Text('hostel Amount: ${data['hostelAmount']}'),
                      SizedBox(height: 5),
                      Text('Room Type: ${data['personsInRoom']}'),
                      SizedBox(height: 5),
                      Text('agent Email: ${data['agentEmail']}'),
                      SizedBox(height: 20),
              
                      Text('USER DETAILS',style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'Ubuntu-Regular',
                          
                          letterSpacing: 2,
                        )),
                      SizedBox(height: 5),
                      Text('Name: ${data['name']}'),
                      SizedBox(height: 5),
                      Text('Address: ${data['address']}'),
                      SizedBox(height: 5),
                      Text('Contact: ${data['contact']}'),
                      SizedBox(height: 5),
                      Text('Comment: ${data['comment']}'),
                      SizedBox(height: 5),
                      Divider(),
              
                    ],
                  ),
                 
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
