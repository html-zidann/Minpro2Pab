import 'package:flutter/material.dart';
import '../services/instrument_service.dart';
import '../models/instrument.dart';
import 'form_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final InstrumentService service = InstrumentService();
  List<Instrument> instruments = [];

  Future fetchData() async {
    final data = await service.getInstruments();

    setState(() {
      instruments = data;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Data Alat Musik"),
        backgroundColor: Colors.blueAccent,
      ),

      body: instruments.isEmpty
          ? const Center(child: Text("Belum ada data"))
          : ListView.builder(
              itemCount: instruments.length,
              itemBuilder: (context, index) {

                final item = instruments[index];

                return ListTile(
                  title: Text(item.nama),
                  subtitle: Text(
                    "Tahun: ${item.tahun}\nPembuat: ${item.pembuat}\nDeskripsi: ${item.deskripsi}",
                  ),

                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      IconButton(
                        icon: const Icon(Icons.edit,color: Colors.green),
                        onPressed: () async {

                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => FormPage(instrument: item),
                            ),
                          );

                          fetchData();
                        },
                      ),

                      IconButton(
                        icon: const Icon(Icons.delete,color: Colors.red),
                        onPressed: () async {

                          await service.deleteInstrument(item.id!);

                          fetchData();
                        },
                      )

                    ],
                  ),
                );
              },
            ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {

          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const FormPage(),
            ),
          );

          fetchData();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}