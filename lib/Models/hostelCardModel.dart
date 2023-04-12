import 'package:flutter/material.dart';

class PopularHostles{
final String hostelImage;
final String hostelName;
final String hostleInfo;

PopularHostles({
required this.hostelImage,
required this.hostelName,
required this.hostleInfo,});
}

List<PopularHostles> getPopularHostles = [
  PopularHostles(
    hostelImage: 'assets/images/hostel1.jpg', 
    hostelName: 'GetFund Hostel', 
    hostleInfo: 'Loc: Fiapre',
    ),
    PopularHostles(
    hostelImage: 'assets/images/hostel3.jpg', 
    hostelName: 'GetFund Hoste3', 
    hostleInfo: 'Loc: Fiapre',
    ),
    PopularHostles(
    hostelImage: 'assets/images/hostel1.jpg', 
    hostelName: 'GetFund Hostel', 
    hostleInfo: 'Loc: Fiapre',
    ),
    PopularHostles(
    hostelImage: 'assets/images/hostel3.jpg', 
    hostelName: 'GetFund Hostel', 
    hostleInfo: 'Loc: Fiapre',
    ),
    PopularHostles(
    hostelImage: 'assets/images/hostel1.jpg', 
    hostelName: 'GetFund Hostel', 
    hostleInfo: 'Loc: Fiapre',
    ),
    
];