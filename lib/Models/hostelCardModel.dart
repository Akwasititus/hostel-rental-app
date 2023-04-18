
class AllHostels{
final String hostelImage;
final String hostelName;
final String hostleInfo;
final String hostelLocation;
final String numberOfRoomsAvailable;
bool favIcon; // how do i call this in my widget

AllHostels(this.hostleInfo,this.favIcon,
 {required this.hostelImage,
  required this.hostelName, 
  required this.hostelLocation,
  required this.numberOfRoomsAvailable,
  
  
  });
}

List<AllHostels> getAllHostles = [
  AllHostels(
    
    hostelImage: 'assets/images/hostel1.jpg', 
    hostelName: 'Samuel Hostel', 
    numberOfRoomsAvailable: '15 rooms Available',
    'More Info',
    false,
    hostelLocation: 'Loc: Fiapre',
    ),

    AllHostels(
    hostelImage: 'assets/images/hostel3.jpg', 
    hostelName: 'Lasvegas Hostel', 
    numberOfRoomsAvailable: '2 rooms Available',
    hostelLocation: 'Loc: Kumasi',
     'More more info',
     false,
    ),

    AllHostels(
    hostelImage: 'assets/images/hostel1.jpg', 
    hostelName: 'Baidu Hostel', 
    numberOfRoomsAvailable: '5 rooms Available',
    hostelLocation: 'Loc: Abrokyere',
    'more and more and more',
    false,
    ),

     AllHostels(
    hostelImage: 'assets/images/hostel3.jpg', 
    hostelName: 'Bola Hostel', 
    numberOfRoomsAvailable: '7 rooms Available',
    hostelLocation: 'Loc: Desmond House',
    'more and more and more',
    false,
    ),

     AllHostels(
    hostelImage: 'assets/images/hostel1.jpg', 
    hostelName: 'Bright Hostel', 
    numberOfRoomsAvailable: '17 rooms Available',
    hostelLocation: 'Loc: Zinko',
    'more and more and more',
    false,
    ),

     AllHostels(
    hostelImage: 'assets/images/hostel3.jpg', 
    hostelName: 'New Hostel', 
    numberOfRoomsAvailable: '5 rooms Available',
    hostelLocation: 'Loc: Campus',
    'more and more and more',
    false,
    ),
];