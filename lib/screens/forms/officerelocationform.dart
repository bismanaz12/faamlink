import 'package:faam_link/screens/succesfulscreen.dart';
import 'package:flutter/material.dart';

class OfficeRelocationScreen extends StatefulWidget {
  const OfficeRelocationScreen({super.key});

  @override
  _OfficeRelocationScreenState createState() => _OfficeRelocationScreenState();
}

class _OfficeRelocationScreenState extends State<OfficeRelocationScreen> {
  String? selectedFragileItems;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  bool? isSurveyNeeded = false;
  final TextEditingController officeSizeController = TextEditingController();

  // State for checkboxes (for listing items)
  bool chairsTables = false;
  bool majorItems = false;
  bool glassPartition = false;
  bool heavyItems = false;
  bool officeFiles = false;
  bool other = false;
  final TextEditingController otherController = TextEditingController();

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
                'Office Relocation Form',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 43,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 16),

              // Step 1: Moving From (City + Area)
              const Text(
                'MOVING FROM (CITY & AREA):',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  suffixIcon: Icon(Icons.location_on, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 16),

              // Step 2: Moving To (City + Area)
              const Text(
                'MOVING TO (CITY & AREA):',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  suffixIcon: Icon(Icons.location_on, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 16),

              // Step 3: Mobile Number
              const Text(
                'MOBILE NUMBER:',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
              const SizedBox(height: 8),
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                ),
              ),
              const SizedBox(height: 16),

              // Step 4: Moving Date & Time
              const Text(
                'MOVING DATE & TIME:',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'MOVING DATE:',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          height: 50,
                          child: OutlinedButton(
                            onPressed: () => _selectDate(context),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  selectedDate == null
                                      ? 'Select Date'
                                      : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                                  style: const TextStyle(color: Colors.black),
                                ),
                                const Icon(Icons.calendar_today, size: 20),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'MOVING TIME:',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          height: 50,
                          child: OutlinedButton(
                            onPressed: () => _selectTime(context),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  selectedTime == null
                                      ? 'Select Time'
                                      : selectedTime!.format(context),
                                  style: const TextStyle(color: Colors.black),
                                ),
                                const Icon(Icons.access_time, size: 20),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Step 5: Office Size in Square Feet/Meters
              const Text(
                'OFFICE SIZE (SQUARE FEET/METERS):',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: officeSizeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  hintText: 'Enter Size',
                ),
              ),
              const SizedBox(height: 16),

              // Step 6: List Down All Items (Fixed Overflow)
              const Text(
                'LIST DOWN ALL ITEMS:',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 16.0,
                runSpacing: 8.0,
                children: [
                  _buildCustomCheckbox(
                      'Total Chairs & Type, Tables, Workstations, Conference Tables, Manager Tables',
                      chairsTables, (value) {
                    setState(() {
                      chairsTables = value!;
                    });
                  }),
                  _buildCustomCheckbox(
                      'Fridge, LCD, Printers, Server & Cabinets', majorItems,
                      (value) {
                    setState(() {
                      majorItems = value!;
                    });
                  }),
                  _buildCustomCheckbox(
                      'Glass Partition, Fragile Items, Paintings & Pictures, Plants',
                      glassPartition, (value) {
                    setState(() {
                      glassPartition = value!;
                    });
                  }),
                  _buildCustomCheckbox(
                      'Heavy Items, Lockers, Safe Box', heavyItems, (value) {
                    setState(() {
                      heavyItems = value!;
                    });
                  }),
                  _buildCustomCheckbox(
                      'Office Files, Documents, Kitchenware', officeFiles,
                      (value) {
                    setState(() {
                      officeFiles = value!;
                    });
                  }),
                  _buildCustomCheckbox('Other', other, (value) {
                    setState(() {
                      other = value!;
                    });
                  }),
                ],
              ),
              if (other)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextFormField(
                    controller: otherController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      hintText: 'Specify Other Items',
                    ),
                  ),
                ),
              const SizedBox(height: 16),

              // Step 7: Book a Survey or Get Immediate Quote
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
                        'WhatsApp: +1234567890',
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

  Widget _buildCustomCheckbox(
      String label, bool value, Function(bool?) onChanged) {
    return Container(
      width: MediaQuery.of(context).size.width *
          0.9, // Constrain width to 90% of screen
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              onChanged(!value);
            },
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: value ? Colors.green : Colors.transparent,
                border: Border.all(color: Colors.grey),
              ),
              child: value
                  ? const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 16,
                    )
                  : null,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(fontSize: 14),
              softWrap: true, // Allow text to wrap to the next line
            ),
          ),
        ],
      ),
    );
  }
}
