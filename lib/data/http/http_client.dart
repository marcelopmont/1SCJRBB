abstract class HttpClient {
  Future<Map<String, dynamic>?> get({
    required String url,
  });
}
