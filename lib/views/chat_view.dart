import 'package:flutter/material.dart';
import 'package:flutter_application_19/chat_cubit/chat_cubit.dart';
import 'package:flutter_application_19/chat_cubit/chat_states.dart';
import 'package:flutter_application_19/views/widgets/custom_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/chat_service.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  List<dynamic> mesages = [
    {
      "role": "developer",
      "content": "You are a helpful assistant.",
    },
  ];
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void rebuild() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocProvider(
          create: (context) => ChatCubit(),
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<ChatCubit, ChatStates>(
                  builder: (context, state) {
                    return ListView.builder(
                        itemCount: mesages.length - 1,
                        itemBuilder: (context, index) {
                          var newIndex = index + 1;
                          return Align(
                            alignment: mesages[newIndex]['role'] == 'user'
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Text(
                              mesages[newIndex]['content'],
                            ),
                          );
                        });
                  },
                ),
              ),
              ChatTextField(
                rebuildUi: rebuild,
                controller: _controller,
                messages: mesages,
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// define states 
  // initial state
  // message loaded state
  // error state
// create states   (oop)
// creaet cubit (add logic)
// provide cubit
// integrate cubit ui (rebuild ui)
// trigger cubit (ui responsible for updating states)



// bloc consumer 
// bloc builder 
// bloc listner 