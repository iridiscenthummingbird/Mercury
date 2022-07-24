import 'package:flutter/material.dart';
import 'package:mercury/screens/group_chat_creation/group_chat_creation.dart';
import 'package:mercury/screens/main/tabs/chats/chats_tab.dart';
import 'package:mercury/screens/main/tabs/contacts/contacts_tab.dart';
import 'package:mercury/screens/main/tabs/settings/settings_tab.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  static const String routeName = '/main';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 1;

  Future<void> _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    ContactsTab(),
    ChatsTab(),
    SettingsTab(),
  ];

  String getTitle(BuildContext context) {
    switch (_selectedIndex) {
      case 0:
        return 'Contacts';
      case 1:
        return 'Chats';
      case 2:
        return 'Settings';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).iconTheme.color,
        title: Text(getTitle(context)),
        actions: [
          if (_selectedIndex == 1) ...{
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, GroupChatCreationScreen.routeName);
              },
              icon: const Icon(Icons.add),
            ),
          },
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        //backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).iconTheme.color,
        unselectedItemColor: Theme.of(context).iconTheme.color!.withOpacity(0.4),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      body: _widgetOptions[_selectedIndex],
    );
  }
}
