
class AllHostels{
final String hostelImage;
final String hostelName;
final String hostleInfo;
final String hostelLocation;
final String numberOfRoomsAvailable;

AllHostels(this.hostleInfo, 
 {required this.hostelImage,
  required this.hostelName, 
  required this.hostelLocation,
  required this.numberOfRoomsAvailable
  
  });
}

List<AllHostels> getAllHostles = [
  AllHostels(
    hostelImage: 'assets/images/hostel1.jpg', 
    hostelName: 'Samuel Hostel', 
    numberOfRoomsAvailable: '15 rooms Available',
    'More Info',
    hostelLocation: 'Loc: Fiapre',
    ),

    AllHostels(
    hostelImage: 'assets/images/hostel1.jpg', 
    hostelName: 'Lasvegas Hostel', 
    numberOfRoomsAvailable: '2 rooms Available',
    hostelLocation: 'Loc: Kumasi',
     'More more info',
    ),

    AllHostels(
    hostelImage: 'assets/images/hostel1.jpg', 
    hostelName: 'Baidu Hostel', 
    numberOfRoomsAvailable: '5 rooms Available',
    hostelLocation: 'Loc: Abrokyere',
    'more and more and more',
    ),
];