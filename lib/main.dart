import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SlideScreen(),
    );
  }
}

class SlideScreen extends StatefulWidget {
  const SlideScreen({super.key});

  @override
  State<SlideScreen> createState() => _SlideScreenState();
}

class _SlideScreenState extends State<SlideScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: <Widget>[
              Container(color: Colors.white),
              Container(color: Colors.white),
              const SlideContent(),
            ],
          ),
          HomePhone1Animation(controller: _controller),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.1,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index ? Colors.white : Colors.grey,
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class SlideContent extends StatelessWidget {
  const SlideContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Positioned(
              left: 150,
              top: 15,
              child: ScaledAvatar(avatar: "assets/images/Ava_1@2x.png", delay: 0)
          ),
          Positioned(
              left: 50,
              top: 290,
              child: ScaledAvatar(avatar: "assets/images/Ava_2@2x.png", delay: 1)
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 600,
                  margin: const EdgeInsets.only(top: 40),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      HomePhone2()
                    ],
                  ),
                )
              ]
          ),
          Positioned(
            left: 65,
            top: 80,
            child: ScaledAvatar(avatar: "assets/images/Ava_3@2x.png", delay: 3,)
          ),
          Positioned(
              left: 265,
              top: 55,
              child: ScaledAvatar(avatar: "assets/images/Ava_4@2x.png", delay: 0,)
          ),
          Positioned(
              left: 260,
              top: 260,
              child: ScaledAvatar(avatar: "assets/images/Ava_5@2x.png", delay: 1,)
          ),
        ]
      ),
    );
  }
}

class HomePhone1Animation extends StatelessWidget {
  final PageController controller;

  const HomePhone1Animation({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        double page = 0;
        if (controller.hasClients) {
          page = controller.page ?? 0;
        }
        double screenWidth = MediaQuery.of(context).size.width;

        double phoneTop = 240 - page.clamp(0.0, 1.0) * 200;
        double phoneScale = 4.0 - (page.clamp(0.0, 1.0) * 3.0);
        double phoneOffset = (1.0 - page.clamp(1.0, 2.0)) * 600;

        double goodRateOffset = screenWidth - page * 350;

        return IgnorePointer(
          child: Stack(
            children: [
              Positioned(
                left: 10,
                top: 50,
                child: Transform.translate(
                  offset: Offset(goodRateOffset + 215, 350),
                  child: Image.asset(
                    'assets/images/good_rates@2x.png',
                    scale: 2,
                  )
                ),
              ),
              Positioned(
                left: 30,
                top: 50,
                child: Transform.translate(
                  offset: Offset(goodRateOffset, 50),
                  child: Image.asset(
                    'assets/images/good_rates@2x.png',
                    scale: 2,
                  )
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Transform.translate(
                      offset: Offset(phoneOffset, 0),
                      child: Transform.scale(
                          scale: phoneScale,
                          child: Container(
                            width: 200,
                            height: 600,
                            margin: EdgeInsets.only(top: phoneTop),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                HomePhone()
                              ],
                            ),
                          )
                      ),
                    )
                  ]
              ),
              Positioned(
                left: 30,
                top: 50,
                child:Transform.translate(
                  offset: Offset(goodRateOffset + 20, 250),
                  child: Image.asset(
                    'assets/images/good_rates@2x.png',
                    scale: 2,
                  )
                ),
              ),
              Positioned(
                left: 30,
                top: 50,
                child: Transform.translate(
                  offset: Offset(goodRateOffset + 230, 50),
                  child: Image.asset(
                    'assets/images/good_rates@2x.png',
                    scale: 2,
                  )
                ),
              ),
              Positioned(
                left: 30,
                top: 50,
                child: Transform.translate(
                  offset: Offset(goodRateOffset + 220, 150),
                  child: Image.asset(
                    'assets/images/good_rates@2x.png',
                    scale: 2,
                  )
                )
              ),
            ],
          ),
        );
      },
    );
  }
}

class HomePhone extends StatelessWidget {
  const HomePhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          child: Image.asset(
            'assets/images/test_image3_devicebg.png',
          ),
        ),
        // Masked area over the background image
        Positioned(
          child: ClipRect(
            clipper: PhoneClipper(),
              child: Image.asset(
                'assets/images/tutorial0_bg_640x1136.png',
                fit: BoxFit.cover,
              ),
          ),
        ),
      ],
    );
  }
}

class HomePhone2 extends StatefulWidget {
  const HomePhone2();

  @override
  State<StatefulWidget> createState() {
    return _HomePhone2State();
  }

}

class _HomePhone2State extends State<HomePhone2> {
  double imageOffset = 60;

  _HomePhone2State();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Positioned(
          child: Image.asset(
            'assets/images/test_image3_devicebg.png',
          ),
        ),
        // Masked area over the background image
        Positioned(
          child: ClipRect(
            clipper: Phone2Clipper(),
            child: TweenAnimationBuilder(
                tween: Tween<double>(begin: -100, end: imageOffset),
                duration: const Duration(seconds: 2),
                curve: Curves.easeOut,
                onEnd: () {
                  setState(() {
                    imageOffset = imageOffset == -100 ? 60 : -100;
                  });
                },
                builder: (_, double offset, __) {
                  return Transform.translate(
                    offset: Offset(0, offset),
                    child: Image.asset(
                      'assets/images/test_image3_user_list.png',
                    ),
                  );
                }
            )
          ),
        ),
      ],
    );
  }
}

class PhoneClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return const Rect.fromLTWH(14, 46, 174, 285);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return false;
  }
}

class Phone2Clipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return const Rect.fromLTWH(14, 86, 174, 285);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return false;
  }
}

class ScaledAvatar extends StatefulWidget {
  int delay = 0;
  late String avatar;
  ScaledAvatar({super.key, required this.delay, required this.avatar});

  @override
  State<StatefulWidget> createState() => _ScaledAvatarState(delay: delay, avatar: avatar);
}

class _ScaledAvatarState extends State<ScaledAvatar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late int delay;
  late String avatar;

  _ScaledAvatarState({required this.delay, required this.avatar});

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    Future.delayed(Duration(seconds: delay), () {
      _controller.repeat(reverse: true);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (_, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Image.asset(
            avatar
          ),
        );
      },
    );
  }
}
