import 'package:flutter/material.dart';

class SimpleHomeDrawer extends StatelessWidget {
  const SimpleHomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: Container(
            color: Colors.blueGrey,
            child: ListView(
              children: [
                DrawerHeader(
                  padding: EdgeInsets.zero,
                    child: UserAccountsDrawerHeader(accountName: Text("Sami Barakzai"), accountEmail: Text("Samibarakzai2000@gmail.com"),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage("https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                    ),
                    )

                ),
                _drwerItem(title: "Activity",iconData: Icons.shopping_cart_outlined),
                _drwerItem(title: "edit user profile", iconData: Icons.edit),
                _drwerItem(title: "Contact", iconData: Icons.add_call),
                _drwerItem(title: "Logout", iconData: Icons.exit_to_app),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            _header(),
          ],
        ),
      ),
    );
  }

  _header() {
    return Container(
      height: 250,
      width: double.infinity,
      color: Colors.blueGrey,
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.menu),
                Text("JUST TESTING DRAWER", style: TextStyle(fontSize: 20, color: Colors.white),),
                Icon(Icons.notification_add_outlined),
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget _drwerItem({required String title,required IconData iconData}){
    return ListTile(
      title: Text(title,style: TextStyle(fontSize: 15,color: Colors.white),),
       leading: Icon(iconData),
    );
  }
}
