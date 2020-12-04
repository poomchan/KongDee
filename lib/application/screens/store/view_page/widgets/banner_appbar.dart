// import 'package:flutter/material.dart';
// import 'package:fluttertaladsod/application/core/components/my_network_image.dart';
// import 'package:fluttertaladsod/application/core/components/progress_indicator.dart';
// import 'package:fluttertaladsod/application/screens/store/view_page/bloc/store_view_bloc.dart';

// class BannerAppbar extends StatelessWidget {
//   const BannerAppbar({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SliverPersistentHeader(
//       pinned: true,
//       delegate: _BannerAppBarDelegate(
//         context,
//         extent: 350,
//       ),
//     );
//   }
// }

// class _BannerAppBarDelegate extends SliverPersistentHeaderDelegate {
//   final double extent;
//   final BuildContext context;

//   _BannerAppBarDelegate(this.context, {this.extent});

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return BlocBuilder<StoreViewBloc, StoreViewState>(
//       builder: (context, state) => ClipRRect(
//         borderRadius: BorderRadius.only(
//           bottomLeft: Radius.circular(20.0),
//           bottomRight: Radius.circular(20.0),
//         ),
//         child: Stack(
//           fit: StackFit.expand,
//           children: [
//             state.map(
//               inital: (state) => circularProgress(context),
//               loading: (state) => circularProgress(context),
//               success: (state) => Hero(
//                 tag: state.store.banner,
//                 child: MyNetworkImage(imageUrl: state.store.banner.url),
//               ),
//               failure: (state) => Icon(Icons.error),
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: const [
//                     Colors.black54,
//                     Colors.transparent,
//                   ],
//                   stops: const [0.1, 0.25],
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   tileMode: TileMode.repeated,
//                 ),
//               ),
//             ),
//             Opacity(
//               opacity: 1,
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Theme.of(context).primaryColor,
//                 ),
//               ),
//             ),
//             SafeArea(
//               bottom: false,
//               child: Align(
//                 alignment: Alignment.topCenter,
//                 child: Opacity(
//                   opacity: 1,
//                   child: Text(
//                     state.map(
//                       inital: (state) => '',
//                       loading: (state) => '',
//                       success: (state) => state.store.name.getOrCrash(),
//                       failure: (state) => 'error',
//                     ),
//                     style: TextStyle(color: Colors.white, fontSize: 25.0),
//                   ),
//                 ),
//               ),
//             ),
//             SafeArea(
//               bottom: false,
//               child: Align(
//                 alignment: Alignment.topCenter,
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 20.0),
//                   child: Row(
//                     children: [
//                       BackButton(
//                         color: Colors.white,
//                       ),
//                       Spacer(),
//                       IconButton(
//                         icon: Icon(Icons.more_horiz),
//                         color: Colors.white,
//                         onPressed: () => null,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   double _computeBackgroundFadeOpacity(double shrinkOffset) {
//     final diff = maxExtent - minExtent;
//     final fullyVisibleUntil = diff / 1.5;
//     final cutTopOffset = shrinkOffset >= diff ? diff : shrinkOffset;
//     final cutButtomOffset = cutTopOffset - fullyVisibleUntil <= 0
//         ? 0
//         : cutTopOffset - fullyVisibleUntil;
//     return cutButtomOffset / (maxExtent - minExtent - fullyVisibleUntil);
//   }

//   @override
//   double get maxExtent => extent;

//   @override
//   double get minExtent => MediaQuery.of(context).padding.top + kToolbarHeight;

//   @override
//   bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
//     return false;
//   }
// }
