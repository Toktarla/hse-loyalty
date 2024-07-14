import 'package:equatable/equatable.dart';

class IsSuccessResponse extends Equatable {

  final bool? isSuccess;

  final String? message;

  const IsSuccessResponse({
    this.message,
    this.isSuccess
  });


  factory IsSuccessResponse.fromJson(Map<String, dynamic> json) {
    return IsSuccessResponse(
        message: json['message'],
        isSuccess: json['success']
    );
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'Id': id,
  //     'Name': name,
  //     'Organization': organization
  //   };
  // }

  @override
  List<Object?> get props => [message, isSuccess];
}