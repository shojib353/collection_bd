import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/all_record_controller.dart';

class AllRecordView extends GetView<AllRecordController> {
  const AllRecordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('All Record')),
      body: Obx(() {
        if (controller.allRecordModel.value.data == null ||
            controller.allRecordModel.value.data!.dataList == null) {
          return Center(child: CircularProgressIndicator());
        }

        var dataList = controller.allRecordModel.value.data!.dataList!;

        return Column(
          children: [
            // Table Header Row
            Container(
              color: Colors.blueAccent,
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _tableHeaderCell("DATA ID"),
                  _tableHeaderCell("USER"),
                  _tableHeaderCell("TOPIC"),
                  _tableHeaderCell("SENTENCE"),
                  _tableHeaderCell("ACTION ITEMS"),
                ],
              ),
            ),

            // Table Body
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: dataList.map((item) {
                    return _buildTableRow(item);
                  }).toList(),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  // Header Cell Widget
  Widget _tableHeaderCell(String title) {
    return Expanded(
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }

  // Table Row Widget
  Widget _buildTableRow(dynamic item) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _tableDataCell('${item.id ?? "N/A"}'),
          _tableDataCell(item.user?.name ?? "No Name"),
          _tableDataCell(item.topicSessionId?.toString() ?? "N/A"),
          _tableDataCell(item.userSentence ?? "(empty)"),
          _actionItemsCell(item.records),
        ],
      ),
    );
  }

  // Data Cell Widget
  Widget _tableDataCell(String text) {
    return Expanded(
      child: Text(
        text,
        style: TextStyle(fontSize: 14),
        textAlign: TextAlign.center,
      ),
    );
  }

  // Action Items with Like Button and Play Button
  Widget _actionItemsCell(String? audioUrl) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.thumb_up, color: Colors.grey),
            onPressed: () {
              // Handle like action
            },
          ),
          if (audioUrl != null && audioUrl.isNotEmpty)
            Expanded(
              child: IconButton(
                icon: Icon(Icons.play_circle_fill, color: Colors.blue),
                onPressed: () {
                  controller.playAudio(audioUrl);
                },
              ),
            ),
        ],
      ),
    );
  }


}