// import 'package:flick_video_player/flick_video_player.dart';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:visibility_detector/visibility_detector.dart';

// class LocalVideoPlayer extends StatefulWidget {
//   const LocalVideoPlayer({Key? key, required this.videoUrl}) : super(key: key);

//   final String videoUrl;

//   @override
//   _LocalVideoPlayerState createState() => _LocalVideoPlayerState();
// }

// class _LocalVideoPlayerState extends State<LocalVideoPlayer> {

//   late FlickManager flickManager;
//   @override
//   void initState() {
//     super.initState();
//     flickManager = FlickManager(
//       autoInitialize: true,
//       autoPlay: false,
//       videoPlayerController: VideoPlayerController.network(widget.videoUrl),
//     );
//   }

//   @override
//   void dispose() {
//     flickManager.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return VisibilityDetector(
//       key: ObjectKey(flickManager),
//       onVisibilityChanged: (visibility) {
//         if (visibility.visibleFraction == 0 && this.mounted) {
//           flickManager.flickControlManager?.autoPause();
//         } else if (visibility.visibleFraction == 1) {
//           flickManager.flickControlManager?.autoResume();
//         }
//       },
//       child: FlickVideoPlayer(
//             flickManager: flickManager,
//             flickVideoWithControls: FlickVideoWithControls(
//               controls: FlickPortraitControls(),
//             ),
//             flickVideoWithControlsFullscreen: FlickVideoWithControls(
//               videoFit: BoxFit.fill,
//               controls: SafeArea(child: FlickLandscapeControls()),
//             ),
//           ),
//     );
    
    
    
//     // Container(
//     //   child: FlickVideoPlayer(
//     //     flickManager: flickManager,
//     //     flickVideoWithControlsFullscreen: FlickVideoWithControls(
//     //       videoFit: BoxFit.fill,
//     //       controls: SafeArea(
//     //         child: FlickPortraitControls(),
//     //       ),
//     //     ),
//     //   ),
//     // );
//   }
// }




// //  --better player plugin

// // class LocalVideoPlayer extends StatefulWidget {
// //   const LocalVideoPlayer({Key? key, required this.videoUrl}) : super(key: key);

// //   final String videoUrl;

// //   @override
// //   _LocalVideoPlayerState createState() => _LocalVideoPlayerState();
// // }

// // class _LocalVideoPlayerState extends State<LocalVideoPlayer> {
// //   late BetterPlayerController _betterPlayerController;

// //   @override
// //   void initState() {
// //     super.initState();
// //     BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(BetterPlayerDataSourceType.network, widget.videoUrl);
// //     _betterPlayerController = BetterPlayerController(
      
// //       BetterPlayerConfiguration(
// //         deviceOrientationsAfterFullScreen: const [DeviceOrientation.portraitUp],
// //         aspectRatio: 16/9,
// //         controlsConfiguration: BetterPlayerControlsConfiguration(
// //           enableSkips: false, 
// //           enableOverflowMenu: false
// //         )
// //       ),
// //       betterPlayerDataSource: betterPlayerDataSource,
      
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return AspectRatio(
// //         aspectRatio: 16 / 9,
// //         child: BetterPlayer(
// //           controller: _betterPlayerController,
// //         )
// //     );
// //   }
// // }