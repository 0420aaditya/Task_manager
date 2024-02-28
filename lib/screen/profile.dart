// import 'package:flutter/material.dart';
// import 'package:task_manager/const/colors.dart';
// import 'package:task_manager/data/firestor.dart';

// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});

//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 8.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: 20,
//               ),
//               Center(
//                 child: Container(
//                   height: 130,
//                   width: 130,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     border: Border.all(
//                       color: custom_green,
//                       width: 4,
//                     ),
//                   ),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(100),
//                     child: Image(
//                       fit: BoxFit.cover,
//                       image: NetworkImage(
//                           'https://scontent.fktm16-1.fna.fbcdn.net/v/t39.30808-6/417577532_2582853885210644_142319677615085241_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=c42490&_nc_ohc=FC0JHEap1bsAX_W_xks&_nc_ht=scontent.fktm16-1.fna&oh=00_AfBVJel_NnprqcUJ-hF4jvJ9gdQyolzwsjTNyj9huvVFvw&oe=65E35532'),
//                       loadingBuilder: (context, child, loadingProgress) {
//                         if (loadingProgress == null) return child;
//                         return Center(child: CircularProgressIndicator());
//                       },
//                       errorBuilder: (context, object, stack) {
//                         return Container(
//                           child: Icon(
//                             Icons.error_outline_outlined,
//                             color: Colors.red,
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

