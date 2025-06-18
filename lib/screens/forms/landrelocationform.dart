import 'package:faam_link/screens/succesfulscreen.dart';
import 'package:flutter/material.dart';

class Landrelocationform extends StatefulWidget {
  const Landrelocationform({super.key});

  @override
  _LandrelocationformState createState() => _LandrelocationformState();
}

class _LandrelocationformState extends State<Landrelocationform> {
  String? selectedService;
  String? selectedTransportType; // New: Local UAE or GCC
  String? selectedVehicleService; // New: Vehicle/Service selection based on transport type
  String? selectedContainerSize;
  String? selectedLoadingType; // Added for Loading Type
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  bool? isSurveyNeeded = false; // Added for survey toggle

  // Controllers for form fields
  final TextEditingController movingFromController = TextEditingController();
  final TextEditingController movingToController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController whatsappController = TextEditingController();
  final TextEditingController contactPersonController = TextEditingController();
  final TextEditingController cargoPackagesController = TextEditingController();
  final TextEditingController commodityController = TextEditingController();
  final TextEditingController deliveryAddressController =
      TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();
  final TextEditingController loadingDetailsController =
      TextEditingController();
  final TextEditingController totalWeightController = TextEditingController();
  final TextEditingController loadingContactPersonController =
      TextEditingController(); // Added
  final TextEditingController deliveryContactPersonController =
      TextEditingController(); // Added for delivery contact

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
      });
    }
  }

  // Get vehicle/service options based on transport type
  List<String> getVehicleServiceOptions() {
    if (selectedTransportType == 'Local within UAE') {
      return ['1 Ton', '3 Ton', '7 Ton', '10 Ton', '12 meter trailer'];
    } else if (selectedTransportType == 'GCC') {
      return ['3 ton','7 ton', '10 ton', '12 meter trailer' ];
    }
    return [];
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

                    // NEW: Vehicle/Service Selection (appears after transport type is selected)
                   
                    SizedBox(height: screenHeight * 0.015),

                    // NEW: Transport Type Selection (Local UAE or GCC)
                    const Text(
                      'TRANSPORT TYPE:',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
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
                                  Icon(Icons.local_shipping, color: Colors.blue),
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
                              selectedVehicleService = null; // Reset vehicle/service selection
                              selectedContainerSize = null; // Reset container selection
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),
                     if (selectedTransportType != null) ...[
                      Text(
                        selectedTransportType == 'Local within UAE' 
                            ? 'SELECT VEHICLE/SERVICE TYPE:' 
                            : 'SELECT CONTAINER/VEHICLE TYPE:',
                        style: const TextStyle(
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
                        hint: Text(selectedTransportType == 'Local within UAE' 
                            ? 'Select Vehicle/Service Type' 
                            : 'Select Container/Vehicle Type'),
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

                    // Step 1: Moving From (Within/To Country)
                    const Text(
                      'MOVING FROM (WITHIN/TO COUNTRY):',
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
                        hintText: 'Enter Address or Location',
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),

                    // Step 2: Moving To (Within/To Country)
                    const Text(
                      'MOVING TO (WITHIN/TO COUNTRY):',
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
                        hintText: 'Enter Address or Location',
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),

                    // Step 3: Delivery Address
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
                      controller: deliveryAddressController,
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

                    // Step 4: Postal Code for Delivery Address
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

                    // Step 5: Moving Date & Time
                    const Text(
                      'MOVING DATE & TIME:',
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
                                'DATE:',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Container(
                                height: 45,
                                child: OutlinedButton(
                                  onPressed: () => _selectDate(context),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        selectedDate == null
                                            ? 'Select Date'
                                            : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                      const Icon(Icons.calendar_today,
                                          size: 18),
                                    ],
                                  ),
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
                                'TIME:',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Container(
                                height: 45,
                                child: OutlinedButton(
                                  onPressed: () => _selectTime(context),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        selectedTime == null
                                            ? 'Select Time'
                                            : selectedTime!.format(context),
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                      const Icon(Icons.access_time, size: 18),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.015),

                    // Step 6: Contact Person
                    const Text(
                      'CONTACT PERSON:',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: contactPersonController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                        suffixIcon: Icon(Icons.person, color: Colors.grey),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),

                    // Step 7: Mobile Number
                    const Text(
                      'MOBILE NUMBER:',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: mobileNumberController,
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

                    // Step 8: Commodity Description
                    const Text(
                      'COMMODITY DESCRIPTION:',
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
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),

                    // Step 9: Number of Cargo Packages
                    const Text(
                      'NUMBER OF CARGO PACKAGES:',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: cargoPackagesController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),

                    // Step 10: Total Weight
                    const Text(
                      'TOTAL WEIGHT (KG):',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: totalWeightController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),

                    // Step 11: Loading Details
                    const Text(
                      'LOADING DETAILS:',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'LOADING TYPE:',
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
                          value: selectedLoadingType,
                          hint: const Text('Select Loading Type'),
                          isExpanded: true,
                          items: ['Manual', 'Forklift']
                              .map((String value) => DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  ))
                              .toList(),
                          onChanged: (newValue) {
                            setState(() {
                              selectedLoadingType = newValue;
                            });
                          },
                        ),
                        SizedBox(height: screenHeight * 0.015),
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
                          controller: loadingContactPersonController,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 12),
                            suffixIcon: Icon(Icons.phone, color: Colors.grey),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.015),
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
                          controller: deliveryContactPersonController,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 12),
                            suffixIcon: Icon(Icons.phone, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.015),

                    // Step 12: Dynamic Container Size Selection (only for containers)
                    if (selectedVehicleService != null && 
                        (selectedVehicleService!.contains('Container') || selectedVehicleService == 'GCC Truck')) ...[
                      const Text(
                        'SELECT CONTAINER SIZE:',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        constraints:
                            BoxConstraints(maxHeight: screenHeight * 0.25),
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 12),
                          ),
                          value: selectedContainerSize,
                          hint: const Text('Select Container Size'),
                          isExpanded: true,
                          items: ['20ft', '40ft']
                              .map((String value) => DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  ))
                              .toList(),
                          onChanged: (newValue) {
                            setState(() {
                              selectedContainerSize = newValue;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.015),
                    ],

                    // Step 13: Contact Details for Rates
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

                    // Step 14: Book a Survey or Get Immediate Quote
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

                    // Step 15: Buttons (Get a Quote or Book a Survey)
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