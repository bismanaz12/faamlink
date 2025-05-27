import 'package:faam_link/screens/succesfulscreen.dart';
import 'package:flutter/material.dart';

class StorageAndWarehousingScreen extends StatefulWidget {
  const StorageAndWarehousingScreen({super.key});

  @override
  _StorageAndWarehousingScreenState createState() =>
      _StorageAndWarehousingScreenState();
}

class _StorageAndWarehousingScreenState
    extends State<StorageAndWarehousingScreen> {
  String? selectedService;
  String? selectedDuration;
  String? selectedFragileItems;
  String? selectedTransportVia;
  String? selectedOfficeSize;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  // State for checkboxes
  bool lamps = false;
  bool microwaveOven = false;
  bool bowls = false;
  bool pillows = false;
  bool clocks = false;
  bool kitchenStove = false;
  bool vacuum = false;
  bool bedSheets = false;
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
                'Form',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 43,
                    fontWeight: FontWeight.w700),
              ),

              const SizedBox(height: 16),
              const Text(
                'Duration:',
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
                value: selectedDuration,
                hint: const Text('Daily'),
                items: ['Daily', 'Weekly', 'Monthly']
                    .map((String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ))
                    .toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedDuration = newValue;
                  });
                },
              ),
              const SizedBox(height: 16),
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
                          'TIME',
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
              const Text(
                'MOBILE NUMBER',
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
              const SizedBox(height: 24),
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Success()));
                  },
                  child: const Center(
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
              const SizedBox(height: 16),
              const Text(
                'OFFICE SIZE:',
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
                value: selectedOfficeSize,
                hint: const Text('Sqft'),
                items: ['1000 Sqft', '2000 Sqft', '3000 Sqft']
                    .map((String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ))
                    .toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedOfficeSize = newValue;
                  });
                },
              ),
              const SizedBox(height: 16),
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
              const Text(
                'TRANSPORT VIA:',
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
                value: selectedTransportVia,
                hint: const Text('Select Transport'),
                items: ['Air', 'Sea', 'Land']
                    .map((String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ))
                    .toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedTransportVia = newValue;
                  });
                },
              ),
              const SizedBox(height: 16),
              const Text(
                'LIST ALL ITEMS:',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
              const SizedBox(height: 8),
              // Responsive Wrap for Checkboxes
              Wrap(
                spacing: 16.0,
                runSpacing: 8.0,
                children: [
                  _buildCustomCheckbox('Lamps', lamps, (value) {
                    setState(() {
                      lamps = value!;
                    });
                  }),
                  _buildCustomCheckbox('Microwave oven', microwaveOven,
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
                  _buildCustomCheckbox('Kitchen stove', kitchenStove, (value) {
                    setState(() {
                      kitchenStove = value!;
                    });
                  }),
                  _buildCustomCheckbox('Vacuum', vacuum, (value) {
                    setState(() {
                      vacuum = value!;
                    });
                  }),
                  _buildCustomCheckbox('Bed sheets', bedSheets, (value) {
                    setState(() {
                      bedSheets = value!;
                    });
                  }),
                  _buildCustomCheckbox('Other', other, (value) {
                    setState(() {
                      other = value!;
                    });
                  }),
                ],
              ),
              if (other) // Show text field if "Other" is selected
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
                      hintText: 'Other',
                    ),
                  ),
                ),
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
