import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/batch_history/batch_history.dart';
import 'package:vidyaveechi_website/model/batch_history_model/batch_history_model.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/widgets/table/table_widgets.dart';

class BatchHistroyListPage extends StatelessWidget {
  const BatchHistroyListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextFontWidget(
          text: 'List Of Batch',
          fontsize: 18,
          fontWeight: FontWeight.bold,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: 870,
            height: 800,
            child: Column(
              children: [
                const Row(
                  children: [
                    HeaderOfTable(text: "No.", flex: 1),
                    HeaderOfTable(text: "Batch Name", flex: 3),
                    HeaderOfTable(text: "Batch Created Date", flex: 2),
                    HeaderOfTable(text: "Create By", flex: 2),
                    HeaderOfTable(text: "Total Students", flex: 2),
                    HeaderOfTable(text: "Total Staff", flex: 2),
                  ],
                ),
                Expanded(
                  child: StreamBuilder<List<BatchHistoryModel>>(
                    stream:
                        Get.put(BatchHistoryController()).batchHistoryStream(),
                    builder: (context, snapshot) {
                      List<BatchHistoryModel> batchHistory =
                          snapshot.data ?? [];
                      return ListView.separated(
                          itemBuilder: (context, index) {
                            return SizedBox(
                              width: 870,
                              height: 45,
                              child: Row(
                                children: [
                                  TableListContainers(
                                      text: '${index + 1}', flex: 1),
                                  const TableListContainers(
                                    text: "THI51685326589",
                                    flex: 3,
                                  ),
                                  const TableListContainers(
                                    text: "23/02/2020",
                                    flex: 2,
                                  ),
                                  const TableListContainers(
                                    text: "Admin",
                                    flex: 2,
                                  ),
                                  const TableListContainers(
                                    text: "140",
                                    flex: 2,
                                  ),
                                  const TableListContainers(
                                    text: "15",
                                    flex: 2,
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 1,
                              ),
                          itemCount: 1);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
