import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class GLBViewer extends StatelessWidget {
  final String filePath;

  const GLBViewer({required this.filePath, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ModelViewer(
        src: filePath, // .glb veya .gltf dosyasının yolu
        alt: "3D Model",
        autoRotate: true,
        cameraControls: true,
        ar: true, // Artırılmış Gerçeklik desteği (AR)
      ),
    );
  }
}
