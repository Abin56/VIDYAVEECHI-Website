import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
                    HeaderOfTable(text: "Batch Created Date", flex: 3),
                    HeaderOfTable(text: "Create By", flex: 2),
                    // HeaderOfTable(text: "Total Students", flex: 2),
                    // HeaderOfTable(text: "Total Staff", flex: 2),
                  ],
                ),
                Expanded(
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('SchoolListCollection')
                          .snapshots(),
                      builder: (context, snapshot) {
                        final List<DocumentSnapshot> documents =
                            snapshot.data!.docs;
                        if (snapshot.hasData) {
                          return ListView.separated(
                              itemBuilder: (context, index) {
                                final document = documents[index].data()
                                    as Map<String, dynamic>;
                                final DateTime createDate =
                                    (document['createDate'] as Timestamp)
                                        .toDate();
                                //  final String formattedCreateDate = formatDate(createDate);

                                return SizedBox(
                                  width: 870,
                                  height: 45,
                                  child: Row(
                                    children: [
                                      TableListContainers(
                                          text: '${index + 1}', flex: 1),
                                      TableListContainers(
                                        text: document['batchYear'] ?? '',
                                        flex: 3,
                                      ),
                                      TableListContainers(
                                        text: createDate.toString(),
                                        flex: 3,
                                      ),
                                      TableListContainers(
                                        text: document['adminUserName'] ?? '',
                                        flex: 2,
                                      ),
                                      //  TableListContainers(
                                      //   text: document['batchYear'] ?? '',
                                      //   flex: 4,
                                      // ),
                                      //  TableListContainers(
                                      //   text: document['batchYear'] ?? '',
                                      //   flex: 4,
                                      // ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    height: 1,
                                  ),
                              itemCount: 1);
                        } else {
                          return const Text('No data found');
                        }
                      }),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
