// import 'package:faam_link/screens/succesfulscreen.dart';
// import 'package:flutter/material.dart';

// class FormScreen extends StatefulWidget {
//   const FormScreen({super.key});

//   @override
//   _FormScreenState createState() => _FormScreenState();
// }

// class _FormScreenState extends State<FormScreen> {
//   String? selectedService;
//   String? selectedOption1;
//   String? selectedOption2;
//   DateTime? selectedDate;
//   TimeOfDay? selectedTime;

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2101),
//     );
//     if (picked != null && picked != selectedDate) {
//       setState(() {
//         selectedDate = picked;
//       });
//     }
//   }

//   Future<void> _selectTime(BuildContext context) async {
//     final TimeOfDay? picked = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//     );
//     if (picked != null && picked != selectedTime) {
//       setState(() {
//         selectedTime = picked;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xffFFFFFF),
//       appBar: AppBar(
//         backgroundColor: const Color(0xffFFFFFF),
//         surfaceTintColor: const Color(0xffFFFFFF),
//         shadowColor: const Color(0xffFFFFFF),
//         leading: InkWell(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: const Icon(
//             Icons.arrow_back_ios_new,
//             size: 20,
//           ),
//         ),
//         actions: const [
//           Icon(
//             Icons.more_vert,
//             size: 20,
//           ),
//           SizedBox(width: 10),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Form',
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 43,
//                     fontWeight: FontWeight.w700),
//               ),
//               const Text(
//                 'Select Service:',
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.w400,
//                     fontSize: 14),
//               ),
//               const SizedBox(height: 8),
//               DropdownButtonFormField<String>(
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey),
//                   ),
//                   contentPadding:
//                       EdgeInsets.symmetric(horizontal: 10, vertical: 15),
//                 ),
//                 value: selectedService,
//                 hint: const Text('Select Service'),
//                 items: ['Service 1', 'Service 2', 'Service 3']
//                     .map((String value) => DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(value),
//                         ))
//                     .toList(),
//                 onChanged: (newValue) {
//                   setState(() {
//                     selectedService = newValue;
//                   });
//                 },
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 'MOVING FROM:',
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.w400,
//                     fontSize: 14),
//               ),
//               const SizedBox(height: 8),
//               TextFormField(
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey),
//                   ),
//                   contentPadding:
//                       EdgeInsets.symmetric(horizontal: 10, vertical: 15),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 'MOVING TO:',
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.w400,
//                     fontSize: 14),
//               ),
//               const SizedBox(height: 8),
//               TextFormField(
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey),
//                   ),
//                   contentPadding:
//                       EdgeInsets.symmetric(horizontal: 10, vertical: 15),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Row(
//                 children: [
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           'DATE',
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontWeight: FontWeight.w400,
//                               fontSize: 14),
//                         ),
//                         const SizedBox(height: 8),
//                         Container(
//                           height: 50,
//                           child: OutlinedButton(
//                             onPressed: () => _selectDate(context),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   selectedDate == null
//                                       ? 'Select Date'
//                                       : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
//                                   style: const TextStyle(color: Colors.black),
//                                 ),
//                                 const Icon(Icons.calendar_today, size: 20),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(width: 16),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           'TIME',
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontWeight: FontWeight.w400,
//                               fontSize: 14),
//                         ),
//                         const SizedBox(height: 8),
//                         Container(
//                           height: 50,
//                           child: OutlinedButton(
//                             onPressed: () => _selectTime(context),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   selectedTime == null
//                                       ? 'Select Time'
//                                       : selectedTime!.format(context),
//                                   style: const TextStyle(color: Colors.black),
//                                 ),
//                                 const Icon(Icons.access_time, size: 20),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 'MOBILE NUMBER',
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.w400,
//                     fontSize: 14),
//               ),
//               const SizedBox(height: 8),
//               TextFormField(
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey),
//                   ),
//                   contentPadding:
//                       EdgeInsets.symmetric(horizontal: 10, vertical: 15),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 'Select:',
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.w400,
//                     fontSize: 14),
//               ),
//               const SizedBox(height: 8),
//               DropdownButtonFormField<String>(
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey),
//                   ),
//                   contentPadding:
//                       EdgeInsets.symmetric(horizontal: 10, vertical: 15),
//                 ),
//                 value: selectedOption2,
//                 hint: const Text('Option 2'),
//                 items: ['Option A', 'Option B', 'Option C']
//                     .map((String value) => DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(value),
//                         ))
//                     .toList(),
//                 onChanged: (newValue) {
//                   setState(() {
//                     selectedOption2 = newValue;
//                   });
//                 },
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 'SELECT GLASS & FRAGILE ITEMS:',
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.w400,
//                     fontSize: 14),
//               ),
//               const SizedBox(height: 8),
//               DropdownButtonFormField<String>(
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey),
//                   ),
//                   contentPadding:
//                       EdgeInsets.symmetric(horizontal: 10, vertical: 15),
//                 ),
//                 value: selectedOption2,
//                 hint: const Text('Select Items'),
//                 items: ['Yes', 'No']
//                     .map((String value) => DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(value),
//                         ))
//                     .toList(),
//                 onChanged: (newValue) {
//                   setState(() {
//                     selectedOption2 = newValue;
//                   });
//                 },
//               ),
//               const SizedBox(height: 24),
//               Center(
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     fixedSize: Size(300, 45),
//                     backgroundColor: Color(0xff1D62F0),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                   ),
//                   onPressed: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => Success()));
//                   },
//                   child: Center(
//                     child: Text(
//                       'Get a Quote',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 17,
//                         fontWeight: FontWeight.w700,
//                       ),
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
