import 'package:flutter/material.dart';
import 'package:mechalodon_mobile/navigation/mech_nav_bar.dart';
import 'package:mechalodon_mobile/styles/mech_icons_icons.dart';
import 'package:mechalodon_mobile/styles/style.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  // 1. The navbar can take an arbitrary number of navMenuItems and build a bar from it.
  // 2. The user defines which Mechpage they want to go to when they define the item.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "MECHALODON",
            style: MechTextStyle.subtitle,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    MechIcons.download,
                    color: MechColor.inactive,
                    size: 23,
                  )),
            )
          ],
        ),
        body: MechNavBar(
            selectedIndex: 0,
            body: Container(
              color: Colors.amber,
              width: 1000,
              height: 10000,
            )));
  }
}
