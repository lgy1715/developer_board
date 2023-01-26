import 'package:developer_board/src/widget/my_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:developer_board/src/Model/FeedModel.dart';

class FeedShow extends StatelessWidget {
  final FeedModel feed;
  const FeedShow(this.feed, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('피드'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              MyPage(),
              SizedBox(
                width: 20,
              ),
              Text('${feed.name}',
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text('${feed.content}'),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: SizedBox()),
              Text(
                '${feed.createAt}',
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(child: SizedBox()),
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("피드 수정"),
                          content: Text('정말 수정하시겠습니까?'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'cancel'),
                              child: const Text('cancel'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text('수정')),
              TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("피드 삭제"),
                          content: Text('정말 삭제하시겠습니까?'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'cancel'),
                              child: const Text('cancel'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text('삭제')),
            ],
          ),
        ]),
      ),
    );
  }
}
