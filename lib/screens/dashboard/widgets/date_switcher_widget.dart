import 'package:flutter/material.dart';
import 'package:mechalodon_mobile/styles/style.dart';

class DateSwitcherWidget extends StatefulWidget {
  const DateSwitcherWidget({
    Key? key,
    required this.periodChanged,
  }) : super(key: key);

  /// [periodChanged] int index values represent the following periods
  /// 0 = 1 day,
  /// 1 = 7 days,
  /// 2 = 1 month
  final ValueChanged<int> periodChanged;

  @override
  State<DateSwitcherWidget> createState() => _DateSwitcherWidgetState();
}

class _DateSwitcherWidgetState extends State<DateSwitcherWidget> {
  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              widget.periodChanged(0);
              selectedItem = 0;
            });
          },
          child: Text("1D",
              style: TextStyle(
                  color: (selectedItem == 0)
                      ? MechColor.error
                      : MechColor.primary)),
        ),
        const SizedBox(
          width: 20,
        ),
        InkWell(
          onTap: () {
            setState(() {
              widget.periodChanged(1);
              selectedItem = 1;
            });
          },
          child: Text("7D",
              style: TextStyle(
                  color: (selectedItem == 1)
                      ? MechColor.error
                      : MechColor.primary)),
        ),
        const SizedBox(
          width: 20,
        ),
        InkWell(
          onTap: () {
            setState(() {
              widget.periodChanged(2);
              selectedItem = 2;
            });
          },
          child: Text("1M",
              style: TextStyle(
                  color: (selectedItem == 2)
                      ? MechColor.error
                      : MechColor.primary)),
        )
      ],
    );
  }
}
