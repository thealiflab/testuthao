import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';
import 'package:flutter_taxi_booking_customer_app/common/viiticons_icons.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/book_taxi/location_information/bottom_sheets/good_to_see_you_bottomsheet.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/book_taxi/location_information/where_to/where_to_screen.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/date_selection_container.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/flat_button_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/from_to_location_card_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/viit_appbar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'bloc/bloc.dart';

class LocationInformation extends StatefulWidget {
  @override
  _LocationInformationState createState() => _LocationInformationState();
}

class _LocationInformationState extends State<LocationInformation> {
  Completer<GoogleMapController> _controller = Completer();
  var tripEnd = false;
  LocationInformationBloc _locationInformationBloc;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay(
    hour: DateTime.now().hour,
    minute: DateTime.now().minute,
  );

  List<String> myWeekDays = [
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun",
  ];
  List<String> myMonths = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Otc",
    "Nov",
    "Dec"
  ];

  List<String> addressLabels = [
    "Add Home\nAddress",
    "Add Work\nAddress",
    "Add Loved One\nAddress",
  ];

  List<IconData> addressIcons = [
    Viiticons.home,
    Viiticons.work,
    Icons.favorite,
  ];

  List<IconData> favAddIcons = [Viiticons.home, Viiticons.work, Viiticons.home];
  List<String> favAddTitle = ["Home", "Varsity", "Restaurant"];
  List<String> favAddAddresses = [
    "House - 12, Road - 2, Gulshan - 1 ",
    "North-South University, Bashundhara R/A",
    "Dominos, Banani - 12"
  ];

  @override
  Future<void> initState() {
    super.initState();
    print("LocationInformation() init");
    _locationInformationBloc =
        BlocProvider.of<LocationInformationBloc>(context);
    _locationInformationBloc.add(IsLocationSelFinish(flag: false));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("LocationInformation() didChangeDependencies");
  }

  @override
  void dispose() {
    super.dispose();
    print("LocationInformation() dispose");
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        //Google map
        GoogleMap(
          mapType: MapType.normal,
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          initialCameraPosition: CameraPosition(
            target: LatLng(
              23.8151,
              90.4256,
            ),
            zoom: 15.00,
          ),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),

        //Top left menu icon
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 8, top: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: ViitAppBarIconWidget(
                    viitAppBarIconType: ViitAppBarIconTypes.MENU,
                    bgColor: kPrimaryColor,
                    iconColor: Colors.white,
                  ),
                ),
                //Top location selection done card

                BlocBuilder<LocationInformationBloc, LocationInformationState>(
                  builder: (context, state) {
                    if (state is ShowNextButton) {
                      return Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: FromToLocationCard(
                          fromLocation: "",
                          toLocation: "",
                          isPlusVisible: false,
                        ),
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                ),
              ],
            ),
          ),
        ),

        //Bottom location add suggestion
        BlocBuilder<LocationInformationBloc, LocationInformationState>(
          builder: (context, state) {
            print("$state");
            if (state is ShowNextButton) {
              return Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(21.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: FlatButtonWidget(
                            btnTxt: "Next",
                            btnColor: kAccentColor,
                            btnOnTap: () {
                              print("Goto vehicle selection");
                            },
                          ),
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: FlatButtonWidget(
                          btnTxt: "Schedule",
                          btnColor: kPrimaryColor,
                          btnOnTap: () {
                            print("Add trip into schedule");
                          },
                        ),
                        flex: 1,
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is ShowAddLocationState) {
              return Align(
                alignment: Alignment.bottomCenter,
                child: Container(),
              );
            } else if (state is ShowGoodToSeeYouState) {
              return Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: screenHeight * 0.45,
                  padding: const EdgeInsets.only(
                    left: 21,
                    right: 21,
                    top: 21,
                    bottom: 0,
                  ),
                  color: Colors.white,
                  child: GoodToSeeYouBottomSheet(
                    myOnLocationSelection: (i) {
                      _locationInformationBloc
                          .add(IsLocationSelFinish(flag: true));
                    },
                    myOnScheduleTap: () {
                      showBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: screenHeight * 0.45,
                              padding: const EdgeInsets.only(
                                  left: 21, right: 21, top: 21),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Text(
                                    "Schedule a Ride",
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption
                                        .copyWith(
                                          color: kLoginBlack,
                                          fontSize: 20,
                                          letterSpacing: 0.47,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  SizedBox(
                                    height: 21,
                                  ),
                                  DateSelectionContainer(
                                    myText:
                                        "${myWeekDays[selectedDate.weekday - 1]}, ${selectedDate.day.toString().padLeft(2, '0')} ${myMonths[selectedDate.month - 1]}",
                                    myOnTap: () async {
                                      final DateTime picked =
                                          await showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(2015, 8),
                                              lastDate: DateTime(2101));
                                      if (picked != null &&
                                          picked != selectedDate)
                                        setState(
                                          () {
                                            selectedDate = picked;
                                          },
                                        );
                                    },
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  DateSelectionContainer(
                                    myText:
                                        "${selectedTime.hourOfPeriod} : ${selectedTime.minute} ${selectedTime.period == DayPeriod.am ? 'AM' : 'PM'}",
                                    myOnTap: () async {
                                      final TimeOfDay picked =
                                          await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay(
                                          hour: DateTime.now().hour,
                                          minute: DateTime.now().minute,
                                        ),
                                      );
                                      if (picked != null &&
                                          picked != selectedTime) {
                                        setState(() {
                                          selectedTime = picked;
                                        });
                                      }
                                    },
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  FlatButtonWidget(
                                    btnTxt: "Set Pickup Time",
                                    btnColor: kAccentColor,
                                    btnOnTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    height: 56,
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                    myOnWhereToTap: () async {
                      var result = await Navigator.of(context).pushNamed(
                        WhereToScreen.routeName,
                        arguments: WhereToScreenArguments(),
                      );
                      if (result) {
                        _locationInformationBloc.add(
                          IsLocationSelFinish(flag: true),
                        );
                      }
                    },
                  ),
                ),
              );
            } else if (state is LoadingState) {
              return Align(
                alignment: Alignment.bottomCenter,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return Center(
                child: Text("Unhandled state"),
              );
            }
          },
        ),
      ],
    );
  }
}
