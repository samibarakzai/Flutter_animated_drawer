import 'package:flutter/material.dart';

class AnimatedDrawerHome extends StatefulWidget {
  const AnimatedDrawerHome({Key? key}) : super(key: key);

  @override
  State<AnimatedDrawerHome> createState() => _AnimatedDrawerHomeState();
}

class _AnimatedDrawerHomeState extends State<AnimatedDrawerHome>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(duration: Duration(microseconds: 600), vsync: this);
    super.initState();
  }

  void StartAnimation() {
    if (_animationController.isDismissed) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final rideside = MediaQuery.of(context).size.width * 0.6;

    return AnimatedBuilder(
      animation: _animationController,
        builder: (context, child) {
          return Stack(
            children: [
              _drawerMenu(),
              Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..translate(rideside * _animationController.value)
                    ..scaled(1-(_animationController.value * 0.3)),
                  child: _bodyWidget()),
            ],
          );
        });
  }

  Widget _bodyWidget() {
    return Scaffold(
      body: Column(
        children: [
          _header(),
        ],
      ),
    );
  }

  _drawerMenu() {
    return Scaffold(
      body: Container(
        color: Colors.blueGrey[200],
        child: ListView(
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  accountName: Text("Sami Barakzai"),
                  accountEmail: Text("Samibarakzai2000@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                  ),
                )),
            _drwerItem(
                title: "Activity", iconData: Icons.shopping_cart_outlined),
            _drwerItem(title: "edit user profile", iconData: Icons.edit),
            _drwerItem(title: "Contact", iconData: Icons.add_call),
            _drwerItem(title: "Logout", iconData: Icons.exit_to_app),
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
                InkWell(
                    onTap: () {
                      StartAnimation();
                    },
                    child: Icon(Icons.menu)),
                Text(
                  "Testing",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Icon(Icons.notification_add_outlined),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _drwerItem({required String title, required IconData iconData}) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 15, color: Colors.white),
      ),
      leading: Icon(iconData),
    );
  }
}
