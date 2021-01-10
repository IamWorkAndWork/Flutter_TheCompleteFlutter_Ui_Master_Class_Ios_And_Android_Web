import 'package:flutter/material.dart';
import 'package:flutter_social_ui/widgets/custom_drawer.dart';
import 'package:flutter_social_ui/widgets/post_corousel.dart';
import 'package:flutter_social_ui/widgets/profile_clipper.dart';

import '../models/user_model.dart';

class ProfileScreen extends StatefulWidget {
  final User user;

  ProfileScreen({this.user});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffolKey = GlobalKey<ScaffoldState>();
  PageController _yourPostsPageController;
  PageController _favouritesPageController;

  @override
  void initState() {
    super.initState();
    _yourPostsPageController =
        PageController(initialPage: 0, viewportFraction: 0.8);

    _favouritesPageController =
        PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffolKey,
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                ClipPath(
                  clipper: ProfileClipper(),
                  child: Image(
                    height: 300.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    image: AssetImage(
                      widget.user.backgroundImageUrl,
                    ),
                  ),
                ),
                Positioned(
                    top: 50.0,
                    left: 20.0,
                    child: IconButton(
                      icon: Icon(Icons.menu),
                      iconSize: 30.0,
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        _scaffolKey.currentState.openDrawer();
                      },
                    )),
                Positioned(
                    bottom: 10.0,
                    child: Container(
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black45,
                                  offset: Offset(0, 2),
                                  blurRadius: 6.0)
                            ]),
                        child: ClipOval(
                          child: Image(
                            height: 120.0,
                            width: 120.0,
                            fit: BoxFit.cover,
                            image: AssetImage(widget.user.profileImageUrl),
                          ),
                        ),
                      ),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                widget.user.name,
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: [
                    Text(
                      "Following",
                      style: TextStyle(color: Colors.black54, fontSize: 22.0),
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    Text(
                      widget.user.following.toString(),
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Follower",
                      style: TextStyle(color: Colors.black54, fontSize: 22.0),
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    Text(
                      widget.user.followers.toString(),
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w600),
                    )
                  ],
                )
              ],
            ),
            PostsCarousel(
              pageController: _yourPostsPageController,
              title: "Your Posts",
              posts: widget.user.posts,
            ),
            PostsCarousel(
              pageController: _favouritesPageController,
              title: "Favourites",
              posts: widget.user.favorites,
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
