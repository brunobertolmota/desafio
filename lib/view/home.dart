import 'package:desafio/controller/events_controller.dart';
import 'package:desafio/model/event_model.dart';
import 'package:desafio/view/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromRGBO(112, 82, 204, 1),
          title: Text(
            'Eventos',
            style: GoogleFonts.montserrat(
              textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
          centerTitle: true,
        ),
      ),
      body:
          // Column(
          //   children: <Widget>[
          //     Pages(),
          Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : isError
                ? _stateError()
                : _stateLoadEvents(context),
      ),
      //],
    );
    //);
  }
}
