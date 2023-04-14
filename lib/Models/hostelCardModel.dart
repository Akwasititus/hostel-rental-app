
class AllHostels{
final String hostelImage;
final String hostelName;
final String hostleInfo;
final String hostelLocation;

AllHostels(this.hostleInfo, 
 {required this.hostelImage,
  required this.hostelName, 
  required this.hostelLocation
  
  });
}

List<AllHostels> getAllHostles = [
  AllHostels(
    hostelImage: 'assets/images/hostel1.jpg', 
    hostelName: 'titus Hostel', 
    'More Info',
    hostelLocation: 'Loc: Fiapre',
    ),

    AllHostels(
    hostelImage: 'assets/images/hostel1.jpg', 
    hostelName: 'Danny Hostel', 
    hostelLocation: 'Loc: Kumasi',
     'More more info',
    ),

    AllHostels(
    hostelImage: 'assets/images/hostel1.jpg', 
    hostelName: 'My Hostel', 
    hostelLocation: 'Loc: Abrokyere',
    'more and more and more',
    ),
];




// AllHostels(
//     hostelImage: 'assets/images/hostel1.jpg', 
//     hostelName: 'GetFund Hostel', 
//     hostleInfo: 'Loc: Fiapre',
//     ),

//     AllHostels(
//     hostelImage: 'assets/images/hostel1.jpg', 
//     hostelName: 'oTaw Hostel', 
//     hostleInfo: 'Loc: Fiapre',
//     ),

//     AllHostels(
//     hostelImage: 'assets/images/hostel1.jpg', 
//     hostelName: 'Zinko Hostel', 
//     hostleInfo: 'Loc: zinko',
//     ),

//     AllHostels(
//     hostelImage: 'assets/images/hostel1.jpg', 
//     hostelName: 'Notridam Hostel', 
//     hostleInfo: 'Loc: Notridam',
//     ),

//     AllHostels(
//     hostelImage: 'assets/images/hostel1.jpg', 
//     hostelName: 'SamueL Hostel', 
//     hostleInfo: 'Loc: Tolbot',
//     ),