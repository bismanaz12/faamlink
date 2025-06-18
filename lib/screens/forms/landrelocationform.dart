import 'package:faam_link/screens/succesfulscreen.dart';
import 'package:flutter/material.dart';

class Landrelocationform extends StatefulWidget {
  const Landrelocationform({super.key});

  @override
  _LandrelocationformState createState() => _LandrelocationformState();
}

class _LandrelocationformState extends State<Landrelocationform> {
  String?
      selectedTransportType; // Correctly declared as a nullable instance variable
  String?
      selectedVehicleService; // Vehicle/Service selection based on transport type
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  bool? isSurveyNeeded = false; // Added for survey toggle

  // Controllers for form fields
  final TextEditingController movingFromController = TextEditingController();
  final TextEditingController movingToController = TextEditingController();
  final TextEditingController contactPersonLoadingController =
      TextEditingController();
  final TextEditingController contactPersonDeliveryController =
      TextEditingController();
  final TextEditingController commodityController = TextEditingController();
  final TextEditingController cargoWeightController = TextEditingController();
  final TextEditingController totalPackagesController = TextEditingController();
  final TextEditingController loadingTimeDateController =
      TextEditingController();
  final TextEditingController cargoCommercialRateController =
      TextEditingController();
  final TextEditingController cargoInsuranceController =
      TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        loadingTimeDateController.text =
            '${picked.day}/${picked.month}/${picked.year}';
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
        loadingTimeDateController.text += ' ${picked.format(context)}';
      });
    }
  }

  // Get vehicle/service options based on transport type
  List<String> getVehicleServiceOptions() {
    if (selectedTransportType == 'Local within UAE') {
      return ['1 Ton', '3 Ton', '7 Ton', '10 Ton', '12 meter trailer'];
    } else if (selectedTransportType == 'GCC') {
      return ['3 Ton', '7 Ton', '10 Ton', '12 meter trailer'];
    }
    return [];
  }

  // Helper method to get the appropriate hint text based on transport type
  String getLocationHintText() {
    return selectedTransportType == 'GCC'
        ? 'Enter Area, City, and Country'
        : 'Enter Area and City';
  }

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
                      'Land Freight Form',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth * 0.08,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),

                    // Step 1: Method of Land Freight
                    const Text(
                      'METHOD OF LAND FREIGHT:',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedTransportType,
                          hint: const Text('Select Transport Type'),
                          isExpanded: true,
                          items: const [
                            DropdownMenuItem(
                              value: 'Local within UAE',
                              child: Row(
                                children: [
                                  Icon(Icons.local_shipping,
                                      color: Colors.blue),
                                  SizedBox(width: 8),
                                  Text('Local within UAE'),
                                ],
                              ),
                            ),
                            DropdownMenuItem(
                              value: 'GCC',
                              child: Row(
                                children: [
                                  Icon(Icons.public, color: Colors.green),
                                  SizedBox(width: 8),
                                  Text('GCC Countries'),
                                ],
                              ),
                            ),
                          ],
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedTransportType = newValue;
                              selectedVehicleService = null;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    if (selectedTransportType != null) ...[
                      const Text(
                        'TRUCK TYPE:',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 6),
                      DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 12),
                        ),
                        value: selectedVehicleService,
                        hint: const Text('Select Truck Type'),
                        isExpanded: true,
                        items: getVehicleServiceOptions()
                            .map((String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                ))
                            .toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedVehicleService = newValue;
                          });
                        },
                      ),
                      SizedBox(height: screenHeight * 0.015),
                    ],

                    // Step 2: Loading From
                    const Text(
                      'LOADING FROM:',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: movingFromController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 12),
                        suffixIcon:
                            const Icon(Icons.location_on, color: Colors.grey),
                        hintText: getLocationHintText(),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),

                    // Step 3: Delivery To
                    const Text(
                      'DELIVERY TO:',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: movingToController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 12),
                        suffixIcon:
                            const Icon(Icons.location_on, color: Colors.grey),
                        hintText: getLocationHintText(),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),

                    // Step 4: Commodity
                    const Text(
                      'COMMODITY:',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: commodityController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                        hintText: 'Enter Commodity Description',
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),

                    // Step 5: Cargo Weight
                    const Text(
                      'CARGO WEIGHT:',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: cargoWeightController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                        hintText: 'Enter Weight (kg)',
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),

                    // Step 6: Total Packages
                    const Text(
                      'TOTAL PACKAGES:',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: totalPackagesController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                        hintText: 'Enter Total Packages',
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),

                    // Step 7: Loading Time & Date
                    const Text(
                      'LOADING TIME & DATE:',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: loadingTimeDateController,
                      readOnly: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                        suffixIcon:
                            Icon(Icons.calendar_today, color: Colors.grey),
                      ),
                      onTap: () async {
                        await _selectDate(context);
                        if (selectedDate != null && selectedTime != null)
                          return;
                        await _selectTime(context);
                      },
                    ),
                    SizedBox(height: screenHeight * 0.015),

                    // Step 8: Cargo Commercial Rate (only for GCC)
                    if (selectedTransportType == 'GCC') ...[
                      const Text(
                        'CARGO COMMERCIAL RATE:',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: cargoCommercialRateController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 12),
                          hintText: 'Enter Commercial Rate',
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.015),
                    ],

                    // Step 9: Cargo Insurance (only for GCC)
                    if (selectedTransportType == 'GCC') ...[
                      const Text(
                        'CARGO INSURANCE:',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: cargoInsuranceController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 12),
                          hintText: 'Enter Insurance Details',
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.015),
                    ],

                    // Step 8 for UAE, Step 10 for GCC: Contact Person Number for Loading
                    const Text(
                      'CONTACT PERSON NUMBER FOR LOADING:',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: contactPersonLoadingController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                        suffixIcon: Icon(Icons.phone, color: Colors.grey),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),

                    // Step 9 for UAE, Step 11 for GCC: Contact Person Number for Delivery
                    const Text(
                      'CONTACT PERSON NUMBER FOR DELIVERY:',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: contactPersonDeliveryController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                        suffixIcon: Icon(Icons.phone, color: Colors.grey),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),

                    // Step 10 for UAE, Step 12 for GCC: Choose an Option
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
                        const Expanded(
                          child: Text(
                            'Not Sure? Book a Survey for Accurate Quote',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
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
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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

                    // Step 11 for UAE, Step 13 for GCC: Buttons
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
