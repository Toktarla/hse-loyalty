import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final String? userName;
  final String? email;
  final List<dynamic>? photo;
  final int? gender;
  final dynamic city;
  final String? name;
  final String? skype;
  final dynamic cityId;
  final String? fullName;
  final dynamic phoneNumberSecond;
  final dynamic groupsList;
  final String? phoneNumber;
  final dynamic phoneNumberThird;
  final int? id;
  final String? patronymic;
  final String? surname;
  final String? birthDate;

  const ProfileEntity({
    this.userName,
    this.email,
    this.photo,
    this.gender,
    this.city,
    this.name,
    this.skype,
    this.cityId,
    this.fullName,
    this.phoneNumberSecond,
    this.groupsList,
    this.phoneNumber,
    this.phoneNumberThird,
    this.id,
    this.patronymic,
    this.surname,
    this.birthDate,
  });

  int? getBirthDateLong() {
    if (birthDate != null) {
      return int.tryParse(birthDate!.substring(6, birthDate!.length - 2));
    } else {
      return null;
    }
  }

  @override
  List<Object?> get props => [
    userName,
    email,
    photo,
    gender,
    city,
    name,
    skype,
    cityId,
    fullName,
    phoneNumberSecond,
    groupsList,
    phoneNumber,
    phoneNumberThird,
    id,
    patronymic,
    surname,
    birthDate,
  ];
}
