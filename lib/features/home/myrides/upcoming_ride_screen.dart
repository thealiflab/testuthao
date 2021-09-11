import 'package:flutter/material.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/upcoming_ride_itmelayout_widget.dart';

class UpComingRideScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<UpComingRideScreen> {
  List<String> rideTimes = [
    "Today, 9:30 AM",
    "September 01, 2021 8:25 AM",
    "September 05, 2021 8:25 AM"
  ];
  List<String> rideType = [
    "Uthao Short Trip",
    "Uthao Long Trip",
    "Uthao VIP Trip"
  ];
  List<String> pickUpAdd = [
    "02, Gulshan",
    "12, Banani",
    "Hatirjheel",
  ];
  List<String> dropUpAdd = ["12, Banani", "Hatirjheel", "Jamuna Future Park"];
  List<String> amount = ["TK 7,000", "TK 2,000", "TK 9,000"];
  List<String> image = [
    "assets/mapiamge.jpeg",
    "assets/mapiamge.jpeg",
    "assets/mapiamge.jpeg"
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return UpcomingRideItmeLayoutWidget(
            rideTime: rideTimes[index],
            rideName: rideType[index],
            droopupAddress: dropUpAdd[index],
            pickupAddress: pickUpAdd[index],
            rideAmount: amount[index],
            rideImage: image[index],
          );
        });
  }
}
