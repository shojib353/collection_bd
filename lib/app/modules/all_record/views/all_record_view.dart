import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/all_record_controller.dart';

class AllRecordView extends GetView<AllRecordController> {
  const AllRecordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User List')),
      body: Obx(() {
        if (controller.allRecordModel.value.data == null ||
            controller.allRecordModel.value.data!.dataList == null) {
          return Center(child: CircularProgressIndicator());
        }

        var dataList = controller.allRecordModel.value.data!.dataList!;

        return NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent &&
                !controller.isLoading.value) {
              controller.fetchRecords(); // Load next batch
            }
            return false;
          },
          child: Column(
            children: [
              // Table Header
              Container(
                color: Colors.blueAccent,
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    _tableHeaderCell("DATA ID", flex: 1),
                    _tableHeaderCell("USER", flex: 2),
                    _tableHeaderCell("TOPIC", flex: 2),
                    _tableHeaderCell("SENTENCE", flex: 3),
                    _tableHeaderCell("ACTION ITEMS", flex: 2),
                  ],
                ),
              ),

              // Data List
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: dataList.asMap().entries.map((entry) {
                      int index = entry.key;
                      var item = entry.value;

                      return Column(
                        children: [
                          _buildTableRow(item),
                          if (index == dataList.length - 1 &&
                              controller.isLoading.value)
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: CircularProgressIndicator(),
                            ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  // Header Cell Widget
  Widget _tableHeaderCell(String title, {int flex = 1}) {
    return Flexible(
      flex: flex,
      child: Center(
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  // Table Row Widget
  Widget _buildTableRow(dynamic item) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          _tableDataCell('${item.id ?? "N/A"}', flex: 1),
          _tableDataCell(item.user?.name ?? "No Name", flex: 2),
          _tableDataCell(item.topicSessionId?.toString() ?? "N/A", flex: 2),
          _tableDataCell(item.userSentence ?? "(empty)", flex: 3),
          _actionItemsCell(item.records, flex: 2),
        ],
      ),
    );
  }

  // Data Cell Widget
  Widget _tableDataCell(String text, {int flex = 1}) {
    return Flexible(
      flex: flex,
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 14),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  // Action Items (Like & Play Buttons)
  Widget _actionItemsCell(String? audioUrl, {int flex = 2}) {
    return Flexible(
      flex: flex,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: IconButton(
              icon: Icon(Icons.thumb_up, color: Colors.grey),
              onPressed: () {
                // Handle like action
              },
            ),
          ),
          if (audioUrl != null && audioUrl.isNotEmpty)
            Expanded(
              child: IconButton(
                icon: Icon(Icons.play_circle_fill, color: Colors.blue),
                onPressed: () {
                  _playAudio(audioUrl);
                },
              ),
            ),
        ],
      ),
    );
  }

  // final AudioPlayer player = AudioPlayer();

  void _playAudio(String audioUrl) async {
   // await player.play(UrlSource(audioUrl));
  }
}