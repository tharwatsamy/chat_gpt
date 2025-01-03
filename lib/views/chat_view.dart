import 'package:flutter/material.dart';
import 'package:flutter_application_19/chat_cubit/chat_cubit.dart';
import 'package:flutter_application_19/chat_cubit/chat_states.dart';
import 'package:flutter_application_19/models/message_model.dart';
import 'package:flutter_application_19/views/widgets/custom_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/chat_service.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  late final TextEditingController _controller;
  late final ScrollController scrollController;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    scrollController.dispose();
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
                child: ListViewBlocBonsumer(scrollController: scrollController),
              ),
              ChatTextField(
                controller: _controller,
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

class ListViewBlocBonsumer extends StatelessWidget {
  const ListViewBlocBonsumer({
    super.key,
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatStates>(
      listener: (context, state) {
        if (state is ErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
            ),
          );
        }

        if (state is MessageLoadedState) {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      },
      builder: (context, state) {
        var messages = BlocProvider.of<ChatCubit>(context).mesages;
        if (state is LoadingState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MessagesListView(
                  scrollController: scrollController, messages: messages),
              const Text('Chat Gpt is typing...')
            ],
          );
        } else {
          return ListView.builder(
              controller: scrollController,
              itemCount: messages.length - 1,
              itemBuilder: (context, index) {
                var newIndex = index + 1;
                return Align(
                  alignment: messages[newIndex].role == 'user'
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Text(
                    messages[newIndex].content,
                  ),
                );
              });
        }
      },
    );
  }
}

class MessagesListView extends StatelessWidget {
  const MessagesListView({
    super.key,
    required this.scrollController,
    required this.messages,
  });

  final ScrollController scrollController;
  final List<MessageModel> messages;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: scrollController,
        shrinkWrap: true,
        itemCount: messages.length - 1,
        itemBuilder: (context, index) {
          var newIndex = index + 1;
          return Align(
            alignment: messages[newIndex].role == 'user'
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: Text(
              messages[newIndex].content,
            ),
          );
        });
  }
}
// define states 
  // initial state
  // message loaded state
  // error state
  // loading state
// create states   (oop)
// creaet cubit (add logic)
// provide cubit
// integrate cubit ui (rebuild ui)
// trigger cubit (ui responsible for updating states)



// bloc consumer 
// bloc builder 
// bloc listner 