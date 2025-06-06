import 'package:faam_link/screens/succesfulscreen.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  bool? isSurveyNeeded = false;

  // Controllers for form fields
  final TextEditingController movingFromController = TextEditingController();
  final TextEditingController movingToController = TextEditingController();
  final TextEditingController airportOfLoadingController =
      TextEditingController();
  final TextEditingController airportOfDischargeController =
      TextEditingController();
  final TextEditingController lengthController = TextEditingController();
  final TextEditingController widthController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController cargoDeliveryAddressController =
      TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();
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
        child: LayoutBuilder(
          builder: (context, constraints) {
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
                      'Air Freight Form',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth * 0.08,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),

                    // Step 1: Moving From (Country/City to/from UAE)
                    const Text(
                      'MOVING FROM (COUNTRY/CITY TO/FROM UAE):',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: movingFromController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                        suffixIcon: Icon(Icons.location_on, color: Colors.grey),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),

                    // Step 2: Moving To (Country/City to/from UAE)
                    const Text(
                      'MOVING TO (COUNTRY/CITY TO/FROM UAE):',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: movingToController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                        suffixIcon: Icon(Icons.location_on, color: Colors.grey),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),

                    // Step 3: Airport of Loading
                    const Text(
                      'AIRPORT OF LOADING:',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: airportOfLoadingController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                        suffixIcon:
                            Icon(Icons.flight_takeoff, color: Colors.grey),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),

                    // Step 4: Airport of Discharge
                    const Text(
                      'AIRPORT OF DISCHARGE:',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: airportOfDischargeController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                        suffixIcon: Icon(Icons.flight_land, color: Colors.grey),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),

                    // Step 5: Cargo Details (L x W x H in cm)
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

                    // Step 6: Weight
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

                    // Step 7: Delivery Address
                    const Text(
                      'DELIVERY ADDRESS:',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: cargoDeliveryAddressController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                        suffixIcon: Icon(Icons.location_on, color: Colors.grey),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),

                    // Step 8: Postal Code for Delivery Address
                    const Text(
                      'POSTAL CODE:',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: postalCodeController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),

                    // Step 9: Contact Details (Email and WhatsApp for Rates)
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

                    // Step 10: Book a Survey or Get Immediate Quote
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

                    // Step 11: Buttons (Get a Quote or Book a Survey)
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
          },
        ),
      ),
    );
  }
}
