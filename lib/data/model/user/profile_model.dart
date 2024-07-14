import '../../../domain/entity/user/profile_entity.dart';

class ProfileModel extends ProfileEntity {
  const ProfileModel({
    String? userName,
    String? email,
    List<dynamic>? photo,
    int? gender,
    dynamic city,
    String? name,
    String? skype,
    dynamic cityId,
    String? fullName,
    dynamic phoneNumberSecond,
    dynamic groupsList,
    String? phoneNumber,
    dynamic phoneNumberThird,
    int? id,
    String? patronymic,
    String? surname,
    String? birthDate,
  }) : super(
    userName: userName,
    email: email,
    photo: photo,
    gender: gender,
    city: city,
    name: name,
    skype: skype,
    cityId: cityId,
    fullName: fullName,
    phoneNumberSecond: phoneNumberSecond,
    groupsList: groupsList,
    phoneNumber: phoneNumber,
    phoneNumberThird: phoneNumberThird,
    id: id,
    patronymic: patronymic,
    surname: surname,
    birthDate: birthDate,
  );

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      userName: json['UserName'],
      email: json['Email'],
      photo: json['Photo'],
      gender: json['Gender'],
      city: json['City'],
      name: json['Name'],
      skype: json['Skype'],
      cityId: json['CityId'],
      fullName: json['FullName'],
      phoneNumberSecond: json['PhoneNumberSecond'],
      groupsList: json['GroupsList'],
      phoneNumber: json['PhoneNumber'],
      phoneNumberThird: json['PhoneNumberThird'],
      id: json['Id'],
      patronymic: json['Patronymic'],
      surname: json['Surname'],
      birthDate: json['BirthDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'email': email,
      'photo': photo,
      'gender': gender,
      'city': city,
      'name': name,
      'skype': skype,
      'cityId': cityId,
      'fullName': fullName,
      'phoneNumberSecond': phoneNumberSecond,
      'groupsList': groupsList,
      'phoneNumber': phoneNumber,
      'phoneNumberThird': phoneNumberThird,
      'id': id,
      'patronymic': patronymic,
      'surname': surname,
      'birthDate': birthDate,
    };
  }

  ProfileEntity toEntity() {
    return ProfileEntity(
      userName: userName,
      email: email,
      photo: photo,
      gender: gender,
      city: city,
      name: name,
      skype: skype,
      cityId: cityId,
      fullName: fullName,
      phoneNumberSecond: phoneNumberSecond,
      groupsList: groupsList,
      phoneNumber: phoneNumber,
      phoneNumberThird: phoneNumberThird,
      id: id,
      patronymic: patronymic,
      surname: surname,
      birthDate: birthDate,
    );
  }
}
