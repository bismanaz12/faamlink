import 'package:faam_link/screens/succesfulscreen.dart';
import 'package:flutter/material.dart';

class CargoPackagingForm extends StatefulWidget {
  const CargoPackagingForm({super.key});

  @override
  _CargoPackagingFormState createState() => _CargoPackagingFormState();
}

class _CargoPackagingFormState extends State<CargoPackagingForm> {
  String? selectedExport;
  String? selectedIndustrial;
  String? selectedHousehold;
  bool? isSurveyNeeded = false;

  // Controllers for form fields
  final TextEditingController lengthController = TextEditingController();
  final TextEditingController widthController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController whatsappController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        surfaceTintColor: const Color(0xffFFFFFF),
        shadowColor: const Color(0xffFFFFFF),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            size: 20,
          ),
        ),
        actions: const [
          Icon(
            Icons.more_vert,
            size: 20,
          ),
          SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.06,
              vertical: screenHeight * 0.015,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cargo Packaging Form',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: screenWidth * 0.08,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),

                  // Step 1: Export Packing
                  const Text(
                    'EXPORT PACKING:',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    constraints: BoxConstraints(maxHeight: screenHeight * 0.15),
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                      ),
                      value: selectedExport,
                      hint: const Text('Select Export Packing Type'),
                      isExpanded: true,
                      items: [
                        'Corrugated Boxes/Cartons',
                        'Wooden Pallets/Crates',
                        'Shrink Wrap & Stretch Wrap',
                        'DG Cargo Packing',
                        'Plywood/Wood Boxes with Shock Absorption Pads',
                        'Tight-head Metal Barrels & Cans',
                        'Drums & Bobbins'
                      ]
                          .map((String value) => DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              ))
                          .toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedExport = newValue;
                          selectedIndustrial = null; // Clear other selections
                          selectedHousehold = null;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),

                  // Step 2: Industrial Cargo Packing
                  const Text(
                    'INDUSTRIAL CARGO PACKING:',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    constraints: BoxConstraints(maxHeight: screenHeight * 0.15),
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                      ),
                      value: selectedIndustrial,
                      hint: const Text('Select Industrial Packing Type'),
                      isExpanded: true,
                      items: [
                        'Container Lashing Services',
                        'Heat Shrink Wrapping',
                        'Tape Vacuum Packing',
                        'Insulated Containers',
                        'Flat Rack Containers',
                        'Project Cargo Packing',
                        'Big Wooden Boxes'
                      ]
                          .map((String value) => DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              ))
                          .toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedIndustrial = newValue;
                          selectedExport = null; // Clear other selections
                          selectedHousehold = null;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),

                  // Step 3: Household Packing
                  const Text(
                    'HOUSEHOLD PACKING:',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    constraints: BoxConstraints(maxHeight: screenHeight * 0.15),
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                      ),
                      value: selectedHousehold,
                      hint: const Text('Select Household Packing Type'),
                      isExpanded: true,
                      items: [
                        'Shifting Packing',
                        'Fragile Packing',
                        'Wood Coating',
                        'Bubble/Shrink Wrap'
                      ]
                          .map((String value) => DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              ))
                          .toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedHousehold = newValue;
                          selectedExport = null; // Clear other selections
                          selectedIndustrial = null;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),

                  // Step 4: Cargo Details (L x W x H in cm)
                  const Text(
                    'CARGO DETAILS (L X W X H IN CM):',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'LENGTH (L):',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 6),
                            TextFormField(
                              controller: lengthController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 12),
                                hintText: 'Length (cm)',
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.03),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'WIDTH (W):',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 6),
                            TextFormField(
                              controller: widthController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 12),
                                hintText: 'Width (cm)',
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.03),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'HEIGHT (H):',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 6),
                            TextFormField(
                              controller: heightController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 12),
                                hintText: 'Height (cm)',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.015),

                  // Step 5: Weight
                  const Text(
                    'WEIGHT OF CARGO:',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 6),
                  TextFormField(
                    controller: weightController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                      hintText: 'Enter Weight (in kg)',
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),

                  // Step 6: Contact Details (Email and WhatsApp for Rates)
                  const Text(
                    'CONTACT DETAILS FOR RATES:',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 6),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                      hintText: 'Enter Email for Rates',
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  TextFormField(
                    controller: whatsappController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                      hintText: 'Enter WhatsApp (e.g., 058-823-5278)',
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),

                  // Step 7: Book a Survey or Get Immediate Quote
                  const Text(
                    'CHOOSE AN OPTION:',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Not Sure? Book a Survey',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      Switch(
                        value: isSurveyNeeded ?? false,
                        onChanged: (value) {
                          setState(() {
                            isSurveyNeeded = value;
                          });
                        },
                      ),
                    ],
                  ),
                  if (isSurveyNeeded == true)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Contact Admin for Survey:',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Email: admin@faamlink.com',
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            'WhatsApp: 058-823-5278',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  SizedBox(height: screenHeight * 0.015),

                  // Step 8: Buttons (Get a Quote or Book a Survey)
                  Center(
                    child: Column(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(300, 45),
                            backgroundColor: const Color(0xff1D62F0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Success()),
                            );
                          },
                          child: const Center(
                            child: Text(
                              'Get Immediate Quote',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        if (isSurveyNeeded == true)
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(300, 45),
                              backgroundColor: Colors.grey,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () {
                              // Add logic for booking a survey
                            },
                            child: const Center(
                              child: Text(
                                'Book a Survey',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
