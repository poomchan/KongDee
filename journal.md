May 14, 2020
- started the project
- Firestore added
- Multi Dex enabled for Android
- GitHub created

May 15 ,2020
- Google sign in enabled
- got SHA-1 from Android Dev Kit and provide it to Firestore.
This fixed the problem of cannot login using an android device.
- be able to logout at the Profile page

May 17
- User now can edit profile
- Reusable image service

May 19
- user now can see their own posts on the profile page
- still working on how to query posts by radius
- problem, GeoFlutterFire could not query the collection group query

May 20
- can view profile post in grids

May 21
- user now can like/unlike posts

May 22
- can use realtime comment
- changed server from US to Tokyo, performance is significantly improved

May 23
- can see full page of the post by clicking on the post tile then it will
    jump to the specific index
- problem: it has definite scrolling position
- solution: try to implement the scroll_to_index package

May 24
- implement category selection UI in the shopping page
- find out a state management method

May 26
- started implementing Provider

May 27
- perfect state management with Provider

May 28
- Nav bar V.2
- Activity feed is available but still need to work on "on pressed"

May 29
- can save post but still need to be optimized and display on the saving screen

Octobrer 15
- most important parts of the app are done =D

December 1
- Using GetX as dependency injection with BLoc(Cubit) works amazingly perfect
- Can access the bloc without BuildContext, No BlocProvider needed
- Can share Bloc as a singleton and close it easily


Lessons
- avoid api-call in the build medthod (because it rebuilds several times even on different screens and will cause unexpected api-call (bloc will emit weird states)) => instead, use init api call in create() for BlocProvider or put() for getX.