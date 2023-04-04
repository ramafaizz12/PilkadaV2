part of 'pages.dart';

class Camerabaru extends StatelessWidget {
  XFile? pictureFile;

  Camerabaru({super.key, this.pictureFile});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                await availableCameras().then(
                  (value) => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CameraPage(
                        cameras: value,
                      ),
                    ),
                  ),
                );
              },
              child: const Text('Launch Camera'),
            ),
            if (pictureFile != null)

              // Image.network(
              //   pictureFile!.path,
              //   height: 200,
              // )
              //Android/iOS
              Image.file(File(pictureFile!.path))
          ],
        ),
      ),
    );
  }
}
