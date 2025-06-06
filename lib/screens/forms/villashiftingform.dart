import 'package:faam_link/screens/succesfulscreen.dart';
import 'package:flutter/material.dart';

class VillaFormScreen extends StatefulWidget {
  const VillaFormScreen({super.key});

  @override
  _VillaFormScreenState createState() => _VillaFormScreenState();
}

class _VillaFormScreenState extends State<VillaFormScreen> {
  String? selectedVillaType;
  String? selectedFragileItems;
  String? selectedFloors;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  bool? isSurveyNeeded = false;

  // State for checkboxes (for listing items, including fragile ones)
  bool lamps = false;
  bool microwaveOven = false;
  bool bowls = false;
  bool pillows = false;
  bool clocks = false;
  bool kitchenStove = false;
  bool vacuum = false;
  bool bedSheets = false;
  bool fridge = false;
  bool tv = false;
  bool electronics = false;
  bool bedSet = false;
  bool sofaSet = false;
  bool furniture = false;
  bool wardrobe = false;
  bool masterBed = false;
  bool singleBed = false;
  bool doubleBed = false;
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
                'Villa Shifting Form',
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
              // Point 4: Moving Time & Date
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
              // Select Villa Type (3BHK + 1-unit Villa, 4BHK + 1-unit Villa, 5BHK + 1-unit Villa, 6BHK+ Villa)
              const Text(
                'SELECT VILLA TYPE:',
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
                value: selectedVillaType,
                hint: const Text('Select Villa Type'),
                items: [
                  '3BHK + 1-unit Villa',
                  '4BHK + 1-unit Villa',
                  '5BHK + 1-unit Villa',
                  '6BHK+ Villa'
                ]
                    .map((String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ))
                    .toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedVillaType = newValue;
                  });
                },
              ),
              const SizedBox(height: 16),
              // Point 5: List Down All Items (Using the existing checkbox list)
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
                  _buildCustomCheckbox('Lamps', lamps, (value) {
                    setState(() {
                      lamps = value!;
                    });
                  }),
                  _buildCustomCheckbox('Microwave Oven', microwaveOven,
                      (value) {
                    setState(() {
                      microwaveOven = value!;
                    });
                  }),
                  _buildCustomCheckbox('Bowls', bowls, (value) {
                    setState(() {
                      bowls = value!;
                    });
                  }),
                  _buildCustomCheckbox('Pillows', pillows, (value) {
                    setState(() {
                      pillows = value!;
                    });
                  }),
                  _buildCustomCheckbox('Clocks', clocks, (value) {
                    setState(() {
                      clocks = value!;
                    });
                  }),
                  _buildCustomCheckbox('Kitchen Stove', kitchenStove, (value) {
                    setState(() {
                      kitchenStove = value!;
                    });
                  }),
                  _buildCustomCheckbox('Vacuum', vacuum, (value) {
                    setState(() {
                      vacuum = value!;
                    });
                  }),
                  _buildCustomCheckbox('Bed Sheets', bedSheets, (value) {
                    setState(() {
                      bedSheets = value!;
                    });
                  }),
                  _buildCustomCheckbox('Fridge', fridge, (value) {
                    setState(() {
                      fridge = value!;
                    });
                  }),
                  _buildCustomCheckbox('TV', tv, (value) {
                    setState(() {
                      tv = value!;
                    });
                  }),
                  _buildCustomCheckbox('Electronics', electronics, (value) {
                    setState(() {
                      electronics = value!;
                    });
                  }),
                  _buildCustomCheckbox('Bed Set', bedSet, (value) {
                    setState(() {
                      bedSet = value!;
                    });
                  }),
                  _buildCustomCheckbox('Sofa Set', sofaSet, (value) {
                    setState(() {
                      sofaSet = value!;
                    });
                  }),
                  _buildCustomCheckbox('Furniture', furniture, (value) {
                    setState(() {
                      furniture = value!;
                    });
                  }),
                  _buildCustomCheckbox('Wardrobe', wardrobe, (value) {
                    setState(() {
                      wardrobe = value!;
                    });
                  }),
                  _buildCustomCheckbox('Master Bed', masterBed, (value) {
                    setState(() {
                      masterBed = value!;
                    });
                  }),
                  _buildCustomCheckbox('Single Bed', singleBed, (value) {
                    setState(() {
                      singleBed = value!;
                    });
                  }),
                  _buildCustomCheckbox('Double Bed', doubleBed, (value) {
                    setState(() {
                      doubleBed = value!;
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
              // Point 6: List Down Fragile Items
              const Text(
                'LIST DOWN FRAGILE ITEMS:',
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
                hint: const Text('Select Fragile Items'),
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
              // Point 7: How Many Floors (With or Without Lift)
              const Text(
                'HOW MANY FLOORS (WITH OR WITHOUT LIFT):',
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
                value: selectedFloors,
                hint: const Text('Select Floors & Lift Availability'),
                items: [
                  'Ground + 1 (With Lift)',
                  'Ground + 1 (Without Lift)',
                  'Ground + 2 (With Lift)',
                  'Ground + 2 (Without Lift)',
                  'More Floors (With Lift)',
                  'More Floors (Without Lift)'
                ]
                    .map((String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ))
                    .toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedFloors = newValue;
                  });
                },
              ),
              const SizedBox(height: 16),
              // Point 8: Handyman & Unpacking Required
              const Text(
                'HANDYMAN & UNPACKING REQUIRED:',
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
                hint: const Text('Select Option'),
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

  Widget _buildCustomCheckbox(
      String label, bool value, Function(bool?) onChanged) {
    return Row(
      mainAxisSize: MainAxisSize.min,
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
        Text(label),
      ],
    );
  }
}
