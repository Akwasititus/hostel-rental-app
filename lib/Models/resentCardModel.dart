import 'package:flutter/material.dart';

class ResentHostels {
  final String imgURL;
  final String hostelName;
  final String hostelLocation;
  final String roomInfo;

  ResentHostels({
    required this.imgURL,
    required this.hostelLocation,
    required this.hostelName,
    required this.roomInfo,
});
}

List<ResentHostels> getResentHostels = [
  ResentHostels(
    imgURL: 'assets/images/hostel1.jpg',
     hostelLocation: 'Opposite Fiapre Market', 
     hostelName: 'Apartement kelapa Gading', 
     roomInfo: '3 rooms Available'
     ),
     ResentHostels(
    imgURL: 'assets/images/hostel1.jpg',
     hostelLocation: 'Opposite Fiapre Market', 
     hostelName: 'Apartement kelapa Gading', 
     roomInfo: 'No Rooms Available'
     ),
     ResentHostels(
    imgURL: 'assets/images/hostel1.jpg',
     hostelLocation: 'Opposite Fiapre Market', 
     hostelName: 'Apartement kelapa Gading', 
     roomInfo: '3 rooms Available'
     ),
     ResentHostels(
    imgURL: 'assets/images/hostel1.jpg',
     hostelLocation: 'Opposite Fiapre Market', 
     hostelName: 'Apartement kelapa Gading', 
     roomInfo: '3 rooms Available'
     ),
     ResentHostels(
    imgURL: 'assets/images/hostel1.jpg',
     hostelLocation: 'Opposite Fiapre Market', 
     hostelName: 'Apartement kelapa Gading', 
     roomInfo: '3 rooms Available'
     ),
];