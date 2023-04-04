part of 'pages.dart';

/// CameraApp is the Main Application.
class CameraPage extends StatefulWidget {
  final List<CameraDescription>? cameras;
  const CameraPage({this.cameras, Key? key}) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController controller;
  XFile? pictureFile;

  @override
  void initState() {
    super.initState();
    controller = CameraController(
      widget.cameras![0],
      ResolutionPreset.max,
    );
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  _kepageutama() {
    if (pictureFile != null) {
      Navigator.pop(context, pictureFile);
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return const SizedBox(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return LayoutBuilder(
      builder: (p0, p1) => Scaffold(
        body: Stack(
          children: [
            Container(
                width: p1.maxWidth, height: p1.maxHeight, color: birumuda),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: p1.maxHeight * 0.7,
                    width: p1.maxWidth,
                    child: CameraPreview(controller),
                  ),
                  SizedBox(
                    height: p1.maxHeight * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        backgroundColor: colorbiru,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          color: birumuda,
                          Icons.arrow_back,
                        ),
                      ),
                      FloatingActionButton(
                        backgroundColor: colorbiru,
                        onPressed: () async {
                          pictureFile = await controller.takePicture();

                          setState(() {});
                          _kepageutama();
                        },
                        child: const Icon(
                          color: birumuda,
                          Icons.camera,
                        ),
                      ),
                      FloatingActionButton(
                        backgroundColor: colorbiru,
                        onPressed: () async {
                          controller.setFlashMode(FlashMode.auto);
                        },
                        child: const Icon(
                          color: birumuda,
                          Icons.light_mode,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: p1.maxHeight * 0.3),
                child: Column(children: [
                  Container(
                    width: p1.maxWidth * 0.8,
                    height: p1.maxHeight * 0.25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: putih, width: 1.0)),
                  ),
                  Text('Mohon Sejajarkan KTP Anda\nPada Bagian Kotak',
                      style: textpoppin.copyWith(color: putih),
                      textAlign: TextAlign.center)
                ]),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: ElevatedButton(
            //     onPressed: () async {
            //       pictureFile = await controller.takePicture();

            //       setState(() {});
            //       _kepageutama();
            //     },
            //     child: const Text('Capture Image'),
            //   ),
            // ),
            // if (pictureFile != null)

            //   // Image.network(
            //   //   pictureFile!.path,
            //   //   height: 200,
            //   // )
            //   //Android/iOS
            //   Image.file(File(pictureFile!.path))
          ],
        ),
      ),
    );
  }
}
