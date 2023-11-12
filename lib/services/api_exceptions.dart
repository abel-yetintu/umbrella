class ApiExceptions implements Exception{
  final String message;
  ApiExceptions({required this.message});
}

class BadRequestException extends ApiExceptions {
  BadRequestException({required super.message});
}

class UnAuthorizedException extends ApiExceptions {
  UnAuthorizedException({required super.message});
}

class FetchDataException extends ApiExceptions {
  FetchDataException({required super.message});
}

class ApiNotRespondingException extends ApiExceptions {
  ApiNotRespondingException({required super.message});
}

class LocationServiceException extends ApiExceptions {
  LocationServiceException({required super.message});
}
