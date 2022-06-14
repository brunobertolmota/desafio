import 'package:desafio/controller/events_controller.dart';
import 'package:flutter/material.dart';

import 'package:desafio/model/event_model.dart';

class EventosSoftPage extends StatefulWidget {
  const EventosSoftPage({Key? key}) : super(key: key);

  @override
  State<EventosSoftPage> createState() => _EventosSoftPageState();
}

class _EventosSoftPageState extends State<EventosSoftPage> {
  bool isLoading = false;
  bool isError = false;
  List<Event> eventList = [];
  final eventController = EventsController();

  Widget _stateError() {
    return Column(
      children: [
        const Text('Ocorreu um erro'),
        ElevatedButton(
            onPressed: () async {
              await eventController.getEvents();
            },
            child: const Text('Tentar novamente'))
      ],
    );
  }

  Widget _stateLoadEvents(context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: eventList.length,
        itemBuilder: (context, index) {
          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 5,
            child: Column(children: [
              Text(
                eventList[index].eventName,
                style: const TextStyle(fontSize: 24, color: Colors.black),
              ),
              Image.network(eventList[index].thumbnail),
            ]),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : isError
                ? _stateError()
                : _stateLoadEvents(context),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          eventList = await eventController.getEvents();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
