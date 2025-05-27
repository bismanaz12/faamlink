import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MapOptionsScreen extends StatefulWidget {
  const MapOptionsScreen({Key? key}) : super(key: key);

  @override
  State<MapOptionsScreen> createState() => _MapOptionsScreenState();
}

class _MapOptionsScreenState extends State<MapOptionsScreen> {
  bool autoRefreshResults = true;
  bool ignoreLocationWhenMovingMap = false;
  String selectedMapType = 'Standard';
  String selectedAdditional = 'Lorem';

  @override
  Widget build(BuildContext context) {
    // Get screen width for responsive sizing
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header with close button
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Color(0xffC8C7CC),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.close,
                                size: 18,
                                color: Color(0xff666666),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Map Options section
                    const Text(
                      'Map Options',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Auto refresh results toggle
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: const Text(
                            'Auto refresh results',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        CupertinoSwitch(
                          value: autoRefreshResults,
                          activeColor: Colors.green,
                          onChanged: (value) {
                            setState(() {
                              autoRefreshResults = value;
                            });
                          },
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Ignore location toggle
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: const Text(
                            'Ignore location when moving map',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        CupertinoSwitch(
                          value: ignoreLocationWhenMovingMap,
                          activeColor: Colors.green,
                          onChanged: (value) {
                            setState(() {
                              ignoreLocationWhenMovingMap = value;
                            });
                          },
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Map Type selection
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildMapTypeOption('Standard', screenWidth),
                        _buildMapTypeOption('Hybrid', screenWidth),
                        _buildMapTypeOption('Satellite', screenWidth),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Additional section
                    const Text(
                      'Additional',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Additional options list
                    _buildAdditionalOption('Lorem'),
                    _buildAdditionalOption('Lorem ipsum dolor'),
                    _buildAdditionalOption('Lorem ipsum'),
                    _buildAdditionalOption('Lorem ipsum'),

                    // Add extra padding at the bottom to avoid overlap with home indicator
                    SizedBox(height: screenHeight * 0.05),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMapTypeOption(String mapType, double screenWidth) {
    final bool isSelected = selectedMapType == mapType;
    // Calculate responsive width (e.g., 30% of screen width, capped at 104)
    final containerWidth = (screenWidth * 0.3).clamp(80.0, 104.0);
    final containerHeight = (containerWidth * 56 / 104).clamp(40.0, 56.0);

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMapType = mapType;
        });
      },
      child: Column(
        children: [
          Container(
            width: containerWidth,
            height: containerHeight,
            decoration: BoxDecoration(
              color: Color(0xffC8C7CC),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                '${containerWidth.round()} x ${containerHeight.round()}',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Icon(
                  isSelected ? Icons.check_circle : Icons.circle_outlined,
                  color: isSelected
                      ? Color(0xff4CD964)
                      : const Color.fromARGB(255, 196, 193, 193),
                  size: 18,
                ),
              ),
              Text(
                mapType,
                style: TextStyle(
                  color: isSelected ? Colors.black : Colors.black54,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildAdditionalOption(String option) {
    final bool isSelected = selectedAdditional == option;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedAdditional = option;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              option,
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
            if (isSelected)
              const Icon(
                Icons.check,
                color: Color(0xff1D62F0),
                size: 20,
              ),
          ],
        ),
      ),
    );
  }
}
