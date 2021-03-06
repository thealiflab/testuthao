import 'package:flutter/material.dart';
import 'package:flutter_taxi_booking_customer_app/common/my_colors.dart';
import 'package:flutter_taxi_booking_customer_app/common/viiticons_icons.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/recent_address_item_list.dart';
import 'package:flutter_taxi_booking_customer_app/widgets/square_schedule_textfield_widget.dart';

class GoodToSeeYouBottomSheet extends StatefulWidget {
  final VoidCallback myOnWhereToTap;
  final VoidCallback myOnScheduleTap;
  final Function(int) myOnLocationSelection;

  GoodToSeeYouBottomSheet({
    @required this.myOnWhereToTap,
    @required this.myOnScheduleTap,
    @required this.myOnLocationSelection,
  });

  @override
  _GoodToSeeYouBottomSheetState createState() =>
      _GoodToSeeYouBottomSheetState();
}

class _GoodToSeeYouBottomSheetState extends State<GoodToSeeYouBottomSheet> {
  List<IconData> favAddIcons = [
    Viiticons.home,
    Viiticons.work,
    Viiticons.loved,
  ];
  List<String> favAddTitle = [
    "Home",
    "Varsity",
    "Restaurant",
  ];
  List<String> favAddAddresses = [
    "House - 12, Road - 2, Gulshan - 1 ",
    "North-South University, Bashundhara R/A",
    "Dominos, Banani - 12"
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Text(
            "Hello Nishat, good to see you!",
            style: Theme.of(context).textTheme.caption.copyWith(
                  color: kPrimaryColor,
                  letterSpacing: 0.43,
                  fontSize: 18,
                ),
          ),
          SizedBox(
            height: 16,
          ),
          SquareScheduleTextFieldWidget(
            hintText: "Where to?",
//            inputAction: TextInputAction.done,
//            inputType: TextInputType.text,
            onScheduleTap: widget.myOnScheduleTap,
            onWhereToTap: widget.myOnWhereToTap,
//            onSubmited: (str) {},
          ),
          SizedBox(
            height: 16,
          ),
          Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  //widget.myOnLocationSelection(0);
                },
                child: RecentAddressItemList(
                  addressTitle: favAddTitle[0],
                  myIcon: favAddIcons[0],
                  address: favAddAddresses[0],
                  myBackgrounColor: kSettingFavAddAvtarBg,
                  myIconColor: kTextLoginfaceid,
                  isLastIndex: 0 == 2,
                ),
              ),
              0 == 3
                  ? SizedBox()
                  : Container(
                      height: 0.5,
                      margin: const EdgeInsets.only(
                        top: 14,
                        left: 46,
                        right: 16,
                        bottom: 12,
                      ),
                      color: kGrey,
                    )
            ],
          ),
          Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  //widget.myOnLocationSelection(1);
                },
                child: RecentAddressItemList(
                  addressTitle: favAddTitle[1],
                  myIcon: favAddIcons[1],
                  address: favAddAddresses[1],
                  myBackgrounColor: kSettingFavAddAvtarBg,
                  myIconColor: kTextLoginfaceid,
                  isLastIndex: 1 == 2,
                ),
              ),
              1 == 3
                  ? SizedBox()
                  : Container(
                      height: 0.5,
                      margin: const EdgeInsets.only(
                        top: 14,
                        left: 46,
                        right: 16,
                        bottom: 12,
                      ),
                      color: kGrey,
                    )
            ],
          ),
          Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  //widget.myOnLocationSelection(2);
                },
                child: RecentAddressItemList(
                  addressTitle: favAddTitle[2],
                  myIcon: favAddIcons[2],
                  address: favAddAddresses[2],
                  myBackgrounColor: kSettingFavAddAvtarBg,
                  myIconColor: kTextLoginfaceid,
                  isLastIndex: 2 == 2,
                ),
              ),
              2 == 3
                  ? SizedBox()
                  : Container(
                      height: 0.5,
                      margin: const EdgeInsets.only(
                        top: 14,
                        left: 46,
                        right: 16,
                        bottom: 12,
                      ),
                      color: kGrey,
                    )
            ],
          ),
        ],
      ),
    );
  }
}
