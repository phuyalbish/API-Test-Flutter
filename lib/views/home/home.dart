import 'package:facebook_with_api/controller/remote_controller.dart';
import 'package:facebook_with_api/packagelocations.dart';

import 'package:facebook_with_api/model/post.dart';
import 'package:facebook_with_api/model/postfeed.dart';

class FacebookClone extends StatefulWidget {
  const FacebookClone({super.key});

  @override
  State<FacebookClone> createState() => _FacebookCloneState();
}

class _FacebookCloneState extends State<FacebookClone> {
  List<Post>? posts;
  List<PostFeed>? postfeed;

  // Post posts1 = Post(username: username, id: id, name: name,  email: email, address: address, phone: phone, website: website, company: company);
  bool isLoaded = false;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    posts = await RemoteService().getPosts();
    postfeed = await RemoteServiceFeed().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("Facebook")),
      body: SafeArea(
        // padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            // ListView.builder(
            //   scrollDirection: Axis.vertical,
            //     shrinkWrap: true,
            //   children: [

            const FixedTopBar(),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.85,
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 5, bottom: 5),
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image:
                                      AssetImage('assets/images/profile.jpg'),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(100)),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(
                              left: 30,
                            ),
                            margin: const EdgeInsets.only(top: 10, bottom: 10),
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border:
                                    Border.all(color: Colors.grey, width: 2)),
                            child: const Text(
                              "What's on your mind?",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 73, 73, 73)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.black,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        for (var posticon in posticonlist)
                          PostIconButton(
                            posticonimg: posticon[0],
                            iconText: posticon[1],
                          ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.black,
                  ),
                  // ListView.builder(
                  //   itemCount: 1,
                  //   scrollDirection: Axis.horizontal,
                  //   itemBuilder: (context, index) {
                  Container(
                    height: 250,
                    padding: EdgeInsets.only(left: 12, right: 12),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: storynamelist.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) {
                        return FacebookStory(
                          storyimg: storynamelist[index][0],
                          storyPerson: '${posts?[index].name}',
                        );
                      }),
                      // padding: const EdgeInsets.only(left: 10, right: 10),
                      // child: Row(

                      // ),
                    ),
                  ),
                  // SizedBox(
                  //     height: 200,
                  //     child: Visibility(
                  //       visible: true,
                  //       // return Text(" {$index}");
                  //       child: Text("{$posts![1].name}"),
                  //     )),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 8,
                      itemBuilder: ((context, index) {
                        // return Text('${posts?[index].name}');
                        return FacebookPost(
                          postname: '${posts?[index].name}',
                          postfeed: '${postfeed?[index].title}',
                        );
                      })),
                ],
              )

                  // Text('${posts?[3].name}'),
                  // for (var post in posts?)FacebookPost("abc"),
                  // for (int i = 0; i < posts!.length; i++)
                  //   FacebookPost(post: '${posts?[i].name}'),

                  // Text()
                  // ),
                  // const FacebookPost(),
                  // const FacebookPost(),
                  // const FacebookPost(),
                  // const FacebookPost(),
                  ),
            )
            // ListView(children: [FacebookPost()])
          ],
        ),
      ),
    );
  }
}
