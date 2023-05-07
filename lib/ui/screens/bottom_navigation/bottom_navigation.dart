import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:moniepoint_test/ui/screens/bottom_navigation/bottom_nav_model_view.dart';
import 'package:moniepoint_test/ui/screens/home/home_view.dart';
import 'package:moniepoint_test/utils/colors.dart';
import 'package:moniepoint_test/utils/screensize.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<BottomNavigation>
    with TickerProviderStateMixin {
  AnimationController? _navController;
  Animation<Offset>? _navAnimation;

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return const Home();

      case 1:
        return Home();
      case 2:
        return const Home();
      default:
        return const Home();
    }
  }

  @override
  void initState() {
    _navController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    )..forward();
    _navAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.99),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _navController!,
      curve: Curves.easeIn,
    ));

    super.initState();
  }

  @override
  void dispose() {
    _navController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateProvider>(builder: (context, model, _) {
      return Scaffold(
        backgroundColor: AppColors.white,
        body: getViewForIndex(model.currentTabIndex),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (newTab) {
            model.setCurrentTabTo(newTabIndex: newTab);
          },
          currentIndex: model.currentTabIndex,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/images/home.svg",
                width: 23.0,
                color: model.currentTabIndex == 0
                    ? AppColors.primaryColor
                    : Colors.black,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/images/voucher.svg",
                width: 23.0,
                color: model.currentTabIndex == 1
                    ? AppColors.primaryColor
                    : Colors.black,
              ),
              label: 'Voucher',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/images/wallet.svg",
                width: 23.0,
                color: model.currentTabIndex == 2
                    ? AppColors.primaryColor
                    : Colors.black,
              ),
              label: 'Wallet',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/images/settings.svg",
                width: 23.0,
                color: model.currentTabIndex == 3
                    ? AppColors.primaryColor
                    : Colors.black,
              ),
              label: 'Settings',
            ),
          ],
          selectedItemColor: AppColors.black,
        ),
      );
    });
  }
}
