class FileDownloadException implements Exception {
  //Kendime göre Exception'ını özelleştirmiş oldum.
  //implements ederek Exceptiondakı butun hepsini almış oldum

  @override
  String toString() {
    return 'File download has failed';
  }
}
