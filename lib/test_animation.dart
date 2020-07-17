/// https://github.com/flutter/flutter/issues/61691
class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> with TickerProviderStateMixin {
  AnimationController _controller;
  CurvedAnimation _curved;
  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _curved = CurvedAnimation(parent: _controller, curve: Curves.bounceOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 10,
              child: FlatButton(
                  onPressed: () {
                    _controller.reset();
                    _controller.forward();
                  },
                  child: Text("Run")),
            ),
            Center(
                child: RotationTransition(
                    turns: _curved,
                    child: Container(
                      height: 100,
                      width: 100,
                      child: Image.asset(
                        "assets/images/icon1024-2.png",
                      ),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/icon1024-2.png"),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                    ))),
          ]),
    ));
  }
}
