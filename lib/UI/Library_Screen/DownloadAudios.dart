import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:mentaltraining/Custom%20Widget/customHeaderText.dart';
import 'package:mentaltraining/Model/SubCategoryResponse.dart';
import 'package:mentaltraining/Resources/string_resource.dart';
import 'package:mentaltraining/UI/Library_Screen/CategoryAboutScreen.dart';

import '../../../Resources/color_resource.dart';
import '../../../Resources/image_resource.dart';

// ignore: must_be_immutable
class DownloadAudio extends StatefulWidget {
  SubItems? allUseSubCategory;

  DownloadAudio({Key? key,this.allUseSubCategory}) : super(key: key);


  @override
  State<DownloadAudio> createState() => _DownloadAudioState();
}

class _DownloadAudioState extends State<DownloadAudio> {
  List<String> songUrl = [
    'inspiring-emotional-uplifting-piano-112623.mp3',
    'sample4.m4a',
    'sample4.m4a',
    'sample4.m4a',
    'sample4.m4a',
  ];

  int? tappedIndex;

  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();
    tappedIndex = 0;
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.PLAYING;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
    audioPlayer.onAudioPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: Center(
                      child: customHeaderText(
                        btnLabel: categoryName,
                        color: AppColor.black,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        backImg,
                        height: 42,
                        width: 42,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 20,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const CategoryAboutScreen();
                          },
                        ));
                      },
                      child: Image.asset(
                        infoImg,
                        height: 42,
                        width: 42,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Image.network(
              widget.allUseSubCategory!.imageUrl!,
              fit: BoxFit.fill,
              height: 250,
              width: MediaQuery.of(context).size.width,
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        audioList,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: AppColor.black),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 30),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                if (isPlaying) {
                                  await audioPlayer.pause();
                                } else {
                                  await audioPlayer.resume();
                                }
                              },
                              child: Image.asset(
                                isPlaying ? pause : play,
                                height: 60,
                                width: 60,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(position.toString().split(".")[0]),
                                  Text(duration.toString().split(".")[0]),
                                ],
                              ),
                            ),
                            Slider(
                                activeColor: AppColor.blue,
                                thumbColor: AppColor.blue,
                                inactiveColor: AppColor.lightBlue,
                                min: 0,
                                max: duration.inSeconds.toDouble(),
                                value: position.inSeconds.toDouble(),
                                onChanged: (value) async {
                                  final position =
                                      Duration(seconds: value.toInt());
                                  await audioPlayer.seek(position);
                                  await audioPlayer.resume();
                                }),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Expanded(
                        child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 8,
                            );
                          },
                          shrinkWrap: true,
                          itemCount: widget.allUseSubCategory!.files!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                  color: AppColor.white,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Column(
                                children: [
                                  ListTile(
                                    onTap: () async {
                                      setState(() {
                                        tappedIndex = index;
                                      });
                                      audioPlayer
                                          .setReleaseMode(ReleaseMode.LOOP);
                                      // var player =
                                      //     AudioCache(prefix: 'assets/sound/');
                                      // var url =
                                      //     await player.load(widget.allUseSubCategory!.files![index].adminUrl!);
                                      // audioPlayer.setUrl(url.path,
                                      //     isLocal: true);

                                      // audioPlayer.setUrl(widget.allUseSubCategory!.files![index].adminUrl!);
                                      audioPlayer.setUrl("https://mindtastik.com/appcnt/650SleepStories11-ThePowerofForgiveness-17Min.mp3");
                                    },
                                    // leading: Text(
                                    //   "${index + 1}",
                                    //   style: TextStyle(
                                    //       color: tappedIndex == index
                                    //           ? AppColor.yellow
                                    //           : AppColor.black,
                                    //       fontSize: 14,
                                    //       fontWeight: FontWeight.w500),
                                    // ),
                                    title: Text(
                                      (widget.allUseSubCategory!.files![index].name!),
                                      style: TextStyle(
                                          color: tappedIndex == index
                                              ? AppColor.yellow
                                              : AppColor.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    trailing: Text(
                                      duration.toString().split(".")[0],
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: AppColor.greyLight),
                                    ),
                                  ),
                                  // Visibility(
                                  //   visible: visibleEdit,
                                  //   // key: Key(index.toString()),
                                  //   child: Container(
                                  //     height: 120,
                                  //     width: 330,
                                  //     color: Colors.red,
                                  //   )
                                  // )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
// class _ListTileWidget extends State<ListTileWidget> {
//   // This is for individual ListTile reference
//   bool isSelected = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           ListTile(
//               title: Text(widget.title),
//               onTap: () => setState((){ isSelected = !isSelected; }) // doing toggle
//           ),
//           // for each listtile individually, it shows/hide Row accordingly
//           isSelected
//               ? Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Text("Edit"),
//                 SizedBox(width: 50.0),
//                 Text("Delete")
//               ]
//           ) : Container()
//         ]
//     );
//   }
// }
