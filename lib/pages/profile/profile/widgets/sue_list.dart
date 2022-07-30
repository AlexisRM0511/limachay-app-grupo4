// import 'package:flutter/material.dart';
// import '../../../sue/sue_card.dart';
// import '../../../sue/sue_detail/sue_detail.dart';

// Widget SueList(sues, context) {
//   return Expanded(
//     child: ListView.builder(
//       itemCount: sues.length,
//       itemBuilder: (BuildContext context, int index) {
//         return GestureDetector(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) {
//                 return SueDetail(sueCase: sues[index]);
//               })
//             );
//           },
//           child: SueCard(sueCase: sues[index]),
//         );
//       },
//     )
//   );
// }