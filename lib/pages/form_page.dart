import 'package:flutter/material.dart';
import '../models/instrument.dart';
import '../services/instrument_service.dart';

class FormPage extends StatefulWidget {

  final Instrument? instrument;

  const FormPage({super.key, this.instrument});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {

  final _formKey = GlobalKey<FormState>();

  final namaController = TextEditingController();
  final tahunController = TextEditingController();
  final pembuatController = TextEditingController();
  final deskripsiController = TextEditingController();

  final service = InstrumentService();

  @override
  void initState() {
    super.initState();

    if(widget.instrument != null){
      namaController.text = widget.instrument!.nama;
      tahunController.text = widget.instrument!.tahun.toString();
      pembuatController.text = widget.instrument!.pembuat;
      deskripsiController.text = widget.instrument!.deskripsi;
    }
  }

  Future saveData() async {

    print("Tombol SIMPAN ditekan");

    if(!_formKey.currentState!.validate()) return;

    try {

      final data = Instrument(
        id: widget.instrument?.id,
        nama: namaController.text,
        tahun: int.parse(tahunController.text),
        pembuat: pembuatController.text,
        deskripsi: deskripsiController.text,
      );

      if(widget.instrument == null){
        await service.createInstrument(data);
      }else{
        await service.updateInstrument(data);
      }

      if(mounted){
        Navigator.pop(context);
      }

    } catch (e) {

      print("ERROR SUPABASE: $e");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Terjadi error: $e"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(widget.instrument == null ? "Tambah Data" : "Edit Data"),
        backgroundColor: Colors.blueAccent,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Form(
          key: _formKey,

          child: SingleChildScrollView(
            child: Column(
              children: [

                TextFormField(
                  controller: namaController,
                  decoration: const InputDecoration(
                    labelText: "Nama Alat Musik",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Nama tidak boleh kosong";
                    }
                    return null;
                  },
                ),

                const SizedBox(height:20),

                TextFormField(
                  controller: tahunController,
                  decoration: const InputDecoration(
                    labelText: "Tahun",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Tahun tidak boleh kosong";
                    }
                    return null;
                  },
                ),

                const SizedBox(height:20),

                TextFormField(
                  controller: pembuatController,
                  decoration: const InputDecoration(
                    labelText: "Pembuat",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Pembuat tidak boleh kosong";
                    }
                    return null;
                  },
                ),

                const SizedBox(height:20),

                TextFormField(
                  controller: deskripsiController,
                  decoration: const InputDecoration(
                    labelText: "Deskripsi",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Deskripsi tidak boleh kosong";
                    }
                    return null;
                  },
                ),

                const SizedBox(height:30),

                SizedBox(
                  width: double.infinity,
                  height: 50,

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent
                    ),

                    onPressed: saveData,

                    child: const Text(
                      "SIMPAN",
                      style: TextStyle(fontSize:16),
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}