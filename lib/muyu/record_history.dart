import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'models/merit_record.dart';

DateFormat format = DateFormat('yyyy年MM月dd日 HH:mm:ss');

class RecordHistory extends StatelessWidget {
  final List<MeritRecord> record;
  const RecordHistory({Key? key, required this.record}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        title: const Text('功德记录',style: TextStyle(color: Colors.black,fontSize: 16),),
        elevation: 0,
        backgroundColor: Colors.white,),
      body: ListView.builder(
        itemBuilder: _buildItem,itemCount: record.length,),
    );
  }

  Widget? _buildItem(BuildContext context, int index) {
    MeritRecord merit =  record[index];
    String date = format.format(DateTime.fromMillisecondsSinceEpoch(merit.timestamp));
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blue,
        backgroundImage: AssetImage(merit.image),
      ),
      title: Text('功德 +${merit.value}'),
      subtitle: Text('${merit.audio}'),
      trailing: Text(date,style: const TextStyle(fontSize: 12,color: Colors.grey),),
    );
  }
}
