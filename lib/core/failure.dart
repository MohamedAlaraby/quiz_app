String getErrorMessage(int statusCode) {
  switch (statusCode) {
    case 400:
      return 'Bad Request: The request could not be understood or was missing required parameters.';
    case 401:
      return 'Unauthorized: Authentication failed or user lacks necessary permissions.';
    case 403:
      return 'Forbidden: The server understood the request, but it refuses to authorize it.';
    case 404:
      return 'Not Found: The requested resource could not be found on the server.';
    case 500:
      return 'Internal Server Error: An unexpected condition was encountered on the server.';
    case 503:
      return 'Service Unavailable: The server is currently unable to handle the request.';
    default:
      return 'Check your network!';
  }
}

