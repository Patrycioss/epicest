//
//
// import 'package:flutter/material.dart';
//
// class FavoritesMenu extends StatefulWidget {
//   final _MyHomePageState page;
//
//   const FavoritesMenu(this.page, {super.key});
//
//
//   @override
//   State<FavoritesMenu> createState() => _FavoritesMenu(state: this.page);
// }
//
// class _FavoritesMenu extends State<FavoritesMenu>{
//   _MyHomePageState state;
//
//   _FavoritesMenu({required this.state});
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       // Add a ListView to the drawer. This ensures the user can scroll
//       // through the options in the drawer if there isn't enough vertical
//       // space to fit everything.
//       child: ListView(
//         // Important: Remove any padding from the ListView.
//         padding: EdgeInsets.zero,
//         children: [
//           const DrawerHeader(
//             decoration: BoxDecoration(
//               color: Colors.blue,
//             ),
//             child: Center(
//               child: SelectionContainer.disabled(child:
//               Text(
//                   'Favorites',
//                   style: TextStyle(
//                       fontSize: 40, fontWeight: FontWeight.bold)
//               ),
//               ),
//             ),
//           ),
//           ListTile(
//             title: const Text('Favorite one'),
//             subtitle: const Text("My house"),
//             onTap: () {
//               widget.page.setIffing(true);
//               Navigator.pop(context);
//             },
//           ),
//           ListTile(
//             title: const Text('Favorite two'),
//             subtitle: const Text("My booger"),
//             onTap: () {
//               widget.page.setIffing(true);
//               Navigator.pop(context);
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }