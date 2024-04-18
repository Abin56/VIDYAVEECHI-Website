import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidyaveechi_website/controller/batch_history/batch_history.dart';
import 'package:vidyaveechi_website/model/batch_history_model/batch_history_model.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';
import 'package:vidyaveechi_website/view/widgets/responsive.dart';
import 'package:vidyaveechi_website/view/widgets/table/table_widgets.dart';

class BatchHistroyListPage extends StatelessWidget {
  const BatchHistroyListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      color: screenContainerbackgroundColor,
      // height: ResponsiveWebSite.isMobile(context) ? 890 : 820,
      width: 1200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Padding(
            padding:  EdgeInsets.only(left: 30, top: 30, bottom: 30,),
            child: TextFontWidget(
              text: 'List Of Batches',
              fontsize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: 1200,
              height: 800,
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        HeaderOfTable(text: "No.", flex: 2),
                        HeaderOfTable(text: "Batch Name", flex: 5),
                        HeaderOfTable(text: "Batch Created Date", flex: 5),
                        HeaderOfTable(text: "Create By", flex: 4),
                        HeaderOfTable(text: "Total Students", flex: 4),
                        HeaderOfTable(text: "Total Staff", flex: 4),
                      ],
                    ),
                    Expanded(
                      child: StreamBuilder<List<BatchHistoryModel>>(
                        stream: Get.put(BatchHistoryController()).batchHistoryStream(),
                        builder: (context, snapshot) {
                          List<BatchHistoryModel> batchHistory = snapshot.data ?? [];
                          return ListView.separated(
                              itemBuilder: (context, index) {
                                return SizedBox(
                                  width: 870,
                                  height: 45,
                                  child: Row(
                                    children: [
                                      TableListContainers(text: '${index + 1}', flex: 2),
                                      const TableListContainers(
                                        text: "THI51685326589",
                                        flex: 5,
                                      ),
                                      const TableListContainers(
                                        text: "23/02/2020",
                                        flex: 5,
                                      ),
                                      const TableListContainers(
                                        text: "Admin",
                                        flex: 4,
                                      ),
                                      const TableListContainers(
                                        text: "140",
                                        flex: 4,
                                      ),
                                      const TableListContainers(
                                        text: "15",
                                        flex: 4,
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
          ),
        ],
      ),
    );
  }
}
