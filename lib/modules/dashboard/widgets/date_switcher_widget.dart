import 'package:flutter/material.dart';
import 'package:mechalodon_mobile/styles/style.dart';

class DateSwitcherWidget extends StatefulWidget {
  DateSwitcherWidget({
    Key? key,
    required this.numberOfDaysChanged,
    required this.selectedPeriod,
  }) : super(key: key);

  /// [numberOfDaysChanged] The number of days the reports should show for.
  /// 1, 7, or 30 days.
  final ValueChanged<int> numberOfDaysChanged;
  int selectedPeriod;
  @override
  State<DateSwitcherWidget> createState() => _DateSwitcherWidgetState();
}

class _DateSwitcherWidgetState extends State<DateSwitcherWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              widget.numberOfDaysChanged(0);
              widget.selectedPeriod = 0;
            });
          },
          child: Text("1D",
              style: TextStyle(
                  color: (widget.selectedPeriod == 0)
                      ? MechColor.error
                      : MechColor.primary)),
        ),
        const SizedBox(
          width: 20,
        ),
        InkWell(
          onTap: () {
            setState(() {
              widget.numberOfDaysChanged(1);
              widget.selectedPeriod = 1;
            });
          },
          child: Text("7D",
              style: TextStyle(
                  color: (widget.selectedPeriod == 1)
                      ? MechColor.error
                      : MechColor.primary)),
        ),
        const SizedBox(
          width: 20,
        ),
        InkWell(
          onTap: () {
            setState(() {
              widget.numberOfDaysChanged(2);
              widget.selectedPeriod = 2;
            });
          },
          child: Text("1M",
              style: TextStyle(
                  color: (widget.selectedPeriod == 2)
                      ? MechColor.error
                      : MechColor.primary)),
        )
      ],
    );
  }
}
