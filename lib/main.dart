import 'package:flutter/material.dart';
import 'package:networking/model/post.dart';
import 'package:networking/network/network.dart';

void main() {
  runApp(const MaterialApp(
    home: NetworkPage(),
  ));
}

class NetworkPage extends StatefulWidget {
  const NetworkPage({Key? key}) : super(key: key);

  @override
  State<NetworkPage> createState() => _NetworkPageState();
}

class _NetworkPageState extends State<NetworkPage> {
  late Future<List<Post>> postList;

  @override
  void initState() {
    super.initState();
    postList = Network().getPosts();
    // postList.then((value) => {
    //       value.forEach((element) {
    //         print(element.title);
    //       })
    //     });
    Network().postData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Post"),
        ),
        body: FutureBuilder<List<Post>>(
            future: postList,
            builder:
                (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: Container(
                          margin: EdgeInsets.all(10.0),
                          child: Text(snapshot.data![index].title.toString()),
                        ),
                      );
                    });
              } else {
                return Text("data");
              }
            }));
  }
}
