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

  // Collection address controllers
  final TextEditingController collectionAddressController =
      TextEditingController();
  final TextEditingController collectionPostalCodeController =
      TextEditingController();

  // Commodity controllers
  final TextEditingController commodityController = TextEditingController();
  final TextEditingController hsCodeController = TextEditingController();

  // Cargo details controllers
  final TextEditingController numberOfPackagesController =
      TextEditingController();
  final TextEditingController lengthController = TextEditingController();
  final TextEditingController widthController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController grossWeightController = TextEditingController();
  final TextEditingController netWeightController = TextEditingController();
  final TextEditingController volumeWeightController = TextEditingController();

  // Delivery address controllers
  final TextEditingController cargoDeliveryAddressController =
      TextEditingController();
  final TextEditingController deliveryPostalCodeController =
      TextEditingController();

  // Contact controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController whatsappController =
      TextEditingController(text: '052-823-5278');

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

                    // Step 5: Collection Address with Postal Code
                    const Text(
                      'COLLECTION ADDRESS:',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: collectionAddressController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                        suffixIcon: Icon(Icons.location_on, color: Colors.grey),
                        hintText: 'Enter collection address',
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),

                    const Text(
                      'COLLECTION POSTAL CODE:',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: collectionPostalCodeController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                        hintText: 'Enter postal code',
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),

                    // Step 6: Commodity with H.S Code
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
                        hintText: 'Enter commodity description',
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),

                    const Text(
                      'H.S CODE:',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: hsCodeController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                        hintText: 'Enter H.S Code',
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),

                    // Step 7: Cargo Details
                    Text(
                      'CARGO DETAILS:',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),

                    // Step 8: Number of Packages/Cartons/Pallets
                    const Text(
                      'NUMBER OF PACKAGES/CARTONS/PALLETS:',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: numberOfPackagesController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                        hintText: 'Enter number of packages',
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),

                    // Step 9: Dimensions of each package/carton/pallet
                    const Text(
                      'DIMENSIONS OF EACH PACKAGE/CARTON/PALLET (L X W X H IN CM):',
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
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 4),
                              TextFormField(
                                controller: lengthController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 10),
                                  hintText: 'Length',
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.02),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'WIDTH (W):',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 4),
                              TextFormField(
                                controller: widthController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 10),
                                  hintText: 'Width',
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.02),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'HEIGHT (H):',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 4),
                              TextFormField(
                                controller: heightController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 10),
                                  hintText: 'Height',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.015),

                    // Step 10: Gross Weight of each package/carton/pallet
                    const Text(
                      'GROSS WEIGHT OF EACH PACKAGE/CARTON/PALLET (KG):',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: grossWeightController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                        hintText: 'Enter gross weight (in kg)',
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),

                    // Step 11: Net Weight of each package/carton/pallet
                    const Text(
                      'NET WEIGHT OF EACH PACKAGE/CARTON/PALLET (KG):',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: netWeightController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                        hintText: 'Enter net weight (in kg)',
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),

                    // Step 12: Volume Weight
                    const Text(
                      'VOLUME WEIGHT (KG):',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: volumeWeightController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                        hintText: 'Enter volume weight (in kg)',
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),

                    // Step 13: Delivery Address with Postal Code
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
                        hintText: 'Enter delivery address',
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),

                    const Text(
                      'DELIVERY POSTAL CODE:',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: deliveryPostalCodeController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                        hintText: 'Enter delivery postal code',
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),

                    // Step 14: OR ... for rates

                    // Step 15: Choose an Option (Book a Survey or Get Immediate Quote)
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
                              'WhatsApp: 052-823-5278',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    SizedBox(height: screenHeight * 0.015),

                    // Step 16: Buttons (Get a Quote or Book a Survey)
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
