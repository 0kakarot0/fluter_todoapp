import 'package:flutter/material.dart';
import 'package:todoapp/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: Border(bottom: BorderSide.none),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 25.0,
              top: 25,
            ),
            child: Column(
              children: [
                DrawerHeader(
                  child: Icon(
                    Icons.note_add_sharp,
                    size: 60,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
                ListTile(
                  onTap: () {
                    //close the drawer
                    Navigator.pop(context);
                  },
                  leading: Icon(
                    Icons.home,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                  title: Text(
                    "H O M E",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SettingPage(),
                        ));
                  },
                  leading: Icon(
                    Icons.home,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                  title: Text(
                    "S E T T I N G S",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 25.0,
              top: 25,
              bottom: 25,
            ),
            child: ListTile(
              leading: Icon(
                Icons.home,
                color: Theme.of(context).colorScheme.tertiary,
              ),
              title: Text(
                "L O G O U T",
                style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
