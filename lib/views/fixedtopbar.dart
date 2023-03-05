import 'package:facebook_with_api/packagelocations.dart';

class FixedTopBar extends StatefulWidget {
  const FixedTopBar({super.key});

  @override
  State<FixedTopBar> createState() => _FixedTopBarState();
}

class _FixedTopBarState extends State<FixedTopBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.grey))),
      height: MediaQuery.of(context).size.height * 0.11,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Facebook",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.blue,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(1),
                child: Row(
                  children: [
                    Container(
                        height: 28,
                        width: 28,
                        margin: const EdgeInsets.all(5),
                        child: Image.asset(
                          "assets/images/search.png",
                          width: 25,
                        )),
                    Container(
                      height: 30,
                      width: 30,
                      margin: const EdgeInsets.all(5),
                      child: Image.asset(
                        "assets/images/chat.png",
                        width: 25,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (var name in navimagelist)
                Image.asset(
                  name,
                  width: 23,
                )
            ],
          ),
        ],
      ),
    );
  }
}
