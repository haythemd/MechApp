import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mechalodon_mobile/generated/l10n.dart';
import 'package:mechalodon_mobile/navigation/app_link.dart';
import 'package:mechalodon_mobile/services/injectable.dart';
import 'package:mechalodon_mobile/styles/mech_icons_icons.dart';
import 'package:mechalodon_mobile/styles/style.dart';

class MechNavBar extends StatefulWidget {
  const MechNavBar({Key? key, required this.selectedIndex, required this.body})
      : super(key: key);

  final int selectedIndex;
  final Widget body;

  @override
  State<MechNavBar> createState() => _MechNavBarState();
}

class _MechNavBarState extends State<MechNavBar> {
  final s = serviceLocator<S>();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      widget.body,
      Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 78,
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            child: Padding(
              padding: const EdgeInsets.only(left: 42, right: 42),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _MechNavItem(
                        icon: MechIcons.apps,
                        title: s.navBarDashboardButton,
                        isSelected: widget.selectedIndex == 0,
                        page: MechPage.dashboard),
                    _MechNavItem(
                        icon: MechIcons.megaphone,
                        title: s.navBarCampaignButton,
                        isSelected: widget.selectedIndex == 1,
                        page: MechPage.campaign),
                    _MechNavItem(
                        icon: MechIcons.user,
                        title: s.navBarProfileButton,
                        isSelected: widget.selectedIndex == 2,
                        page: MechPage.dashboard),
                  ],
                ),
              ),
            ),
          ))
    ]);
  }
}

class MechNavItem {
  final IconData icon;
  final String title;
  final MechPage page;
  MechNavItem({required this.icon, required this.page, required this.title});
}

class _MechNavItem extends StatelessWidget {
  const _MechNavItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.page,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final bool isSelected;
  final MechPage page;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!isSelected) {
          print(page.pathWithId("1"));
          context.go(page.pathWithId("1"));
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 23,
            color: !isSelected
                ? Theme.of(context).unselectedWidgetColor
                : Theme.of(context).textSelectionTheme.selectionColor,
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: MechTextStyle.h5.copyWith(
                fontWeight: !isSelected ? FontWeight.w400 : FontWeight.w700,
                color: !isSelected
                    ? Theme.of(context).unselectedWidgetColor
                    : Theme.of(context).textSelectionTheme.selectionColor),
          ),
        ],
      ),
    );
  }
}
