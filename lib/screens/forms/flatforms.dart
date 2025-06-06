import 'package:faam_link/screens/succesfulscreen.dart';
import 'package:flutter/material.dart';

class FlatFormScreen extends StatefulWidget {
  const FlatFormScreen({super.key});

  @override
  _FlatFormScreenState createState() => _FlatFormScreenState();
}

class _FlatFormScreenState extends State<FlatFormScreen> {
  String? selectedService;
  String? selectedBHK;
  String? selectedFragileItems;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  bool? isSurveyNeeded = false;
  bool isFullHousehold = false;
  bool isItemsDown = false;

  // Variables for items list
  bool furniture = false;
  bool sofa = false;
  bool wallPaintings = false;
  bool curtains = false;
  bool cupboards = false;
  // Add more item variables as needed for the checklist

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
                'Flat Shifting Form',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 43,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 16),
              // Point 1: Moving From (City + Area)
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
              // Point 2: Moving To (City + Area)
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
              // Point 3: Mobile Number
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
              // Point 4: Moving Date & Time
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
              // Select Flat Type (Studio, 1 BHK, 2 BHK, 3 BHK)
              const Text(
                'SELECT FLAT TYPE:',
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
                value: selectedBHK,
                hint: const Text('Select Option'),
                items: ['Studio', '1 BHK', '2 BHK', '3 BHK']
                    .map((String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ))
                    .toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedBHK = newValue;
                  });
                },
              ),
              const SizedBox(height: 16),
              // Point 5: Select Services (Full Household or Items Down)
              const Text(
                'SELECT SERVICES:',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8.0,
                children: [
                  FilterChip(
                    label: const Text('Full Household Shifting'),
                    onSelected: (bool value) {
                      setState(() {
                        isFullHousehold = value;
                      });
                    },
                    selected: isFullHousehold,
                  ),
                  FilterChip(
                    label: const Text('Few Items Shifting'),
                    onSelected: (bool value) {
                      setState(() {
                        isItemsDown = value;
                      });
                    },
                    selected: isItemsDown,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Point 6: Select Glass & Fragile Items
              const Text(
                'SELECT GLASS & FRAGILE ITEMS:',
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
                value: selectedFragileItems,
                hint: const Text('Select Items'),
                items: ['Yes', 'No']
                    .map((String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ))
                    .toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedFragileItems = newValue;
                  });
                },
              ),
              const SizedBox(height: 16),
              // Point 7: List Down All Items (Checklist for Studio, 1BHK, 2BHK, 3BHK)
              const Text(
                'LIST DOWN ALL ITEMS:',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Furniture
                  CheckboxListTile(
                    title: const Text(
                        'Furniture (Fridge, Dishwasher, Microwave, Cooking Range, King/Queen Size Bed, Kids Bed)'),
                    value: furniture,
                    onChanged: (bool? value) {
                      setState(() {
                        furniture = value ?? false;
                      });
                    },
                  ),
                  // Sofa, Dining Table, etc.
                  CheckboxListTile(
                    title: const Text(
                        'Sofa, Dining Table, Centre Table, TV Table, Console Table, Arm Chairs'),
                    value: sofa,
                    onChanged: (bool? value) {
                      setState(() {
                        sofa = value ?? false;
                      });
                    },
                  ),
                  // Wall Paintings
                  CheckboxListTile(
                    title: const Text(
                        'Wall Paintings, Fragile Items, Decorations, Plants, Table Lamps'),
                    value: wallPaintings,
                    onChanged: (bool? value) {
                      setState(() {
                        wallPaintings = value ?? false;
                      });
                    },
                  ),
                  // Curtains
                  CheckboxListTile(
                    title: const Text(
                        'Curtains, Kitchen Items, Utensils, Dinner Sets, Crockery & Other Kitchen Appliances'),
                    value: curtains,
                    onChanged: (bool? value) {
                      setState(() {
                        curtains = value ?? false;
                      });
                    },
                  ),
                  // Cupboards
                  CheckboxListTile(
                    title: const Text(
                        'Cupboards, Wardrobes, Kids Wardrobes, Study Table, Dresser'),
                    value: cupboards,
                    onChanged: (bool? value) {
                      setState(() {
                        cupboards = value ?? false;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Additional Items (Text Field for Custom Input)
              const Text(
                'ADDITIONAL ITEMS (IF ANY):',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
              const SizedBox(height: 8),
              TextFormField(
                maxLines: 3,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                ),
              ),
              const SizedBox(height: 16),
              // Book a Survey or Get Immediate Quote
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
}
