import 'package:cloudinary_public/cloudinary_public.dart';

class CloudinaryService{
  final cloudinary = CloudinaryPublic('dp43meiwd', 'e-learning app');

  Future<String?> uploadImage(String imagePath, String folder) async {
    try {
      final response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(
          imagePath, 
          folder: folder,
          ),
      );
      return response.secureUrl;
    } catch (e) {
      throw Exception('Failed to upload image: $e');
    }
  }

  Future<String> uploadFile(String filePath) async {
    try{
      final response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(
        filePath,
        folder: 'course_resources',
      ),
      );
      return response.secureUrl;
    } catch(e) {
      throw Exception('Failed to upload file: $e');
    }
  }

  Future<String> uploadVideo(String path) async {
    try {
      final response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(
          path,
          folder: 'course_videos',
        ),
      );
      return response.secureUrl;
    } catch (e) {
      throw Exception('Failed to upload video: $e');
    }
  }

}