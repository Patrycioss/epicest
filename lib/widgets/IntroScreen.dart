import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../testing/statemanager.dart';

class IntroScreen extends StatefulWidget
{
  const IntroScreen({super.key});

  @override
  State<StatefulWidget> createState() => _IntroScreenState();
}


class _IntroScreenState extends State<IntroScreen> {

    late VideoPlayerController _controller;
    late Future<void> _initializeVideoPlayerFuture;

    late Timer timer;

    @override
    void initState() {
      super.initState();
      _controller = VideoPlayerController.asset('assets/splash_screen.mp4');
      _initializeVideoPlayerFuture = _controller.initialize();
      _controller.addListener(() {
        if (!_controller.value.isPlaying) Provider.of<StateManager>(
            context, listen: false).setCurrentState("MainPage");
      });
    }

    @override
    void dispose() {
      _controller.dispose();
      super.dispose();
    }

    @override
    Widget build(BuildContext context) {
      // Complete the code in the next step.
      return Scaffold(
        body: Container(
          color: const Color.fromARGB(255, 100, 167, 152),
          child: Center(
            child: FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  _controller.play();

                  timer = Timer.periodic(const Duration(milliseconds: 25),
                      (Timer timer) => setState(
                      ()
                      {
                        if (!_controller.value.isPlaying) Provider.of<StateManager>(context, listen: false).setCurrentState("MainPage");
                      }
                      ),
                  );


                  // If the VideoPlayerController has finished initialization, use
                  // the data it provides to limit the aspect ratio of the video.
                  return AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    // Use the VideoPlayer widget to display the video.
                    child: VideoPlayer(_controller),
                  );
                } else {
                  // If the VideoPlayerController is still initializing, show a
                  // loading spinner.
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ),
      );
    }

    // const oneSec = Duration(milliseconds: 200);
    // int added = 0;
    // return Lottie.asset('assets/splash_screen_new.json',
    //   onLoaded: (composition){
    //     Timer.periodic(
    //       oneSec,
    //           (Timer timer) => setState(() {
    //         if (added >= 4000) {
    //           print("Tested");
    //           timer.cancel();
    //           Provider.of<StateManager>(context, listen:false).setCurrentState("MainPage");
    //           added = 0;
    //         }
    //         else {
    //           print("Testing");
    //           added = added + oneSec.inMilliseconds;
    //         }
    //       },
    //       ),
    //     );
    //   });
}