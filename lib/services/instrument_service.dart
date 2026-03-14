import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/instrument.dart';

class InstrumentService {

  final supabase = Supabase.instance.client;

  Future<List<Instrument>> getInstruments() async {

    final response = await supabase
        .from('instruments')
        .select();

    return (response as List)
        .map((e) => Instrument.fromJson(e))
        .toList();
  }

  Future createInstrument(Instrument data) async {

  final map = data.toJson();

  map.remove('id'); // hapus id supaya supabase generate sendiri

  await supabase.from('instruments').insert(map);

}

  Future updateInstrument(Instrument data) async {

  final map = data.toJson();

  map.remove('id'); // hapus id supaya tidak ikut diupdate

  await supabase
      .from('instruments')
      .update(map)
      .eq('id', data.id!);

}
  Future deleteInstrument(int id) async {
    await supabase
        .from('instruments')
        .delete()
        .eq('id', id);
  }
}