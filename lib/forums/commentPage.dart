// make a comment page

import 'package:VEmbrace/services/post_comments_services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/models/post_model.dart';

List post = [
  // const PostReply(
  //     name: "Kiran Nayab",
  //     dateTime: "05/12/2022 15:00",
  //     body: "This is a test post!"),
];

class CommentPage extends StatefulWidget {
  final String postId;

  const CommentPage({Key? key, required this.postId}) : super(key: key);

  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink[50],
        appBar: AppBar(
          backgroundColor: const Color(0xFFFC8D8D),
          title: const Text(
            "Comment Page",
            style: TextStyle(
              letterSpacing: 1.2,
              fontWeight: FontWeight.w400,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(children: [
          Expanded(
            child: FutureBuilder<List<Comment>>(
              future: CommentDatabase().getCommentsForPost(widget.postId),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Comment>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    List<Comment>? comments = snapshot.data;
                    return ListView.builder(
                      itemCount: comments!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return PostReply(
                          comment: comments[index],
                        );
                      },
                    );
                  }
                }
              },
            ),
            // child: ListView.builder(
            //   itemCount: post.length,
            //   itemBuilder: (BuildContext context, int index) {
            //     return post[index];
            //   },
            // ),
          ),
          // Text("ADD A WIDGET HERE AT THE BOTTOM OF THE PAGE"),
          Container(
              margin: const EdgeInsets.fromLTRB(6, 10, 15, 10),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/default.png"),
                      radius: 22.5,
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                NewComment(postId: widget.postId)));
                      },
                      child: Row(
                        children: const [
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            "Start a discussion",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1.0,
                              fontSize: 15.0,
                            ),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[50],
                          elevation: 0.5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          )),
                    ),
                  ),
                ],
              ))
        ]));
  }
}

class PostReply extends StatefulWidget {
  // name: comments[index].name,
  // timestamp: comments[index].timestamp,
  // comment: comments[index].comment,
  // imageUrl: comments[index].imageUrl,
  // userId: comments[index].userId,
  final Comment comment;

  const PostReply({
    Key? key,
    required this.comment,
  }) : super(key: key);

  @override
  State<PostReply> createState() => _PostReplyState();
}

class _PostReplyState extends State<PostReply> {
  int likes = 0;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: Container(
          color: Colors.grey[50],
          margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            backgroundImage: AssetImage("assets/default.png"),
                            radius: 22.5,
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${widget.comment.name}",
                                style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 1.0),
                              ),
                              const SizedBox(
                                height: 3.0,
                              ),
                              Text(
                                widget.comment.createdAt
                                    .toDate()
                                    .toIso8601String(),
                                style: const TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 1.0),
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        widget.comment.content,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            height: 1.4,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.7),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Divider(
                        thickness: 15.0,
                        color: Colors.pink[50],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          // ],
        ),
        // ))),
        // const SizedBox(
        //   height: 25,
      ),
    ]);
  }
}

class NewComment extends StatefulWidget {
  final String postId;

  const NewComment({Key? key, required this.postId}) : super(key: key);

  @override
  State<NewComment> createState() => _NewCommentState();
}

class _NewCommentState extends State<NewComment> {
  String name = "";
  String imageUrl = "";

  loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('user_name')!;
      imageUrl = prefs.getString('user_image_url')!;
    });
  }

  @override
  void initState() {
    loadUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        backgroundColor: const Color(0xFFFC8D8D),
        title: const Text(
          "NEW Comment",
          style: TextStyle(
            letterSpacing: 1.2,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Row(
          children: [
            Expanded(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 6.0, vertical: 6.0),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 5.0, vertical: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 5.0,
                          ),
                          CircleAvatar(
                            backgroundImage: AssetImage("assets/default.png"),
                            radius: 25.0,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "${name}",
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1.0),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      TextField(
                        controller: _controller,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xFFFC8D8D), width: 2.0)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFFC8D8D))),
                            hintText: "What's on your mind?"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              bool isSuccess = await CommentDatabase().addCommentToPost(widget.postId, _controller.text);
                              if (isSuccess) {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CommentPage(
                                                postId: widget
                                                    .postId)));
                              } else{

//TODO: Show the ERRoR
                              }
                            },
                            child: Text("Comment"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFC8D8D),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
