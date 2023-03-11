import 'package:VEmbrace/services/models/post_model.dart';
import 'package:VEmbrace/services/post_likes_services.dart';
import 'package:VEmbrace/services/posts_db.dart';
import 'package:flutter/material.dart';

import 'commentPage.dart';

List items = [
  // const ForumPost(
  //     name: "Kiran Nayab",
  //     dateTime: "05/12/2022 15:00",
  //     body: "This is a test post!"),
  // const ForumPost(
  //     name: "Mustafa Madraswala",
  //     dateTime: "05/09/2022 18:00",
  //     body:
  //         "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."),
  // const ForumPost(
  //     name: "Mehdi Raza",
  //     dateTime: "01/03/1975 13:00",
  //     body: "I also have a post :)"),
];

class ForumLanding extends StatefulWidget {
  const ForumLanding({Key? key}) : super(key: key);

  @override
  State<ForumLanding> createState() => _ForumLandingState();
}

class _ForumLandingState extends State<ForumLanding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink[50],
        appBar: AppBar(
          backgroundColor: const Color(0xFFFC8D8D),
          title: const Text(
            "FORUM",
            style: TextStyle(
              letterSpacing: 1.2,
              fontWeight: FontWeight.w400,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
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
                            builder: (context) => const NewPost()));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[50],
                          elevation: 0.5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          )),
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
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 15.0,
              color: Colors.grey[400],
            ),
            Expanded(
              child: FutureBuilder<List<Post>>(
                future: PostDatabase().getPosts(),
                builder:
                    (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else {
                      List<Post>? posts = snapshot.data;
                      return ListView.builder(
                        itemCount: posts!.length,
                        itemBuilder: (BuildContext context, int index) {
                          print('SHOULD BE HERE ${posts[index].toMap()}');
                          return ForumPost(post: posts[index]);
                        },
                      );
                    }
                  }
                },
              ),
            ),
          ],
        ));
  }
}

class ForumPost extends StatefulWidget {
  // final String name;
  // final String dateTime;
  // final String body;
  final Post post;

  const ForumPost({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  State<ForumPost> createState() => _ForumPostState();
}

class _ForumPostState extends State<ForumPost> {
  @override
  Widget build(BuildContext context) {
    int likes = widget.post.likesCount;
    return Row(
      children: [
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
                                  widget.post.name,
                                  style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 1.0),
                                ),
                                const SizedBox(
                                  height: 3.0,
                                ),
                                Text(
                                  widget.post.createdAt.toDate().toString(),
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
                          widget.post.content,
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
                        Row(
                          children: [
                            const Icon(
                              Icons.thumb_up_alt_sharp,
                              size: 19.0,
                              color: Color(0xFFFC8D8D),
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              "$likes",
                              style: const TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.7),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: Divider(
                            thickness: 1.0,
                            color: Colors.grey[60],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                onPressed: () async {
                                  var liked = await LikeDatabase()
                                      .likeOrDislike(widget.post.postId);
                                  if (liked) {
                                    setState(() {
                                      likes += 1;
                                    });
                                  }
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.thumb_up_outlined,
                                      color: Color(0xFFFC8D8D),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Like",
                                      style: TextStyle(
                                          color: Color(0xFFFC8D8D),
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 1.0),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    likes += 1;
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.forum,
                                      color: Color(0xFFFC8D8D),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CommentPage(
                                                          postId: widget
                                                              .post.postId)));
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.forum,
                                              color: Color(0xFFFC8D8D),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "Comment",
                                              style: TextStyle(
                                                  color: Color(0xFFFC8D8D),
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 1.0),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 15.0,
                    color: Colors.grey[400],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class NewPost extends StatelessWidget {
  const NewPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();

    void savePost() {
      String input = _controller.text;
      if (input.trim().isNotEmpty) {
        PostDatabase().createPost(input.trim());
      } else {
        print('Invalid post input');
      }
    }

    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        backgroundColor: const Color(0xFFFC8D8D),
        title: const Text(
          "NEW POST",
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
                        children: const [
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
                            "Kiran Nayab",
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
                            // onPressed: () {
                            //   items.add(ForumPost(
                            //       name: "Kiran Nayab",
                            //       dateTime: "06/12/2022 11:30",
                            //       body: _controller.text));
                            //   Navigator.of(context).pop();
                            //   Navigator.of(context).pop();
                            //   Navigator.of(context).push(MaterialPageRoute(
                            //       builder: (context) => ForumLanding()));
                            // },
                            onPressed: savePost,
                            child: Text("POST"),
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
