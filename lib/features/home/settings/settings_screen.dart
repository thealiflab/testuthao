import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';
import 'package:flutter_taxi_booking_customer_app/common/viiticons_icons.dart';
import 'package:flutter_taxi_booking_customer_app/features/home/settings/fav_driver/fav_driver_screen.dart';
import 'package:flutter_taxi_booking_customer_app/features/loginsignup/login/login_screen.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/flat_button_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/my_listtile_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/my_radio_text.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/privacy_widget.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/recent_address_item_list.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/slide_menu_widget.dart';

import 'bloc/bloc.dart';

class SettingsScreen extends StatelessWidget {
  static const String routeName = "settings";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsBloc(),
      child: Settings(),
    );
  }
}

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  var selectCurrency;
  var selectLanguage;
  List<IconData> favAddIcons = [Viiticons.home, Viiticons.work, Viiticons.home];
  List<String> favAddTitle = ["Home", "Work", "Gym"];
  List<String> favAddAddresses = [
    "73/15, pallabi, mirpur - 12, 1218",
    "142 Hazaribagh, Dhaka",
    "namapara, amtoli, p.s. # badda, 1247"
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          color: kSettingTopBg,
          padding: const EdgeInsets.only(
            top: 20,
            right: 20,
            left: 20,
            bottom: 24,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 86,
                width: 86,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90 / 2),
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/female_avtar.png',
                    ),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Nishat Sharmila",
                    style: Theme.of(context).textTheme.caption.copyWith(
                          color: kLoginBlack,
                          fontSize: 18,
                        ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "+880 1677 356966",
                    style: Theme.of(context).textTheme.caption.copyWith(
                          color: kTextLoginfaceid,
                          fontSize: 15,
                        ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "nishat.sharmila@northsouth.edu",
                    style: Theme.of(context).textTheme.caption.copyWith(
                          color: Colors.black38,
                          fontSize: 15,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "Favourite Address",
                style: Theme.of(context).textTheme.caption.copyWith(
                      color: kLoginBlack,
                      fontSize: 21,
                    ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 18,
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return SlideMenu(
                child: ListTile(
                  title: Column(
                    children: <Widget>[
                      RecentAddressItemList(
                        addressTitle: favAddTitle[index],
                        myIcon: favAddIcons[index],
                        address: favAddAddresses[index],
                        myBackgrounColor: kSettingFavAddAvtarBg,
                        myIconColor: kTextLoginfaceid,
                        isLastIndex: index == 2,
                      ),
                      index == 2
                          ? SizedBox()
                          : Container(
                              height: 0.5,
                              margin: const EdgeInsets.only(
                                  top: 14, left: 46, right: 16),
                              color: kGrey,
                            )
                    ],
                  ),
                ),
                menuItems: <Widget>[
                  Container(
                    color: kDanger,
                    child: Center(
                      child: Text(
                        "Delete",
                        style: Theme.of(context).textTheme.caption.copyWith(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                      ),
                    ),
                  ),
                ],
              );
            }),
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            top: 8,
          ),
          child: Text(
            "Add Other Address",
            style: Theme.of(context).textTheme.caption.copyWith(
                  color: kPrimaryColor,
                  fontSize: 16,
                ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 4,
          width: MediaQuery.of(context).size.width,
          color: kSettingDivider,
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Privacy",
                style: Theme.of(context).textTheme.caption.copyWith(
                      color: kLoginBlack,
                      fontSize: 20,
                    ),
              ),
              SizedBox(
                height: 15,
              ),
              PrivacyWidget(
                myTitle: "Location",
                mydeisc:
                    "Uthao use your device's loation screvice for more  reliable rides",
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 0.5,
                width: MediaQuery.of(context).size.width,
                color: kGrey,
              ),
              SizedBox(
                height: 10,
              ),
              PrivacyWidget(
                myTitle: "Notifications",
                mydeisc: "Control what message your receive from Uthao",
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 4,
          width: MediaQuery.of(context).size.width,
          color: kSettingDivider,
        ),
        SizedBox(
          height: 21,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Text(
            "Currency",
            style: Theme.of(context).textTheme.caption.copyWith(
                  color: kLoginBlack,
                  fontSize: 20,
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 6,
            left: 10,
            right: 28,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              MyRadioText(
                text: "BDT",
                myVal: 1,
                myGroupVal: selectCurrency,
                myOnChanged: (val) {
                  setState(() {
                    selectCurrency = val;
                  });
                },
              ),
              MyRadioText(
                text: "Dollar",
                myVal: 2,
                myGroupVal: selectCurrency,
                myOnChanged: (val) {
                  setState(() {
                    selectCurrency = val;
                  });
                },
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 4,
          width: MediaQuery.of(context).size.width,
          color: kSettingDivider,
        ),
        Container(
          height: 4,
          width: MediaQuery.of(context).size.width,
          color: kSettingDivider,
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 12,
            bottom: 8,
            left: 4,
            right: 20,
          ),
          child: MyListTitle(
            title: "Favourite Drivers",
            myOnTap: () {
              Navigator.of(context).pushNamed(
                FavDriverScreen.routeName,
              );
            },
            isLastIndex: true,
          ),
        ),
        Container(
          height: 4,
          width: MediaQuery.of(context).size.width,
          color: kSettingDivider,
        ),
        SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Delete Account",
                style: Theme.of(context).textTheme.caption.copyWith(
                      fontWeight: FontWeight.w500,
                      color: kDanger,
                      fontSize: 16,
                    ),
              ),
              SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 8,
            left: 18,
            right: 18,
          ),
          child: FlatButtonWidget(
            btnOnTap: () {
              Navigator.of(context).pushReplacementNamed(
                LoginScreen.routeName,
              );
            },
            btnTxt: "Signout",
            btnColor: kAccentColor,
          ),
        ),
        SizedBox(
          height: 25,
        )
      ],
    );
  }
}
