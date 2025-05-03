// import 'package:flutter/material.dart';

// class BookDetailsPage extends StatelessWidget {
//   const BookDetailsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl, // لدعم اللغة العربية
//       child: Scaffold(
//         backgroundColor: const Color(0xFF3A3636),
//         body: SafeArea(
//           child: Column(
//             children: [
//               // الجزء العلوي
//               Container(
//                 height: 280,
//                 decoration: const BoxDecoration(
//                   color: Color(0xFFF5DFC4),
//                   // borderRadius: BorderRadius.vertical(
//                   //   bottom: Radius.circular(50),
//                   // ),
//                 ),
//                 child: Stack(
//                   alignment: Alignment.topRight,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(12.0),
//                       child: Icon(Icons.arrow_back),
//                     ),
//                     Align(
//                       alignment: Alignment.center,
//                       child: Card(
//                         elevation: 10,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                         child: SizedBox(
//                           height: 180,
//                           width: 120,
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(16),
//                             child: Image.asset(
//                               'assets/images/book4.png', // ضع مسار الصورة لديك
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 16),

//               // اسم الكتاب والحالة
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.horizontal(
//                     right: Radius.circular(50),
//                     left: Radius.circular(50),
//                   ),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: const [
//                       Text(
//                         'متاح',
//                         style: TextStyle(color: Colors.green, fontSize: 16),
//                       ),
//                       Text(
//                         'سيروش',
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),

//               const Divider(
//                 thickness: 1,
//                 color: Colors.grey,
//                 indent: 24,
//                 endIndent: 24,
//               ),

//               const SizedBox(height: 8),

//               // النسخ المتاحة
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 24.0),
//                 child: Align(
//                   alignment: Alignment.centerRight,
//                   child: Text(
//                     'النسخ المتاحة',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 8),

//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                 child: Wrap(
//                   spacing: 8,
//                   children: List.generate(
//                     10,
//                     (index) => Icon(
//                       index < 2
//                           ? Icons.menu_book
//                           : Icons.menu_book_outlined, // مثال فقط
//                       color: index < 2 ? Colors.grey : Colors.deepOrange,
//                       size: 30,
//                     ),
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 24),

//               // الأزرار
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                 child: Column(
//                   children: [
//                     CustomButton(text: 'شراء الكتاب', color: Color(0xFFD1542F)),
//                     const SizedBox(height: 12),
//                     CustomButton(
//                       text: 'استعارة الكتاب',
//                       color: Color(0xFFE7B64C),
//                     ),
//                     const SizedBox(height: 12),
//                     CustomButton(
//                       text: 'اعارة الكتاب',
//                       color: Color(0xFF4A8C6C),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CustomButton extends StatelessWidget {
//   final String text;
//   final Color color;

//   const CustomButton({required this.text, required this.color, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       height: 50,
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: color,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//         ),
//         onPressed: () {},
//         child: Text(text, style: const TextStyle(color: Colors.white)),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class BookDetailsPage extends StatelessWidget {
  const BookDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // دعم اللغة العربية
      child: Scaffold(
        backgroundColor: const Color(0xFFF5DFC4), // اللون البيج
        body: SafeArea(
          child: Column(
            children: [
              // صورة الكتاب في الأعلى
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: SizedBox(
                    height: 200,
                    width: 130,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        'assets/images/book4.png', // مسار الصورة
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),

             
           
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color(0xFF4A8C6C), // اللون الخضيري
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(50),
                  ),
                ),
                child: Column(
                  children: [
                    const Text(
                      'النسخ المتاحة',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      children: List.generate(
                        10,
                        (index) => Icon(
                          index < 2
                              ? Icons.menu_book
                              : Icons.menu_book_outlined,
                          color: index < 2 ? Colors.grey : Colors.deepOrange,
                          size: 30,
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // الأزرار
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        children: [
                          CustomButton(
                            text: 'شراء الكتاب',
                            color: const Color(0xFFD1542F),
                          ),
                          const SizedBox(height: 12),
                          CustomButton(
                            text: 'استعارة الكتاب',
                            color: const Color(0xFFE7B64C),
                          ),
                          const SizedBox(height: 12),
                          CustomButton(
                            text: 'إعارة الكتاب',
                            color: const Color(0xFF4A8C6C),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;

  const CustomButton({required this.text, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {},
        child: Text(text, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
