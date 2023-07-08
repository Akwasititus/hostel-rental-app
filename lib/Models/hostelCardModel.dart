import '../utils/constants.dart';

class AllHostels {
  final String hostelImage;
  final String hostelName;
  final String hostleInfo;
  final String hostelEmail;
  final String hostelLocation;
  final List hostelRooms;
  final String numberOfRoomsAvailable;
  bool favIcon; // how do i call this in my widget

  AllHostels(
    this.favIcon, {
    required this.hostelImage,
    required this.hostelName,
    required this.hostelRooms,
    required this.hostelEmail,
    required this.hostleInfo,
    required this.hostelLocation,
    required this.numberOfRoomsAvailable,
  });
}

List imageUrls = [
  'assets/images/hostel11.jpg',
  'assets/images/hostel22.jpg',
  'assets/images/hostel33.jpeg',
  'assets/images/hostel44.jpeg',
];

List<AllHostels> getAllHostles = [
  AllHostels(
    hostelImage: 'assets/images/getfund.jpg',
    hostelName: 'GetFund Hostel',
    numberOfRoomsAvailable: '15 rooms Available',
    hostleInfo: HostelsDescription.getFundHosel,
    hostelRooms: imageUrls,
    false,
    hostelLocation: 'Loc: Fiapre',
    hostelEmail: 'www.ayamgatitus@gmail.com',
  ),
  AllHostels(
    hostelImage: 'assets/images/Erichostel.jpg',
    hostelName: 'Eric Hostel',
    numberOfRoomsAvailable: '2 rooms Available',
    hostelLocation: 'Loc: Kumasi',
    hostelEmail: 'www.ayamgatitus@gmail.com',
    hostelRooms: imageUrls,
    hostleInfo: HostelsDescription.ericHostel,
    false,
  ),
  AllHostels(
    hostelImage: 'assets/images/samelhostel.jpg',
    hostelName: 'Samuel Hostel',
    numberOfRoomsAvailable: '5 rooms Available',
    hostelLocation: 'Loc: Fiapre',
    hostelEmail: 'www.ayamgatitus@gmail.com',
    hostelRooms: imageUrls,
    hostleInfo: HostelsDescription.samuelHostel,
    false,
  ),
  AllHostels(
    hostelImage: 'assets/images/baidoo.jpg',
    hostelName: 'Baidoo Hostel',
    numberOfRoomsAvailable: '7 rooms Available',
    hostelLocation: 'Loc: Fiapre Marketplace',
    hostelRooms: imageUrls,
    hostelEmail: 'www.ayamgatitus@gmail.com',
    hostleInfo: HostelsDescription.baidooHostel,
    false,
  ),
  AllHostels(
    hostelImage: 'assets/images/patiance hostel.jpg',
    hostelName: 'Patience Hostel',
    numberOfRoomsAvailable: '5 rooms Available',
    hostelLocation: 'Loc: Campus',
    hostelRooms: imageUrls,
    hostelEmail: 'www.ayamgatitus@gmail.com',
    hostleInfo: HostelsDescription.patienceHostel,
    false,
  ),
];
