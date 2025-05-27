import 'package:faam_link/screens/succesfulscreen.dart';
import 'package:flutter/material.dart';

class InternationalRelocationScreen extends StatefulWidget {
  const InternationalRelocationScreen({super.key});

  @override
  _InternationalRelocationScreenState createState() =>
      _InternationalRelocationScreenState();
}

class _InternationalRelocationScreenState
    extends State<InternationalRelocationScreen> {
  String? selectedService;
  String? selectedRelocationType;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  // State for checkboxes
  bool furniture = false;
  bool electronics = false;
  bool kitchenware = false;
  bool clothing = false;
  bool documents = false;
  bool appliances = false;
  bool books = false;
  bool personalItems = false;
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
                'MOVING FROM (CITY & COUNTRY):',
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
                'MOVING TO (CITY & COUNTRY):',
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
              const SizedBox(height: 16),
              const Text(
                'RELOCATION TYPE:',
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
                value: selectedRelocationType,
                hint: const Text('Select Relocation Type'),
                items: ['Personal', 'Business', 'Family']
                    .map((String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ))
                    .toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedRelocationType = newValue;
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
                  _buildCustomCheckbox('Furniture', furniture, (value) {
                    setState(() {
                      furniture = value!;
                    });
                  }),
                  _buildCustomCheckbox('Electronics', electronics, (value) {
                    setState(() {
                      electronics = value!;
                    });
                  }),
                  _buildCustomCheckbox('Kitchenware', kitchenware, (value) {
                    setState(() {
                      kitchenware = value!;
                    });
                  }),
                  _buildCustomCheckbox('Clothing', clothing, (value) {
                    setState(() {
                      clothing = value!;
                    });
                  }),
                  _buildCustomCheckbox('Documents', documents, (value) {
                    setState(() {
                      documents = value!;
                    });
                  }),
                  _buildCustomCheckbox('Appliances', appliances, (value) {
                    setState(() {
                      appliances = value!;
                    });
                  }),
                  _buildCustomCheckbox('Books', books, (value) {
                    setState(() {
                      books = value!;
                    });
                  }),
                  _buildCustomCheckbox('Personal Items', personalItems,
                      (value) {
                    setState(() {
                      personalItems = value!;
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
