import 'package:flutter/material.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/upcoming_ride_itmelayout_widget.dart';

class CanceledRideScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<CanceledRideScreen> {
  var arryLength = 1;
  List<String> rideTimes = [
    "Dec 2, 2019 8:25 AM",
  ];
  List<String> rideType = [
    "Long Trip",
  ];
  List<String> pickUpAdd = [
    "111, TSC",
  ];
  List<String> dropUpAdd = [
    "North-South University, Bashundhara R/A",
  ];
  List<String> amount = [
    "250 BDT",
  ];
  List<String> image = [
    "assets/mapiamge.jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: rideTimes.length,
      itemBuilder: (BuildContext context, int index) {
        return UpcomingRideItmeLayoutWidget(
          rideTime: rideTimes[index],
          rideName: rideType[index],
          droopupAddress: dropUpAdd[index],
          pickupAddress: pickUpAdd[index],
          rideAmount: amount[index],
          rideImage: image[index],
        );
      },
    );
  }
}
