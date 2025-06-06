import 'package:faam_link/screens/succesfulscreen.dart';
import 'package:flutter/material.dart';

class Seafreightform extends StatefulWidget {
  const Seafreightform({super.key});

  @override
  _SeafreightformState createState() => _SeafreightformState();
}

class _SeafreightformState extends State<Seafreightform> {
  String? selectedContainerType;
  bool? isSurveyNeeded = false;

  // Controllers for form fields
  final TextEditingController fromCountryController = TextEditingController();
  final TextEditingController toCountryController = TextEditingController();
  final TextEditingController portOfLoadingController = TextEditingController();
  final TextEditingController portOfDischargeController =
      TextEditingController();
  final TextEditingController collectionAddressController =
      TextEditingController();
  final TextEditingController commodityDetailsController =
      TextEditingController();
  final TextEditingController deliveryAddressController =
      TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController whatsappController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sea Freight Form',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 43,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 16),
              // Step 1: Sea Freight From/To Any Country (From UAE)
              const Text(
                'SEA FREIGHT FROM/TO ANY COUNTRY (FROM UAE):',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: fromCountryController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        hintText: 'From Country (UAE)',
                        suffixIcon: Icon(Icons.location_on, color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: toCountryController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        hintText: 'To Country',
                        suffixIcon: Icon(Icons.location_on, color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Step 2: Rates for 20ft & 40ft / Container Type
              const Text(
                'RATES FOR 20FT & 40FT / CONTAINER TYPE:',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                ),
                value: selectedContainerType,
                hint: const Text('Select Container Type'),
                items: ['20ft', '40ft']
                    .map((String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ))
                    .toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedContainerType = newValue;
                  });
                },
              ),
              const SizedBox(height: 16),
              // Step 3: Port of Loading (Added as requested)
              const Text(
                'PORT OF LOADING:',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: portOfLoadingController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  hintText: 'Enter Port of Loading',
                ),
              ),
              const SizedBox(height: 16),
              // Step 4: Port of Discharge
              const Text(
                'PORT OF DISCHARGE:',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: portOfDischargeController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  hintText: 'Enter Port of Discharge',
                ),
              ),
              const SizedBox(height: 16),
              // Step 5: Collection Address with Postal Code
              const Text(
                'COLLECTION ADDRESS WITH POSTAL CODE:',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: collectionAddressController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  hintText: 'Enter Collection Address',
                ),
              ),
              const SizedBox(height: 16),
              // Step 6: Commodity with H.S. Code
              const Text(
                'COMMODITY WITH H.S. CODE:',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: commodityDetailsController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  hintText: 'Enter Commodity & H.S. Code',
                ),
              ),
              const SizedBox(height: 16),
              // Step 7: Delivery Address with Postal Code
              const Text(
                'DELIVERY ADDRESS WITH POSTAL CODE:',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: deliveryAddressController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  hintText: 'Enter Delivery Address',
                ),
              ),
              const SizedBox(height: 16),
              // Step 8: Contact Details (Email and WhatsApp for Rates)
              const Text(
                'CONTACT DETAILS FOR RATES:',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  hintText: 'Enter Email for Rates',
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: whatsappController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  hintText: 'Enter WhatsApp (e.g., 058-823-5278)',
                ),
              ),
              const SizedBox(height: 16),
              // Step 9: Book a Survey or Get Immediate Quote
              const Text(
                'CHOOSE AN OPTION:',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Not Sure? Book a Survey',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
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
                            fontSize: 14),
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
              const SizedBox(height: 24),
              // Buttons: Get a Quote or Book a Survey
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
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
