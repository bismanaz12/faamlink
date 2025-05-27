import 'package:flutter/material.dart';

class Message {
  final String text;
  final bool isSentByMe;
  final DateTime time;

  Message({
    required this.text,
    required this.isSentByMe,
    required this.time,
  });
}

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Message> _messages = [
    Message(
      text:
          "actually I'm more interested in the first house, but if the price can be cheaper?",
      isSentByMe: true,
      time: DateTime(2023, 1, 1, 10, 11),
    ),
    Message(
      text: "OK!",
      isSentByMe: false,
      time: DateTime(2023, 1, 1, 11, 23),
    ),
    Message(
      text: "we will talk about it later",
      isSentByMe: false,
      time: DateTime(2023, 1, 1, 11, 23),
    ),
    Message(
      text: "WOW Mex, this will be fun",
      isSentByMe: true,
      time: DateTime(2023, 1, 1, 11, 35),
    ),
    Message(
      text:
          "I really like the home with industrial style with green plants that are natural and fresh",
      isSentByMe: true,
      time: DateTime(2023, 1, 1, 11, 35),
    ),
    Message(
      text: "yeah, I agree with you",
      isSentByMe: false,
      time: DateTime(2023, 1, 1, 11, 42),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: SafeArea(
        child: Column(
          children: [
            // App bar
            _buildAppBar(),

            // Messages
            Expanded(
              child: _buildMessageList(),
            ),

            // Input field
            _buildMessageInput(),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
      ),
      child: Row(
        children: [
          const SizedBox(width: 4),
          IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
              size: 20,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(width: 8),
          Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text(
                "OG",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Olivia Gallagher",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      height: 8,
                      width: 8,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "Active now",
                      style: TextStyle(
                        color: Color(0xff8C8C8C),
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.phone,
              color: Colors.black,
              size: 20,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: _messages.length,
      itemBuilder: (context, index) {
        final message = _messages[index];
        final showTime = index == 0 ||
            _messages[index].time.hour != _messages[index - 1].time.hour ||
            _messages[index].time.minute != _messages[index - 1].time.minute ||
            _messages[index].isSentByMe != _messages[index - 1].isSentByMe;

        // Group consecutive messages from the same sender
        final isLastInGroup = index == _messages.length - 1 ||
            _messages[index + 1].isSentByMe != message.isSentByMe;

        return _buildMessageItem(message, showTime, isLastInGroup);
      },
    );
  }

  Widget _buildMessageItem(Message message, bool showTime, bool isLastInGroup) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2.0),
      child: Row(
        mainAxisAlignment: message.isSentByMe
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (message.isSentByMe) const Spacer(),

          // Message bubble
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            child: Column(
              crossAxisAlignment: message.isSentByMe
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: message.isSentByMe
                        ? Color(0xff1D62F0)
                        : Color(0xffDADADA),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Text(
                    message.text,
                    style: TextStyle(
                      color: message.isSentByMe ? Colors.white : Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),

                // Time
                if (showTime && isLastInGroup)
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0, bottom: 8.0),
                    child: Text(
                      _formatTime(message.time),
                      style: TextStyle(
                        color: Color(0xff858E99),
                        fontSize: 11,
                      ),
                    ),
                  ),
              ],
            ),
          ),

          if (!message.isSentByMe) const Spacer(),
        ],
      ),
    );
  }

  String _formatTime(DateTime time) {
    final hour = time.hour > 12 ? time.hour - 12 : time.hour;
    final period = time.hour >= 12 ? 'PM' : 'AM';
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute $period';
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey[200]!),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            icon:
                const Icon(Icons.add_circle_outline, color: Color(0xff1D62F0)),
            onPressed: () {},
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Color(0xffEFEFF4),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: "Write a comment",
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Color(0xff8A8A8F)),
                ),
              ),
            ),
          ),
          IconButton(
            icon:
                const Icon(Icons.camera_alt_outlined, color: Color(0xff1D62F0)),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
