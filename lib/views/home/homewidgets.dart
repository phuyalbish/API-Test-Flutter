import 'package:facebook_with_api/packagelocations.dart';

// import 'package:facebook_with_api/model/post.dart';

class FacebookStory extends StatefulWidget {
  final String? storyPerson;
  final String? storyimg;
  const FacebookStory({super.key, this.storyimg, this.storyPerson});

  @override
  State<FacebookStory> createState() => _FacebookStoryState();
}

class _FacebookStoryState extends State<FacebookStory> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(top: 10, bottom: 10),
          width: 125,
          height: 250,
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(widget.storyimg!), fit: BoxFit.cover),
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(20)),
          child: Text(
            widget.storyPerson!,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),
          ),
        ),
        const SizedBox(width: 5),
      ],
    );
  }
}

class PostIconButton extends StatefulWidget {
  final String? posticonimg;
  final String? iconText;

  const PostIconButton({super.key, this.posticonimg, this.iconText});

  @override
  State<PostIconButton> createState() => _PostIconButtonState();
}

class _PostIconButtonState extends State<PostIconButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: null,
      child: Row(
        children: [
          Image.asset(widget.posticonimg!, width: 25),
          const SizedBox(width: 5),
          Text(widget.iconText!),
        ],
      ),
    );
  }
}

class FacebookPost extends StatefulWidget {
  final String? postname;
  final String? postfeed;
  const FacebookPost({super.key, this.postname, this.postfeed});

  @override
  State<FacebookPost> createState() => _FacebookPostState();
}

class _FacebookPostState extends State<FacebookPost> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(top: 20),
        // padding: const EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(border: Border.all(width: 1)),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: ListTile(
                contentPadding: const EdgeInsets.all(0),
                leading: Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage('assets/images/profile.jpg'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(100)),
                ),
                title: Text(widget.postname!),
                subtitle: Row(
                  children: [
                    const Text("Feb 2"),
                    const SizedBox(width: 5),
                    Image.asset(
                      "assets/images/earth.png",
                      width: 14,
                    ),
                  ],
                ),
                trailing: Image.asset(
                  "assets/images/ellipsis.png",
                  width: 25,
                ),
              ),
            ),
            Container(
              // height: 20,
              padding: const EdgeInsets.only(left: 10, right: 10),
              alignment: Alignment.topLeft,
              child: Text(
                widget.postfeed!,
              ),
            ),
            const SizedBox(height: 10),
            Image.asset(
              "assets/images/bg1.jpg",
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              height: 300,
            ),
          ],
        ));
  }
}
