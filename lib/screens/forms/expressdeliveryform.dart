import 'package:faam_link/screens/succesfulscreen.dart';
import 'package:flutter/material.dart';

class Expressdeliveryform extends StatefulWidget {
  const Expressdeliveryform({super.key});

  @override
  _ExpressdeliveryformState createState() => _ExpressdeliveryformState();
}

class _ExpressdeliveryformState extends State<Expressdeliveryform> {
  // State variables for selections
  String? selectedLocation;
  String? selectedDeliveryType; // Updated for Delivery Type (Car or Bike)
  String?
      selectedDeliveryTime; // Updated for Delivery Time (Same Day or Next Day)
  String? selectedPickupPoint;
  String? selectedDeliveryPoint;
  String? selectedPackageType;
  String? selectedCommodity;
  String? selectedPackingRequired;
  String? selectedQuantity;
  bool? isSurveyNeeded = false;

  // Controllers for text fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController whatsappController = TextEditingController();
  final TextEditingController weightDimensionController =
      TextEditingController();

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
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.06,
            vertical: screenHeight * 0.015,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Step 1: Form Title
                Text(
                  'Express Delivery',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: screenWidth * 0.08,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: screenHeight * 0.015),

                // Step 2: Select Location
                const Text(
                  'Location:',
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
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                  ),
                  value: selectedLocation,
                  hint: const Text('Select Location'),
                  isExpanded: true,
                  items: [
                    'Dubai',
                    'Sharjah',
                    'Ajman',
                    'Abu Dhabi',
                    'Ras Al Khaimah',
                    'Umm Al Quwain',
                    'Fujairah'
                  ]
                      .map((String value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          ))
                      .toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedLocation = newValue;
                      selectedDeliveryType = null; // Reset delivery type
                      selectedDeliveryTime = null; // Reset delivery time
                    });
                  },
                ),
                SizedBox(height: screenHeight * 0.015),

                // Step 3: Delivery Type (if Dubai is selected)
                if (selectedLocation == 'Dubai')
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Delivery Type:',
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
                        value: selectedDeliveryType,
                        hint: const Text('Select Delivery Type'),
                        isExpanded: true,
                        items: ['Car', 'Bike']
                            .map((String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                ))
                            .toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedDeliveryType = newValue;
                          });
                        },
                      ),
                      SizedBox(height: screenHeight * 0.015),
                    ],
                  ),

                // Step 4: Delivery Time (if Dubai is selected)
                if (selectedLocation == 'Dubai')
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Delivery Time:',
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
                        value: selectedDeliveryTime,
                        hint: const Text('Select Delivery Time'),
                        isExpanded: true,
                        items: ['Same Day', 'Next Day']
                            .map((String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                ))
                            .toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedDeliveryTime = newValue;
                          });
                        },
                      ),
                      SizedBox(height: screenHeight * 0.015),
                    ],
                  ),

                // Step 5: Pick up Point
                const Text(
                  'Pick up point:',
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
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                  ),
                  value: selectedPickupPoint,
                  hint: const Text('Select Pick up Point'),
                  isExpanded: true,
                  items: [
                    'Dubai',
                    'Sharjah',
                    'Ajman',
                    'Abu Dhabi',
                    'Ras Al Khaimah',
                    'Umm Al Quwain',
                    'Fujairah'
                  ]
                      .map((String value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          ))
                      .toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedPickupPoint = newValue;
                    });
                  },
                ),
                SizedBox(height: screenHeight * 0.015),

                // Step 6: Delivery Point
                const Text(
                  'Delivery point:',
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
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                  ),
                  value: selectedDeliveryPoint,
                  hint: const Text('Select Delivery Point'),
                  isExpanded: true,
                  items: [
                    'Dubai',
                    'Sharjah',
                    'Ajman',
                    'Abu Dhabi',
                    'Ras Al Khaimah',
                    'Umm Al Quwain',
                    'Fujairah'
                  ]
                      .map((String value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          ))
                      .toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedDeliveryPoint = newValue;
                    });
                  },
                ),
                SizedBox(height: screenHeight * 0.015),

                // Step 7: Package Type
                const Text(
                  'Package type:',
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
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                  ),
                  value: selectedPackageType,
                  hint: const Text('Select Package Type'),
                  isExpanded: true,
                  items: ['Box', 'Crate', 'Pallet', 'Bag']
                      .map((String value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          ))
                      .toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedPackageType = newValue;
                    });
                  },
                ),
                SizedBox(height: screenHeight * 0.015),

                // Step 8: Weight / Dimension
                const Text(
                  'Weight / Dimension:',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 6),
                TextFormField(
                  controller: weightDimensionController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    hintText:
                        'Enter Weight / Dimension (e.g., 5kg, 20x30x40cm)',
                  ),
                ),
                SizedBox(height: screenHeight * 0.015),

                // Step 9: Commodity
                const Text(
                  'Commodity:',
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
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                  ),
                  value: selectedCommodity,
                  hint: const Text('Select Commodity'),
                  isExpanded: true,
                  items: [
                    'Electronics',
                    'Clothing',
                    'Food',
                    'Documents',
                    'General cargo',
                    'others'
                  ]
                      .map((String value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          ))
                      .toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedCommodity = newValue;
                    });
                  },
                ),
                SizedBox(height: screenHeight * 0.015),

                // Step 10: Packing Required
                const Text(
                  'Packing required:',
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
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                  ),
                  value: selectedPackingRequired,
                  hint: const Text('Select Packing Required'),
                  isExpanded: true,
                  items: ['Yes', 'No']
                      .map((String value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          ))
                      .toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedPackingRequired = newValue;
                    });
                  },
                ),
                SizedBox(height: screenHeight * 0.015),

                // Step 11: Quantity
                const Text(
                  'Quantity:',
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
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                  ),
                  value: selectedQuantity,
                  hint: const Text('Select Quantity'),
                  isExpanded: true,
                  items: ['1', '2', '3', '4', '5', 'More']
                      .map((String value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          ))
                      .toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedQuantity = newValue;
                    });
                  },
                ),
                SizedBox(height: screenHeight * 0.015),

                // Step 12: Contact Details (Email and WhatsApp for Rates)
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

                // Step 13: Book a Survey Option
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

                // Step 14: Buttons (Get a Quote or Book a Survey)
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
                            MaterialPageRoute(builder: (context) => Success()),
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
        ),
      ),
    );
  }
}
