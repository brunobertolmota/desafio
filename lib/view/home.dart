import 'package:desafio/view/eventos_soft_page.dart';
import 'package:desafio/view/meus_eventos_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: Scaffold(
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
            body: Column(
              children: const [
                TabBar(labelColor: Colors.black, tabs: [
                  Tab(
                    text: 'Meus eventos',
                  ),
                  Tab(
                    text: 'Eventos soft',
                  )
                ]),
                Expanded(
                  child: TabBarView(
                    children: [
                      EventosSoftPage(),
                      MeusEventosPage(),
                    ],
                  ),
                ),
              ],
            )),
      );
  //);

}
