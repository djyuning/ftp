import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ftp/pages/camera/camera.dart';

class PageApp extends StatefulWidget {
  @override
  _PageAppState createState() => _PageAppState();
}

class _PageAppState extends State<PageApp> {
  /// 高亮菜单
  String _currentDrawerMenuItem = 'PageHome';

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        elevation: 0,
        child: Column(
          // 内容列表
          children: [
            Container(
              color: Colors.blueAccent,
              height: 200,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: 24),
                    DrawerMenuItem(
                      icon: Icon(
                        Icons.home,
                        size: 20,
                        color: Colors.red,
                      ),
                      title: '主页',
                      current: _currentDrawerMenuItem == 'PageHome',
                      onTap: () {
                        _currentDrawerMenuItem = 'PageHome';
                        setState(() {});
                        Navigator.pop(context);
                      },
                    ),
                    DrawerMenuItem(
                      icon: Icon(
                        Icons.camera,
                        size: 20,
                        color: Colors.greenAccent,
                      ),
                      title: '摄像机',
                      current: _currentDrawerMenuItem == 'PageCamera',
                      onTap: () {
                        _currentDrawerMenuItem = 'PageCamera';
                        setState(() {});
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          CupertinoPageRoute(builder: (_) => PageCamera()),
                        );
                      },
                    ),
                    DrawerMenuItem(
                      icon: Icon(
                        Icons.code,
                        size: 20,
                        color: Colors.orange,
                      ),
                      title: '二维码扫码',
                      current: _currentDrawerMenuItem == 'PageScanQRCode',
                      onTap: () {
                        _currentDrawerMenuItem = 'PageScanQRCode';
                        setState(() {});
                        Navigator.pop(context);
                      },
                    ),
                    DrawerMenuItem(
                      icon: Icon(
                        Icons.router,
                        size: 20,
                        color: Colors.blueGrey,
                      ),
                      title: '路由管理',
                      current: _currentDrawerMenuItem == 'PageNavigator',
                      onTap: () {
                        _currentDrawerMenuItem = 'PageNavigator';
                        setState(() {});
                        Navigator.pop(context);
                      },
                    ),
                    DrawerMenuItem(
                      icon: Icon(
                        Icons.storage,
                        size: 20,
                        color: Colors.amber,
                      ),
                      title: '本地持久化存储',
                      current: _currentDrawerMenuItem == 'PageSP',
                      onTap: () {
                        _currentDrawerMenuItem = 'PageSP';
                        setState(() {});
                        Navigator.pop(context);
                      },
                    ),
                    DrawerMenuItem(
                      icon: Icon(
                        Icons.dock,
                        size: 20,
                        color: Colors.purpleAccent,
                      ),
                      title: '辅助方法',
                      current: _currentDrawerMenuItem == 'PageTools',
                      onTap: () {
                        _currentDrawerMenuItem = 'PageTools';
                        setState(() {});
                        Navigator.pop(context);
                      },
                    ),
                    DrawerMenuItem(
                      icon: Icon(
                        Icons.translate,
                        size: 20,
                        color: Colors.teal,
                      ),
                      title: '多语言支持',
                      current: _currentDrawerMenuItem == 'PageLocalization',
                      onTap: () {
                        _currentDrawerMenuItem = 'PageLocalization';
                        setState(() {});
                        Navigator.pop(context);
                      },
                    ),
                    DrawerMenuItem(
                      icon: Icon(
                        Icons.photo_library,
                        size: 20,
                        color: Colors.brown,
                      ),
                      title: '相册选择',
                      current: _currentDrawerMenuItem == 'PageGalleryPicker',
                      onTap: () {
                        _currentDrawerMenuItem = 'PageGalleryPicker';
                        setState(() {});
                        Navigator.pop(context);
                      },
                    ),
                    DrawerMenuItem(
                      icon: Icon(
                        Icons.color_lens,
                        size: 20,
                        color: Colors.cyanAccent,
                      ),
                      title: '主题切换',
                      current: _currentDrawerMenuItem == 'PageTheme',
                      onTap: () {
                        _currentDrawerMenuItem = 'PageTheme';
                        setState(() {});
                        Navigator.pop(context);
                      },
                    ),
                    DrawerMenuItem(
                      icon: Icon(
                        Icons.network_check,
                        size: 20,
                        color: Colors.cyanAccent,
                      ),
                      title: '网络请求',
                      current: _currentDrawerMenuItem == 'PageHttp',
                      onTap: () {
                        _currentDrawerMenuItem = 'PageHttp';
                        setState(() {});
                        Navigator.pop(context);
                      },
                    ),
                    DrawerMenuItem(
                      title: '上传和下载',
                      current: _currentDrawerMenuItem == 'PageLoader',
                      onTap: () {
                        _currentDrawerMenuItem = 'PageLoader';
                        setState(() {});
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            // Divider(height: 1, color: Colors.grey.withAlpha(50)),
            Container(
              color: Colors.white,
              // height: 100,
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Version 1.0.0',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Flutter With tPeriod'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          // 内容列表
          children: [
            ListTile(
              title: Text('摄像机'),
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (_) => PageCamera()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// 菜单项
class DrawerMenuItem extends StatelessWidget {
  /// 图标
  final Icon icon;

  /// 是否已选中
  final bool current;

  /// 标题文本
  final String title;

  /// 点击事件
  final VoidCallback onTap;

  /// 菜单项
  DrawerMenuItem({
    this.icon,
    @required this.title,
    this.current = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: current ? Colors.blueAccent : Colors.transparent,
              ),
              margin: EdgeInsets.only(right: 16),
              height: 48,
              width: 4,
            ),
            if (icon != null)
              Container(
                child: icon,
                height: 48,
                margin: EdgeInsets.only(right: 16),
              ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 16),
                child: Text(
                  title ?? '未定标题',
                  style: TextStyle(
                    fontWeight: current ? FontWeight.bold : FontWeight.normal,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        if (onTap == null) return;
        onTap.call();
      },
    );
  }
}
