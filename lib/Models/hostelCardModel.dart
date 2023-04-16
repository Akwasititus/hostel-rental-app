
class AllHostels{
final String hostelImage;
final String hostelName;
final String hostleInfo;
final String hostelLocation;
final String amount;

AllHostels(this.hostleInfo, 
 {required this.hostelImage,
  required this.hostelName, 
  required this.hostelLocation,
  required this.amount
  
  });
}

List<AllHostels> getAllHostles = [
  AllHostels(
    hostelImage: 'assets/images/hostel1.jpg', 
    hostelName: 'Titus Hostel', 
    amount: '1000/y',
    'More Info',
    hostelLocation: 'Loc: Fiapre',
    ),

    AllHostels(
    hostelImage: 'assets/images/hostel1.jpg', 
    hostelName: 'Danny Hostel', 
    amount: '1200/y',
    hostelLocation: 'Loc: Kumasi',
     'More more info',
    ),

    AllHostels(
    hostelImage: 'assets/images/hostel1.jpg', 
    hostelName: 'My Hostel', 
    amount: '1500/y',
    hostelLocation: 'Loc: Abrokyere',
    'more and more and more',
    ),
];