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
  String? selectedRelocationType;
  String? selectedFragileItems;
  String? selectedTransportMethod;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  bool? isSurveyNeeded = false;

  // Text controllers for input fields
  final TextEditingController movingFromController = TextEditingController();
  final TextEditingController movingToController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController fragileItemsController = TextEditingController();
  final TextEditingController cargoMediaController = TextEditingController();
  final TextEditingController otherController = TextEditingController();

  // State for checkboxes (for listing items)
  bool furniture = false;
  bool electronics = false;
  bool kitchenware = false;
  bool clothing = false;
  bool documents = false;
  bool appliances = false;
  bool books = false;
  bool personalItems = false;
  bool other = false;

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

  // Validate form before submission
  bool _validateForm() {
    if (movingFromController.text.isEmpty ||
        movingToController.text.isEmpty ||
        selectedTransportMethod == null ||
        mobileController.text.isEmpty ||
        emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all required fields')),
      );
      return false;
    }
    return true;
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
                'International Relocation Form',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 43,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 16),
              // Step 1: Moving From (Area + City + Country)
              const Text(
                'MOVING FROM (AREA + CITY + COUNTRY): *',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: movingFromController,
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
              // Step 2: Moving To (Area + City + Country)
              const Text(
                'MOVING TO (AREA + CITY + COUNTRY): *',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: movingToController,
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
              // Step 3: Transport Method Selection
              const Text(
                'TRANSPORT METHOD: *',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
              const SizedBox(height: 8),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey), // Match TextFormField
                  borderRadius: BorderRadius.circular(4),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedTransportMethod,
                    hint: const Text('Select Transport Method (Required)'),
                    isExpanded: true,
                    items: const [
                      DropdownMenuItem(
                        value: 'Air',
                        child: Row(
                          children: [
                            Icon(Icons.flight, color: Colors.blue),
                            SizedBox(width: 8),
                            Text('Move by Air'),
                          ],
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'Sea',
                        child: Row(
                          children: [
                            Icon(Icons.directions_boat, color: Colors.teal),
                            SizedBox(width: 8),
                            Text('Move by Sea'),
                          ],
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'Road',
                        child: Row(
                          children: [
                            Icon(Icons.local_shipping, color: Colors.green),
                            SizedBox(width: 8),
                            Text('Move by Road'),
                          ],
                        ),
                      ),
                    ],
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedTransportMethod = newValue;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Step 4: Mobile Number + Email Address
              const Text(
                'MOBILE NUMBER: *',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: mobileController,
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
                'EMAIL ADDRESS: *',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                ),
              ),
              const SizedBox(height: 16),
              // Step 5: Moving Date with Time
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
              // Step 6: List Down All Items (Cases)
              const Text(
                'LIST DOWN ALL ITEMS (CASES):',
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
                      'Furniture (Beds, Sofas, Tables)', furniture, (value) {
                    setState(() {
                      furniture = value!;
                    });
                  }),
                  _buildCustomCheckbox(
                      'Electronics (TV, Computer, Speakers)', electronics,
                      (value) {
                    setState(() {
                      electronics = value!;
                    });
                  }),
                  _buildCustomCheckbox(
                      'Kitchenware (Utensils, Crockery)', kitchenware, (value) {
                    setState(() {
                      kitchenware = value!;
                    });
                  }),
                  _buildCustomCheckbox('Clothing', clothing, (value) {
                    setState(() {
                      clothing = value!;
                    });
                  }),
                  _buildCustomCheckbox(
                      'Documents (Passports, Certificates)', documents,
                      (value) {
                    setState(() {
                      documents = value!;
                    });
                  }),
                  _buildCustomCheckbox(
                      'Appliances (Fridge, Microwave, Oven)', appliances,
                      (value) {
                    setState(() {
                      appliances = value!;
                    });
                  }),
                  _buildCustomCheckbox('Books', books, (value) {
                    setState(() {
                      books = value!;
                    });
                  }),
                  _buildCustomCheckbox(
                      'Personal Items (Jewelry, Toys)', personalItems, (value) {
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
              // Step 7: List Down Fragile, Glass, or Any Unstackable Item
              const Text(
                'LIST DOWN FRAGILE, GLASS, OR ANY UNSTACKABLE ITEM:',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: fragileItemsController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  hintText: 'Specify Fragile/Glass/Unstackable Items',
                ),
              ),
              const SizedBox(height: 16),
              // Step 8: Provide Cargo Pictures or Short Video (If Possible)
              const Text(
                'PROVIDE CARGO PICTURES OR SHORT VIDEO (IF POSSIBLE):',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: cargoMediaController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  hintText: 'Provide links or descriptions (if possible)',
                ),
              ),
              const SizedBox(height: 16),
              // Step 9: Book a Survey or Get Competitive Quote
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
                  const Expanded(
                    child: Text(
                      'Not Sure? Book a Survey for Accurate & Competitive Quote',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
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
                        if (_validateForm()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Success(
                                formData: {
                                  'movingFrom': movingFromController.text,
                                  'movingTo': movingToController.text,
                                  'transportMethod': selectedTransportMethod,
                                  'mobile': mobileController.text,
                                  'email': emailController.text,
                                  'movingDate': selectedDate,
                                  'movingTime': selectedTime,
                                  'items': {
                                    'furniture': furniture,
                                    'electronics': electronics,
                                    'kitchenware': kitchenware,
                                    'clothing': clothing,
                                    'documents': documents,
                                    'appliances': appliances,
                                    'books': books,
                                    'personalItems': personalItems,
                                    'other':
                                        other ? otherController.text : null,
                                  },
                                  'fragileItems': fragileItemsController.text,
                                  'cargoMedia': cargoMediaController.text,
                                  'isSurveyNeeded': isSurveyNeeded,
                                },
                              ),
                            ),
                          );
                        }
                      },
                      child: const Center(
                        child: Text(
                          'Get Competitive Quote',
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
                          if (_validateForm()) {
                            // Add logic for booking a survey
                          }
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
        Flexible(child: Text(label)),
      ],
    );
  }
}

// Success screen placeholder (update as needed)
class Success extends StatelessWidget {
  final Map<String, dynamic>? formData;

  const Success({super.key, this.formData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Submission Successful')),
      body: Center(
        child: Text(
          'Form Submitted!\nTransport Method: ${formData?['transportMethod'] ?? 'Not selected'}',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
