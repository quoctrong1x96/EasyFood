// /*
//  * Copyright (c) 2021 Akshay Jadhav <jadhavakshay0701@gmail.com>
//  *
//  * This program is free software; you can redistribute it and/or modify it under
//  * the terms of the GNU General Public License as published by the Free Software
//  * Foundation; either version 3 of the License, or (at your option) any later
//  * version.
//  *
//  * This program is distributed in the hope that it will be useful, but WITHOUT ANY
//  * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//  * PARTICULAR PURPOSE. See the GNU General Public License for more details.
//  *
//  * You should have received a copy of the GNU General Public License along with
//  * this program.  If not, see <http://www.gnu.org/licenses/>.
//  */

// import 'package:cenafood/models/userModels/UserProfile.dart';
// import 'package:cenafood/resources/AuthMethod.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// class MyOrderPage extends StatefulWidget {
//   @override
//   _MyOrderPageState createState() => _MyOrderPageState();
// }

// class _MyOrderPageState extends State<MyOrderPage> {
//   List<Request> requestList=[];
//   AuthMethods authMethods=AuthMethods();
//   UserProfile mFirebaseHelper = UserProfile(avatarLink: f));
//   FirebaseUser currentUser;

//   @override
//   void initState() {
//     super.initState();
//     SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {
//       currentUser= await authMethods.getCurrentUser();
//       mFirebaseHelper.fetchOrders(currentUser).then((List<Request> list){
//         // there are not much sync operation in myorder page, i.e didn;t made any bloc file :)
//         setState(() {
//           requestList = list;
//         });
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0.0,),
//         body: SingleChildScrollView(
//           child: Container(
//             padding: EdgeInsets.only(top: 0.0,left: 20.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 10.0,left:18.0),
//                   child: Text("My Orders",
//                     style: TextStyle(
//                       color: UniversalVariables.orangeAccentColor, 
//                       fontSize: 40.0, 
//                       fontWeight: FontWeight.bold,
//                       ),
//                   ),
//                 ),
//                 createListOfOrder()
//               ],
//             ),
//           ),
//         ),
//     );
//   }

//   createListOfOrder(){
//     return Container(
//       height: MediaQuery.of(context).size.height,
//       child: requestList.length==-1 ? Center(child: CircularProgressIndicator())
//           : ListView.builder(
//           physics: NeverScrollableScrollPhysics(),
//           scrollDirection: Axis.vertical,
//           itemCount: requestList.length,
//           itemBuilder: (_,index){
//             return OrderWidget(
//               requestList[index],
//             );
//           }
//       ),
//     );
//   }
// }



