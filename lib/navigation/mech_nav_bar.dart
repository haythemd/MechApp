import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mechalodon_mobile/generated/l10n.dart';
import 'package:mechalodon_mobile/navigation/app_link.dart';
import 'package:mechalodon_mobile/services/injectable.dart';
import 'package:mechalodon_mobile/styles/mech_icons_icons.dart';
import 'package:mechalodon_mobile/styles/style.dart';

class MechNavBar extends StatefulWidget {
  const MechNavBar({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<MechNavBar> createState() => _MechNavBarState();
}

class _MechNavBarState extends State<MechNavBar> {
  final _s = serviceLocator<S>();

  int _selectedIndex = 0;
  String _dashboardPath = MechPage.dashboard.path();
  String _campaignsPath = MechPage.campaigns.path();
  // String profilePath = MechPage.profile.name();

  void _selectScreen(int index) {
    switch (index) {
      case 0:
        _refreshSelection(index);
        context.go(_dashboardPath);
        break;
      case 1:
        _refreshSelection(index);
        context.go(_campaignsPath);
        break;
      // case 2:
      //   _refreshSelection(index);
      //   context.goNamed(profilePath);
      //   break;
      default:
        _refreshSelection(index);
        context.go(_dashboardPath);
        break;
    }
  }

  void _refreshSelection(int index) {
    _savePath(_selectedIndex);
    setState(() {
      _selectedIndex = index;
    });
  }

  void _savePath(int forScreen) {
    String path = GoRouter.of(context).location;
    switch (forScreen) {
      case 0:
        _dashboardPath = path;
        break;
      case 1:
        _campaignsPath = path;
        break;
      case 2:
        // profilePath = path;
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
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
                        title: _s.navBarDashboardButton,
                        isSelected: _selectedIndex == 0,
                        index: 0,
                        onTap: _selectScreen,
                      ),
                      _MechNavItem(
                        icon: MechIcons.megaphone,
                        title: _s.navBarCampaignButton,
                        isSelected: _selectedIndex == 1,
                        index: 1,
                        onTap: _selectScreen,
                      ),
                      _MechNavItem(
                        icon: MechIcons.user,
                        title: _s.navBarProfileButton,
                        isSelected: _selectedIndex == 2,
                        index: 2,
                        onTap: _selectScreen,
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ],
    );
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
    required this.index,
    required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final bool isSelected;
  final int index;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!isSelected) {
          onTap(index);
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
