import 'package:faam_link/screens/messagesscreen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:faam_link/widgets/callscontainer.dart';
import 'package:faam_link/widgets/connectscontainer.dart';

class Connects extends StatefulWidget {
  const Connects({super.key});

  @override
  State<Connects> createState() => _ConnectsState();
}

class _ConnectsState extends State<Connects>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Sample data for contacts
  final List<Map<String, dynamic>> _contacts = [
    {
      'name': 'Mexstuff Widstut',
      'message': 'How this awesome home can be price so...',
      'time': '11:20 AM',
      'hasUnread': true,
    },
    {
      'name': 'Ahzim Nakula',
      'message': 'For more let\'s talk over a cup of coffee in...',
      'time': 'Yesterday',
      'hasUnread': true,
    },
    {
      'name': 'Barbara Haque',
      'message': 'For more let\'s talk over a cup of coffee in...',
      'time': 'Tuesday',
      'hasUnread': false,
    },
    {
      'name': 'Oscar Meinhoff',
      'message': 'How this awesome home can be price so...',
      'time': 'Monday',
      'hasUnread': false,
    },
    {
      'name': 'Daniel Santio',
      'message': 'For more let\'s talk over a cup of coffee in...',
      'time': '4/25/27',
      'hasUnread': false,
    },
    {
      'name': 'Satriani Moonwalk',
      'message': 'For more let\'s talk over a cup of coffee in...',
      'time': '4/20/27',
      'hasUnread': false,
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              // Top row with "Find Agent" and settings icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Find Agent',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Icon(
                    Icons.settings,
                    color: Colors.black,
                    size: 20,
                  )
                ],
              ),
              const SizedBox(height: 10),
              // "Connect" title
              const Text(
                'Connect',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 20),

              TabBar(
                controller: _tabController,
                indicatorColor: Colors.blue,
                indicatorWeight: 3,
                labelColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.tab,
                unselectedLabelColor: Colors.black,
                tabs: const [
                  Tab(text: 'Chats'),
                  Tab(text: 'Calls'),
                ],
              ),

              const SizedBox(height: 15),
              // Search bar
              Container(
                height: 45,
                decoration: BoxDecoration(
                  color: const Color(0xFFEFEFF4),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.search,
                      color: Color(0xFF8A8A8F),
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Search',
                      style: TextStyle(
                        color: const Color(0xFF8A8A8F),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              // Tab content
              Expanded(
                child: TabBarView(
                  dragStartBehavior: DragStartBehavior.start,
                  controller: _tabController,
                  children: [
                    // Chats Tab
                    _buildChatsContainer(),
                    // Calls Tab
                    _buildCallsContainer(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChatsContainer() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: _contacts.length,
      itemBuilder: (context, index) {
        final contact = _contacts[index];
        return Connectscontainer();
      },
    );
  }

  Widget _buildCallsContainer() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Callscontainer(missed: index % 2 == 0);
      },
    );
  }
}
