// import 'dart:io';

// import 'package:flutter/material.dart';

// class PsiphonPage extends StatelessWidget {
//   PsiphonPage({super.key});
//   final File file = File(
//     "C:/Users/Rama/Desktop/dart flutter/ui_flutter/Capture.png",
//   );
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Row(
//         children: [
//           Container(
//             height: double.infinity,
//             width: 160,
//             child: Container(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     child: Column(
//                       spacing: 12,
//                       children: [
//                         Container(
//                           width: 100,
//                           height: 100,
//                           child: Image.file(file),
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                             // borderRadius: BorderRadius.circular(20),
//                             color: Color.fromRGBO(41, 110, 142, 1),
//                           ),
//                           width: 180,
//                           height: 40,
//                           child: Center(
//                             child: rowIcon(
//                               title: "DISCONNECTED",
//                               icon: Icons.settings,
//                               color: const Color.fromARGB(255, 181, 10, 30),
//                             ),
//                           ),
//                         ),

//                         rowIcon(
//                           title: "PSICASH",
//                           icon: Icons.home,
//                           color: const Color.fromARGB(255, 218, 232, 20),
//                         ),

//                         rowIcon(
//                           title: "SETTING",
//                           icon: Icons.settings,
//                           color: const Color.fromARGB(255, 18, 19, 13),
//                         ),

//                          rowIcon(
//                           title: "ABOUT",
//                           icon: Icons.abc_outlined,
//                           color: const Color.fromARGB(255, 10, 10, 8),
//                         ),

//   rowIcon(
//                           title: "LOGS",
//                           icon: Icons.home,
//                           color: const Color.fromARGB(255, 16, 16, 13),
//                         ),
//   rowIcon(
//                           title: "LANGUAGE",
//                           icon: Icons.language,
//                           color: const Color.fromARGB(255, 24, 24, 21),
//                         ),

//                         Column(
//                           children: [
//                             Text(
//                               "زبان",
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ), // أيقونة
//                             SizedBox(width: 8), // مسافة بين الأيقونة والنص
//                             Text(
//                               "iiiiiii",
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),

//                   /////////////////////////////////////////////////////////////////
//         Container(
//           child: Column(
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   color: Color.fromRGBO(41, 110, 142, 1),
//                 ),
//                 width: 180,
//                 height: 10,
//               ),

//               Row(
//                 children: [
//                   Icon(
//                     Icons.home,
//                     color: const Color.fromARGB(255, 248, 240, 11),
//                     size: 20,
//                   ),

//                   Text(
//                     "90",
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),

//                   Spacer(),
//                   Icon(
//                     Icons.home,
//                     color: const Color.fromARGB(255, 248, 240, 11),
//                     size: 20,
//                   ),
//                 ],
//               ),

//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(20),
//                     topRight: Radius.circular(20),
//                   ),
//                   color: Color.fromRGBO(183, 94, 15, 1),
//                 ),
//                 width: 180,
//                 height: 40,
//                 child: Row(
//                   children: [
//                     // مسافة بين الأيقونة والنص
//                     Text(
//                       "psiphon speed",
//                       style: TextStyle(
//                         fontSize: 12,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),

//                     Icon(
//                       Icons.settings,
//                       color: const Color.fromARGB(255, 23, 22, 23),
//                       size: 20,
//                     ), // أيقونة
//                     SizedBox(width: 8),
//                   ],
//                 ),
//               ),

//               Container(
//                 decoration: BoxDecoration(
//                   color: Color.fromRGBO(26, 65, 122, 1),
//                 ),
//                 width: 180,
//                 height: 40,
//                 child: Row(
//                   children: [
//                     // مسافة بين الأيقونة والنص
//                     Text(
//                       " speed BOOST",
//                       style: TextStyle(
//                         fontSize: 12,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),

//                     Icon(
//                       Icons.settings,
//                       color: const Color.fromARGB(255, 23, 22, 23),
//                       size: 20,
//                     ), // أيقونة
//                     SizedBox(width: 8),
//                   ],
//                 ),
//               ),

//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(20),
//                     bottomRight: Radius.circular(20),
//                   ),
//                   color: Color.fromRGBO(44, 125, 205, 1),
//                 ),
//                 width: 180,
//                 height: 40,
//                 child: Row(
//                   children: [
//                     // مسافة بين الأيقونة والنص
//                     Text(
//                       " Buy Psicash",
//                       style: TextStyle(
//                         fontSize: 12,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),

//                     Icon(
//                       Icons.settings,
//                       color: const Color.fromARGB(255, 192, 203, 25),
//                       size: 20,
//                     ), // أيقونة
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   ),
// ),

////////////////////////////////////////////////////////////////////////////////////////////////////
// Container(
//   height: double.infinity,
//   width: 1100,
//   color: Color.fromRGBO(225, 233, 233, 1),
//   child: Column(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     spacing: 70,
//     children: [
//       Container(
//         decoration: BoxDecoration(
//           color: Color.fromRGBO(41, 110, 142, 1),
//         ),
//         width: double.infinity,
//         height: 80,
//         child: Center(
//           child: Column(
//             children: [
//               Text(
//                 "sponsored by",
//                 style: TextStyle(
//                   fontSize: 12,
//                   fontWeight: FontWeight.w400,
//                   color: Colors.white,
//                 ),
//               ),
//               Container(
//                 width: 100,
//                 height: 50,
//                 child: Image.file(file),
//               ),
//             ],
//           ),
//         ),
//       ),
//       Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               // borderRadius: BorderRadius.circular(20),
//               color: Color.fromRGBO(252, 254, 255, 0.933),
//             ),
//             width: 500,
//             height: 250,
//             child: Center(
//               child: Column(
//                 children: [
//                   Icon(
//                     Icons.warning_rounded,
//                     color: const Color.fromARGB(255, 172, 43, 63),
//                     size: 100,
//                   ),

//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "SIPHON IS ",
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.w400,
//                           color: const Color.fromARGB(
//                             255,
//                             19,
//                             18,
//                             18,
//                           ),
//                         ),
//                       ),
//                       Text(
//                         "DISCONNECTED",
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.w400,
//                           color: const Color.fromARGB(
//                             255,
//                             172,
//                             43,
//                             63,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),

//                   Text(
//                     ". . . . . . . . . . . . . . . . . .",
//                     style: TextStyle(
//                       fontSize: 35,
//                       fontWeight: FontWeight.w400,
//                       color: const Color.fromARGB(255, 82, 81, 81),
//                     ),
//                   ),

//                   Container(
//                     decoration: BoxDecoration(
//                       // borderRadius: BorderRadius.circular(20),
//                       color: Colors.green,
//                     ),
//                     width: 180,
//                     height: 40,
//                     child: Center(
//                       child: Text(
//                         "CONNECTED",
//                         style: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w400,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//       Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(
//             child: Column(
//               children: [
//                 Text(
//                   "select server region ",
//                   style: TextStyle(
//                     fontSize: 10,
//                     fontWeight: FontWeight.w400,
//                     color: const Color.fromARGB(255, 231, 16, 16),
//                   ),
//                 ),

//                 Container(
//                   decoration: BoxDecoration(
//                     // borderRadius: BorderRadius.circular(20),
//                     color: Colors.white,
//                   ),
//                   width: 180,
//                   height: 40,
//                   child: Center(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.power,
//                           color: const Color.fromARGB(
//                             255,
//                             172,
//                             43,
//                             63,
//                           ),
//                           size: 20,
//                         ),
//                         Text(
//                           "best  Performance",
//                           style: TextStyle(
//                             fontSize: 12,
//                             fontWeight: FontWeight.w400,
//                             color: Colors.black,
//                           ),
//                         ),
//                         Icon(
//                           Icons.pending_rounded,
//                           color: const Color.fromARGB(
//                             255,
//                             172,
//                             43,
//                             63,
//                           ),
//                           size: 20,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ],
//   ),
// ),
//         ],
//       ),
//     );
//   }
// }

// class rowIcon extends StatelessWidget {
//   rowIcon({
//     super.key,
//     required this.title,
//     required this.icon,
//     required this.color,
//   });
//   final String title; // نص العنوان
//   final IconData icon; // الأيقونة
//   final Color color;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Icon(icon as IconData?, color: color, size: 20),
//         Text(
//           title,
//           style: TextStyle(
//             fontSize: 12,
//             fontWeight: FontWeight.w400,
//             color: const Color.fromARGB(255, 14, 9, 9),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'dart:io';
import 'package:flutter/material.dart';


class PsiphonPage extends StatelessWidget {
  PsiphonPage({super.key});
  final File file = File(
    "C:/Users/Rama/Desktop/dart flutter/ui_flutter/Capture.png",
  );

  final List<Map<String, dynamic>> menuItems = [
    {"title": "DISCONNECTED", "icon": Icons.settings, "color": Colors.red},
    {"title": "PSICASH", "icon": Icons.attach_money, "color": Colors.yellow},
    {"title": "SETTING", "icon": Icons.settings, "color": Colors.black},
    {"title": "ABOUT", "icon": Icons.info, "color": Colors.grey},
    {"title": "LOGS", "icon": Icons.list, "color": Colors.blue},
    {"title": "LANGUAGE", "icon": Icons.language, "color": Colors.green},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Column(
            children: [
              Container(
                width: 100,
                height: 100,
                margin: const EdgeInsets.only(top: 20),
                child: Image.file(file),
              ),

              Expanded(
                child: SizedBox(
                  width: 180,
                  height: 300,
                  child: ListView.builder(
                    itemCount: menuItems.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 10.0,
                        ),
                        child: ListTile(
                          leading: Icon(
                            menuItems[index]["icon"],
                            color: menuItems[index]["color"],
                            size: 24,
                          ),
                          title: Text(
                            menuItems[index]["title"],
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          tileColor: Colors.white, 
                          hoverColor:
                              Colors
                                  .blue, 
                          splashColor: const Color.fromARGB(
                            255,
                            235,
                            52,
                            11,
                          ), 
                          onTap: () {
                           
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                child: SizedBox(
                  width: 180,
                  height: 200,
                  child: Column(
                    children: [
                      // Container(
                      //   decoration: BoxDecoration(
                      //     color: Color.fromRGBO(41, 110, 142, 1),
                      //   ),
                      //   width: 180,
                      //   height: 10,
                      // ),
                      Divider(
                        color: Color.fromRGBO(41, 110, 142, 1), //  لون الخط
                        thickness: 2,
                        indent: 10,
                        endIndent: 10,     
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.home,
                            color: const Color.fromARGB(255, 248, 240, 11),
                            size: 20,
                          ),

                          Text(
                            "90",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Spacer(),
                          Icon(
                            Icons.home,
                            color: const Color.fromARGB(255, 248, 240, 11),
                            size: 20,
                          ),
                        ],
                      ),

                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          color: Color.fromRGBO(183, 94, 15, 1),
                        ),
                        width: 180,
                        height: 40,
                        child: Row(
                          children: [
                            //
                            Text(
                              "psiphon speed",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            Icon(
                              Icons.settings,
                              color: const Color.fromARGB(255, 23, 22, 23),
                              size: 20,
                            ),  
                            SizedBox(width: 8),
                          ],
                        ),
                      ),

                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(26, 65, 122, 1),
                        ),
                        width: 180,
                        height: 40,
                        child: Row(
                          children: [
                            // 
                            Text(
                              " speed BOOST",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            Icon(
                              Icons.settings,
                              color: const Color.fromARGB(255, 23, 22, 23),
                              size: 20,
                            ), // أيقونة
                            SizedBox(width: 8),
                          ],
                        ),
                      ),

                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          color: Color.fromRGBO(44, 125, 205, 1),
                        ),
                        width: 180,
                        height: 40,
                        child: Row(
                          children: [
                            // 
                            Text(
                              " Buy Psicash",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            Icon(
                              Icons.settings,
                              color: const Color.fromARGB(255, 192, 203, 25),
                              size: 20,
                            ), // أيقونة
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: double.infinity,
            width: 1100,
            color: Color.fromRGBO(225, 233, 233, 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 70,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(41, 110, 142, 1),
                  ),
                  width: double.infinity,
                  height: 80,
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          "sponsored by",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 50,
                          child: Image.file(file),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(252, 254, 255, 0.933),
                      ),
                      width: 500,
                      height: 250,
                      child: Center(
                        child: Column(
                          children: [
                            Icon(
                              Icons.warning_rounded,
                              color: const Color.fromARGB(255, 172, 43, 63),
                              size: 100,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "SIPHON IS ",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                    color: const Color.fromARGB(
                                      255,
                                      19,
                                      18,
                                      18,
                                    ),
                                  ),
                                ),
                                Text(
                                  "DISCONNECTED",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                    color: const Color.fromARGB(
                                      255,
                                      172,
                                      43,
                                      63,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            Text(
                              ". . . . . . . . . . . . . . . . . .",
                              style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromARGB(255, 82, 81, 81),
                              ),
                            ),

                            CutsomButton(title: "CONNECTED", method: () {
                              
                            },color:Colors.green,),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Text(
                            "select server region ",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromARGB(255, 231, 16, 16),
                            ),
                          ),
                          CutsomButton(
                            title: "Next",
                            method: () {}, 
                            icon: Icons.settings,
                            color: const Color.fromARGB(31, 36, 33, 120),
                          ),

                          // Container(
                          //   decoration: BoxDecoration(
                          //     // borderRadius: BorderRadius.circular(20),
                          //     color: Colors.white,
                          //   ),
                          //   width: 180,
                          //   height: 40,
                          //   child: Center(
                          //     child: Row(
                          //       mainAxisAlignment: MainAxisAlignment.center,
                          //       children: [
                          //         Icon(
                          //           Icons.power,
                          //           color: const Color.fromARGB(
                          //             255,
                          //             172,
                          //             43,
                          //             63,
                          //           ),
                          //           size: 20,
                          //         ),
                          //         Text(
                          //           "best  Performance",
                          //           style: TextStyle(
                          //             fontSize: 12,
                          //             fontWeight: FontWeight.w400,
                          //             color: Colors.black,
                          //           ),
                          //         ),
                          //         Icon(
                          //           Icons.pending_rounded,
                          //           color: const Color.fromARGB(
                          //             255,
                          //             172,
                          //             43,
                          //             63,
                          //           ),
                          //           size: 20,
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CutsomButton extends StatelessWidget {
  CutsomButton({
    super.key,
    required this.title,
    required this.method,
    this.icon,
    this.color,
  });
  String title;
  Function method;
  final IconData? icon;
  dynamic color;

  // ! YAGNI: You Aren't gonna need it
  // double padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: InkWell(
        onTap: method(),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: color,
          ),

          width: 300,
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Icon(icon, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}


//
// class rowIcon extends StatelessWidget {
//   rowIcon({
//     super.key,
//     required this.title,
//     required this.icon,
//     required this.color,
//   });

//   final String title; 
//   final IconData icon; 
//   final Color color;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
        
//         Icon(icon, color: color, size: 20),
//         const SizedBox(width: 10),
//         Text(
//           title,
//           style: const TextStyle(
//             fontSize: 12,
//             fontWeight: FontWeight.w400,
//             color: Colors.black,
//           ),
//         ),
        
//       ],
//     );
//   }
// }
