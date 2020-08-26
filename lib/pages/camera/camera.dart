import 'package:flutter/material.dart';

import 'package:camera/camera.dart';
import 'package:flutter_svg/svg.dart';

class PageCamera extends StatefulWidget {
  @override
  _PageCameraState createState() => _PageCameraState();
}

class _PageCameraState extends State<PageCamera> {
  // 可用摄像头
  List<CameraDescription> cameras;

  // 摄像头控制器
  CameraController controller;

  // 是否初始化完成
  Future<bool> inited;

  @override
  void initState() {
    initCameras();
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: FutureBuilder(
              future: inited,
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                if (snapshot.data == null) return Container();
                return createMainView(context);
              },
            ),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black54,
                    Colors.black12.withAlpha(0),
                  ],
                ),
              ),
              height: MediaQuery.of(context).size.height / 3,
            ),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            child: AppBar(
              backgroundColor: Colors.transparent,
              brightness: Brightness.dark,
              title: Text(
                '摄像机',
                style: TextStyle(color: Colors.white),
              ),
              iconTheme: IconThemeData(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  // 创建默认视图
  Widget createMainView(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Positioned.fill(
          child: OverflowBox(
            minWidth: _width,
            child: AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: CameraPreview(controller),
            ),
          ),
        ),
        Positioned.fill(
          child: SvgPicture.asset(
            'assets/images/bs.svg',
            fit: BoxFit.fitHeight,
          ),
        ),
      ],
    );
  }

  // 初始化摄像头调用
  Future<void> initCameras() async {
    try {
      // 等待页面进入
      await Future.delayed(Duration(milliseconds: 400));

      // 初始化摄像头
      cameras = await availableCameras();

      // 获取前置摄像头
      var _front = cameras.firstWhere(
          (camera) => camera.lensDirection == CameraLensDirection.front);

      var _back = cameras.firstWhere(
          (camera) => camera.lensDirection == CameraLensDirection.back);

      controller = CameraController(
        _front ?? _back ?? cameras[0], // 默认使用前置摄像头，不存在时使用后置或第一个
        ResolutionPreset.max,
        enableAudio: true,
      );

      await controller.initialize();

      inited = Future.value(true);

      if (!mounted) return;

      setState(() {});
    } catch (e) {
      print(e);
    }
  }
}
