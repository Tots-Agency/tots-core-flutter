
class TotsFile {
  String name = "";
  String url = "";
  int size = 0;

  static fromCloudStorage(dynamic response) {
    TotsFile file = TotsFile();
    file.name = response['name'];
    file.url = 'https://storage.googleapis.com/${response["bucket"]}/${response["name"]}';
    // Verify if size is string and convert to int
    if (response['size'] is String) {
      file.size = int.parse(response['size']);
    } else {
      file.size = response['size'];
    }
    return file;  
  }
}