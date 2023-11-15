part of '../bottom_navigation_bar.dart';

class BottomNavigationBarView extends StatefulWidget {
  final int selectedIndex;
  const BottomNavigationBarView({super.key, this.selectedIndex = 0});

  @override
  State<BottomNavigationBarView> createState() => _BottomNavigationBarViewState();
}

class _BottomNavigationBarViewState extends State<BottomNavigationBarView> {
  int _selectedIndex = 0;
  @override
  void initState() {
    _selectedIndex = widget.selectedIndex;

    super.initState();
  }

  tapRequest() {
    setState(() {
      _selectedIndex = 1;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final t = Utils.languageOf(context);
    final perms = AppStorage().authorities.permissions;
    Widget selectedScreen;

    switch (_selectedIndex) {
      case 0:
        selectedScreen = HomeScreen(notifyParent: tapRequest);
        break;
      case 1:
        selectedScreen = const SurveyMainScreen();
        break;
      case 2:
        selectedScreen = const ListTicketScreen();
        break;
      case 3:
        selectedScreen = const SettingMainScreen();
        break;
      default:
        selectedScreen = HomeScreen(notifyParent: tapRequest);
    }

    return Scaffold(
      body: Center(
        child: selectedScreen,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedFontSize: 12,
        iconSize: 24,
        items: perms?.isCreateTicket == true
            ? <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: const Icon(Icons.home_filled),
                  label: t.home,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.forum),
                  label: t.survey,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.library_add),
                  label: t.request,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.settings),
                  label: t.settings,
                ),
              ]
            : <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: const Icon(Icons.home_filled),
                  label: t.home,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.settings),
                  label: t.settings,
                ),
              ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.light().primary,
        unselectedItemColor: AppColors.light().disabled,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
        onTap: _onItemTapped,
      ),
    );
  }
}
