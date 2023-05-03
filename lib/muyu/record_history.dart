import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'models/merit_record.dart';

DateFormat format = DateFormat('yyyy年MM月dd日 HH:mm:ss');

class RecordHistory extends StatelessWidget {
  final List<MeritRecord> records;

  const RecordHistory({Key? key, required this.records}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:_buildAppBar(),
      body: Column(
        children: List.generate(records.length, (index)=>_buildItem(context,index)),
      ),
      // body: ListView.builder(
      //   itemBuilder: _buildItem, itemCount: records.length,
      // ),
    );
  }

  PreferredSizeWidget _buildAppBar() =>
      AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        title: const Text(
          '功德记录', style: TextStyle(color: Colors.black, fontSize: 16),),
        elevation: 0,
        backgroundColor: Colors.white,
      );

  Widget _buildItem(BuildContext context, int index) {
    MeritRecord merit = records[index];
    String date = format.format(DateTime.fromMillisecondsSinceEpoch(merit.timestamp));
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blue,
        backgroundImage: AssetImage(merit.image),
      ),
      title: Text('功德 +${merit.value}'),
      subtitle: Text(merit.audio),
      trailing: Text(
        date, style: const TextStyle(fontSize: 12, color: Colors.grey),),
    );
  }
}
