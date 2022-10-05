import 'package:flutter/material.dart';
import '../../data_layer/apiModels/dishModel.dart';

// class DishDetails extends StatelessWidget {
//   const DishDetails({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Container(
//           margin: const EdgeInsets.all(20),
//           child: Column(
//             children: [
//               Image.network('image'),
//               const SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 children: [
//                   Text(
//                     dishesName,
//                     style: const TextStyle(
//                         fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   Spacer(),
//                   Text(
//                     calories.toString(),
//                     style: const TextStyle(color: Colors.redAccent),
//                   ),
//                 ],
//               ),
//               const Spacer(),
//               ConstrainedBox(
//                 constraints:
//                     const BoxConstraints(minHeight: 0.0, minWidth: 0.0),
//                 child: Text(dishDescription, textAlign: TextAlign.center),
//               ),
//               // const SizedBox(height: 5),
//               const Spacer(),
//               const TextField(
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   // labelText: "Name Field",
//                   hintText: "Name Field",
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Container(
//                 decoration: const BoxDecoration(
//                     color: Colors.grey,
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(10.0),
//                     )),
//                 child: TextButton(
//                   style: TextButton.styleFrom(
//                     // padding: const EdgeInsets.all(20),
//                     primary: Colors.black,
//                     textStyle: const TextStyle(
//                         fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   onPressed: () {},
//                   child: const Center(
//                     child: Text(
//                       "Place Order",
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
