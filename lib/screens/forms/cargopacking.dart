import 'package:flutter/material.dart';

class CargoPackagingForm extends StatefulWidget {
  const CargoPackagingForm({super.key});

  @override
  _CargoPackagingFormState createState() => _CargoPackagingFormState();
}

class _CargoPackagingFormState extends State<CargoPackagingForm> {
  String? selectedPackagingType;
  String? movingFrom;
  String? movingTo;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String? mobileNumber;
  String? additionalNotes;

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
        resizeToAvoidBottomInset:
            true, // Ensures content adjusts when keyboard opens
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
          child: LayoutBuilder(builder: (context, constraints) {
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
                        fontSize:
                            screenWidth * 0.08, // Slightly reduced font size
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Select Packaging Type:',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      constraints: BoxConstraints(
                          maxHeight: screenHeight * 0.25), // Reduced height
                      child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 12),
                        ),
                        value: selectedPackagingType,
                        hint: const Text('Select Packaging Type'),
                        isExpanded: true,
                        items: [
                          'Email',
                          'WhatsApp',
                          'Drums',
                          'Tight-head Metal Barrels',
                          'Wooden Boxes with Shock Absorption Pads',
                          'DG Cargo Packing',
                          'Shrink Wrap',
                          'Wooden Pallets/Crates',
                          'Industrial Cargo Packing',
                          'Bubble/Shrink Wrap',
                          'Project Cargo Packing',
                          'Flat Rack Containers',
                          'Insulated Containers',
                          'Heat Shrink Wrapping',
                          'Vacuum Packing',
                          'Hot Stamping',
                          'Container Lashing Services',
                          'Export Packaging (Corrugated Boxes)'
                        ]
                            .map((String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                ))
                            .toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedPackagingType = newValue;
                          });
                        },
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
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                      ),
                      onChanged: (value) => movingFrom = value,
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
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                      ),
                      onChanged: (value) => movingTo = value,
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
                                height: 45, // Reduced height
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
                                height: 45, // Reduced height
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
                      'MOBILE NUMBER',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                      ),
                      onChanged: (value) => mobileNumber = value,
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    const Text(
                      'ADDITIONAL NOTES',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      maxLines: 2, // Reduced lines to save space
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                      ),
                      onChanged: (value) => additionalNotes = value,
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
                          // Add navigation or submission logic here
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
                    SizedBox(
                        height:
                            screenHeight * 0.02), // Extra padding at the bottom
                  ],
                ),
              ),
            );
          }),
        ));
  }
}
