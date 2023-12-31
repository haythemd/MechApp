import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mechalodon_mobile/generated/l10n.dart';
import 'package:mechalodon_mobile/navigation/page_links.dart';
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
  String _dashboardPath = PageLink.dashboard;
  String _campaignsPath = PageLink.campaigns;
  String profilePath = PageLink.profile;

  void _selectScreen(int index) {
    if (_selectedIndex == index && index != 1) {
      return;
    }
    switch (index) {
      case 0:
        _refreshSelection(index);
        context.go(_dashboardPath);
        break;
      case 1:
        if (_selectedIndex == 1) {
          context.go(PageLink.campaigns);
          return;
        }
        _refreshSelection(index);
        context.go(_campaignsPath);
        break;
      case 2:
        _refreshSelection(index);
        context.go(profilePath);
        break;
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
        profilePath = path;
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Container(child: widget.child)),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                // only top border light black
                color: Theme.of(context).primaryColor,
                border: const Border(
                  top: BorderSide(
                    color: Color.fromARGB(255, 230, 230, 230),
                    width: .3,
                  ),
                ),
              ),
              height: 78,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
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
                        title: _s.navBarManagerButton,
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
  final PageLink page;
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
          onTap(index);
      },
      child: Container(
        width: 60,
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
              style: MechTextStyle.h7.copyWith(
                  fontWeight: !isSelected ? FontWeight.w400 : FontWeight.w700,
                  color: !isSelected
                      ? Theme.of(context).unselectedWidgetColor
                      : Theme.of(context).textSelectionTheme.selectionColor),
            ),
          ],
        ),
      ),
    );
  }
}
