import 'package:faam_link/screens/succesfulscreen.dart';
import 'package:flutter/material.dart';

class Expressdeliveryform extends StatefulWidget {
  const Expressdeliveryform({super.key});

  @override
  _ExpressdeliveryformState createState() => _ExpressdeliveryformState();
}

class _ExpressdeliveryformState extends State<Expressdeliveryform> {
  String? selectedLocation;
  String? selectedDeliveryType;
  String? selectedDeliveryTime;
  String? selectedPickupPoint;
  String? selectedDeliveryPoint;
  String? selectedPackageType;
  String? selectedCommodity;
  String? selectedPackingRequired;
  String? selectedQuantity;

  final TextEditingController emailController = TextEditingController();
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
                Text(
                  'Express Delivery',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: screenWidth * 0.08,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: screenHeight * 0.015),
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
                      selectedDeliveryType = null;
                      selectedDeliveryTime = null;
                    });
                  },
                ),
                SizedBox(height: screenHeight * 0.015),
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
                        items: ['Bike', 'Van']
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
                if (selectedLocation == 'Dubai' && selectedDeliveryType != null)
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
                Center(
                  child: ElevatedButton(
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
