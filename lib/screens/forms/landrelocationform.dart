import 'package:faam_link/screens/succesfulscreen.dart';
import 'package:flutter/material.dart';

class Landrelocationform extends StatefulWidget {
  const Landrelocationform({super.key});

  @override
  _LandrelocationformState createState() => _LandrelocationformState();
}

class _LandrelocationformState extends State<Landrelocationform> {
  String? selectedService;
  String? selectedContainerSize;
  String? selectedOption2;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  // Controllers for form fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController whatsappController = TextEditingController();
  final TextEditingController contactPersonController = TextEditingController();
  final TextEditingController cargoPackagesController = TextEditingController();
  final TextEditingController commodityController = TextEditingController();
  final TextEditingController deliveryAddressController =
      TextEditingController();
  final TextEditingController loadingDetailsController =
      TextEditingController();
  final TextEditingController totalWeightController = TextEditingController();
  final TextEditingController areaCityCountryController =
      TextEditingController();
  final TextEditingController movingFromController = TextEditingController();
  final TextEditingController movingToController = TextEditingController();

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
                      'Form',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth * 0.08,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    const Text(
                      'MOVING FROM:',
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
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    const Text(
                      'MOVING TO:',
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
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'DATE',
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
                                'TIME',
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
                    const Text(
                      'EMAIL',
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
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    const Text(
                      'WHATSAPP',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: whatsappController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    const Text(
                      'CONTACT PERSON',
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
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    const Text(
                      'CARGO PACKAGES',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: cargoPackagesController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    const Text(
                      'COMMODITY DESCRIPTION',
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
                    const Text(
                      'DELIVERY ADDRESS',
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
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    const Text(
                      'LOADING DETAILS',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: loadingDetailsController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    const Text(
                      'TOTAL WEIGHT',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: totalWeightController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    const Text(
                      'AREA/CITY/COUNTRY',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: areaCityCountryController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),
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
                        items: ['20ft', '40ft', 'GCC']
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
                    SizedBox(height: screenHeight * 0.02),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(300, 45),
                          backgroundColor: Color(0xff1D62F0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Success()));
                        },
                        child: Center(
                          child: Text(
                            'Get a Quote',
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
            );
          },
        ),
      ),
    );
  }
}
