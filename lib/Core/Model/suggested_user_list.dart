import 'dart:convert';

SuggestedUserList suggestedUserListFromJson(String str) =>
    SuggestedUserList.fromJson(json.decode(str));

String suggestedUserListToJson(SuggestedUserList data) =>
    json.encode(data.toJson());

class SuggestedUserList {
  int? respCode;
  List<Datum>? data;
  String? message;

  SuggestedUserList({
    this.respCode,
    this.data,
    this.message,
  });

  factory SuggestedUserList.fromJson(Map<String, dynamic> json) =>
      SuggestedUserList(
        respCode: json["resp_code"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "resp_code": respCode,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
      };
}

class Datum {
  int? id;
  User? user;
  int? currentUser;
  String? customerUid;
  ProfileCreationFor? profileCreationFor;
  DateTime? dob;
  Gender? gender;
  String? fair;
  dynamic profileVideo;
  dynamic address;
  dynamic corporation;
  dynamic wardNumber;
  dynamic documentType;
  dynamic documentNumber;
  dynamic documentFile;
  double? height;
  double? weight;
  String? socialMediaAccount;
  String? physicallyChallenged;
  String? aboutFamily;
  dynamic citizenship;
  dynamic ancestralOrigin;
  String? annualIncome;
  dynamic collegeName;
  bool? isPrime;
  bool? interestInIntercast;
  dynamic latitude;
  dynamic longitude;
  dynamic location;
  String? tellUsAboutYou;
  dynamic horoscope;
  dynamic horoscopeBirthDate;
  dynamic horoscopeBirthTime;
  String? placeOfBirth;
  String? star;
  String? raasi;
  String? completedPages;
  DateTime? createdDate;
  String? createdTime;
  DateTime? modifiedDate;
  String? modifiedTime;
  bool? flag;
  bool? isVerified;
  dynamic deviceId;
  dynamic deactivateOptions;
  dynamic deactivatedDate;
  DateTime? lastSeen;
  int? religion;
  int? caste;
  int? subCaste;
  dynamic education;
  dynamic employedIn;
  dynamic occupation;
  dynamic workCountry;
  dynamic workState;
  dynamic workCity;
  int? country;
  int? state;
  int? city;
  dynamic motherToungue;
  dynamic physicalStatus;
  dynamic bodyType;
  dynamic eatingHabit;
  dynamic drinkingHabit;
  dynamic smokingHabit;
  dynamic familyValue;
  dynamic familyType;
  dynamic familyStatus;
  dynamic maritalStatus;
  dynamic fatherEmployement;
  dynamic motherEmployement;
  dynamic fatherOccupation;
  dynamic motherOccupation;
  dynamic fatherEducation;
  dynamic motherEducation;
  List<dynamic>? interestCategory;
  List<dynamic>? interests;
  InterestStatus? interestStatus;
  bool? shortListed;

  Datum({
    this.id,
    this.user,
    this.currentUser,
    this.customerUid,
    this.profileCreationFor,
    this.dob,
    this.gender,
    this.fair,
    this.profileVideo,
    this.address,
    this.corporation,
    this.wardNumber,
    this.documentType,
    this.documentNumber,
    this.documentFile,
    this.height,
    this.weight,
    this.socialMediaAccount,
    this.physicallyChallenged,
    this.aboutFamily,
    this.citizenship,
    this.ancestralOrigin,
    this.annualIncome,
    this.collegeName,
    this.isPrime,
    this.interestInIntercast,
    this.latitude,
    this.longitude,
    this.location,
    this.tellUsAboutYou,
    this.horoscope,
    this.horoscopeBirthDate,
    this.horoscopeBirthTime,
    this.placeOfBirth,
    this.star,
    this.raasi,
    this.completedPages,
    this.createdDate,
    this.createdTime,
    this.modifiedDate,
    this.modifiedTime,
    this.flag,
    this.isVerified,
    this.deviceId,
    this.deactivateOptions,
    this.deactivatedDate,
    this.lastSeen,
    this.religion,
    this.caste,
    this.subCaste,
    this.education,
    this.employedIn,
    this.occupation,
    this.workCountry,
    this.workState,
    this.workCity,
    this.country,
    this.state,
    this.city,
    this.motherToungue,
    this.physicalStatus,
    this.bodyType,
    this.eatingHabit,
    this.drinkingHabit,
    this.smokingHabit,
    this.familyValue,
    this.familyType,
    this.familyStatus,
    this.maritalStatus,
    this.fatherEmployement,
    this.motherEmployement,
    this.fatherOccupation,
    this.motherOccupation,
    this.fatherEducation,
    this.motherEducation,
    this.interestCategory,
    this.interests,
    this.interestStatus,
    this.shortListed,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        currentUser: json["current_user"],
        customerUid: json["customer_uid"],
        profileCreationFor:
            profileCreationForValues.map[json["profile_creation_for"]]!,
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        gender: genderValues.map[json["gender"]]!,
        fair: json["fair"],
        profileVideo: json["profile_video"],
        address: json["address"],
        corporation: json["corporation"],
        wardNumber: json["ward_number"],
        documentType: json["document_type"],
        documentNumber: json["document_number"],
        documentFile: json["document_file"],
        height: json["height"],
        weight: json["weight"],
        socialMediaAccount: json["social_media_account"],
        physicallyChallenged: json["physically_challenged"],
        aboutFamily: json["about_family"],
        citizenship: json["citizenship"],
        ancestralOrigin: json["ancestral_origin"],
        annualIncome: json["annual_income"],
        collegeName: json["college_name"],
        isPrime: json["is_prime"],
        interestInIntercast: json["interest_in_intercast"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        location: json["location"],
        tellUsAboutYou: json["tell_us_about_you"],
        horoscope: json["horoscope"],
        horoscopeBirthDate: json["horoscope_birth_date"],
        horoscopeBirthTime: json["horoscope_birth_time"],
        placeOfBirth: json["place_of_birth"],
        star: json["star"],
        raasi: json["raasi"],
        completedPages: json["completed_pages"],
        createdDate: json["created_date"] == null
            ? null
            : DateTime.parse(json["created_date"]),
        createdTime: json["created_time"],
        modifiedDate: json["modified_date"] == null
            ? null
            : DateTime.parse(json["modified_date"]),
        modifiedTime: json["modified_time"],
        flag: json["flag"],
        isVerified: json["is_verified"],
        deviceId: json["device_id"],
        deactivateOptions: json["deactivate_options"],
        deactivatedDate: json["deactivated_date"],
        lastSeen: json["last_seen"] == null
            ? null
            : DateTime.parse(json["last_seen"]),
        religion: json["religion"],
        caste: json["caste"],
        subCaste: json["sub_caste"],
        education: json["education"],
        employedIn: json["employed_in"],
        occupation: json["occupation"],
        workCountry: json["work_country"],
        workState: json["work_state"],
        workCity: json["work_city"],
        country: json["country"],
        state: json["state"],
        city: json["city"],
        motherToungue: json["mother_toungue"],
        physicalStatus: json["physical_status"],
        bodyType: json["body_type"],
        eatingHabit: json["eating_habit"],
        drinkingHabit: json["drinking_habit"],
        smokingHabit: json["smoking_habit"],
        familyValue: json["family_value"],
        familyType: json["family_type"],
        familyStatus: json["family_status"],
        maritalStatus: json["marital_status"],
        fatherEmployement: json["father_employement"],
        motherEmployement: json["mother_employement"],
        fatherOccupation: json["father_occupation"],
        motherOccupation: json["mother_occupation"],
        fatherEducation: json["father_education"],
        motherEducation: json["mother_education"],
        interestCategory: json["interest_category"] == null
            ? []
            : List<dynamic>.from(json["interest_category"]!.map((x) => x)),
        interests: json["interests"] == null
            ? []
            : List<dynamic>.from(json["interests"]!.map((x) => x)),
        interestStatus: json["interest_status"] == null
            ? null
            : InterestStatus.fromJson(json["interest_status"]),
        shortListed: json["short_listed"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user?.toJson(),
        "current_user": currentUser,
        "customer_uid": customerUid,
        "profile_creation_for":
            profileCreationForValues.reverse[profileCreationFor],
        "dob":
            "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "gender": genderValues.reverse[gender],
        "fair": fair,
        "profile_video": profileVideo,
        "address": address,
        "corporation": corporation,
        "ward_number": wardNumber,
        "document_type": documentType,
        "document_number": documentNumber,
        "document_file": documentFile,
        "height": height,
        "weight": weight,
        "social_media_account": socialMediaAccount,
        "physically_challenged": physicallyChallenged,
        "about_family": aboutFamily,
        "citizenship": citizenship,
        "ancestral_origin": ancestralOrigin,
        "annual_income": annualIncome,
        "college_name": collegeName,
        "is_prime": isPrime,
        "interest_in_intercast": interestInIntercast,
        "latitude": latitude,
        "longitude": longitude,
        "location": location,
        "tell_us_about_you": tellUsAboutYou,
        "horoscope": horoscope,
        "horoscope_birth_date": horoscopeBirthDate,
        "horoscope_birth_time": horoscopeBirthTime,
        "place_of_birth": placeOfBirth,
        "star": star,
        "raasi": raasi,
        "completed_pages": completedPages,
        "created_date":
            "${createdDate!.year.toString().padLeft(4, '0')}-${createdDate!.month.toString().padLeft(2, '0')}-${createdDate!.day.toString().padLeft(2, '0')}",
        "created_time": createdTime,
        "modified_date":
            "${modifiedDate!.year.toString().padLeft(4, '0')}-${modifiedDate!.month.toString().padLeft(2, '0')}-${modifiedDate!.day.toString().padLeft(2, '0')}",
        "modified_time": modifiedTime,
        "flag": flag,
        "is_verified": isVerified,
        "device_id": deviceId,
        "deactivate_options": deactivateOptions,
        "deactivated_date": deactivatedDate,
        "last_seen": lastSeen?.toIso8601String(),
        "religion": religion,
        "caste": caste,
        "sub_caste": subCaste,
        "education": education,
        "employed_in": employedIn,
        "occupation": occupation,
        "work_country": workCountry,
        "work_state": workState,
        "work_city": workCity,
        "country": country,
        "state": state,
        "city": city,
        "mother_toungue": motherToungue,
        "physical_status": physicalStatus,
        "body_type": bodyType,
        "eating_habit": eatingHabit,
        "drinking_habit": drinkingHabit,
        "smoking_habit": smokingHabit,
        "family_value": familyValue,
        "family_type": familyType,
        "family_status": familyStatus,
        "marital_status": maritalStatus,
        "father_employement": fatherEmployement,
        "mother_employement": motherEmployement,
        "father_occupation": fatherOccupation,
        "mother_occupation": motherOccupation,
        "father_education": fatherEducation,
        "mother_education": motherEducation,
        "interest_category": interestCategory == null
            ? []
            : List<dynamic>.from(interestCategory!.map((x) => x)),
        "interests": interests == null
            ? []
            : List<dynamic>.from(interests!.map((x) => x)),
        "interest_status": interestStatus?.toJson(),
        "short_listed": shortListed,
      };
}

enum Gender { FEMALE }

final genderValues = EnumValues({"female": Gender.FEMALE});

class InterestStatus {
  InterestStatus();

  factory InterestStatus.fromJson(Map<String, dynamic> json) =>
      InterestStatus();

  Map<String, dynamic> toJson() => {};
}

enum ProfileCreationFor { MY_SELF }

final profileCreationForValues =
    EnumValues({"my_self": ProfileCreationFor.MY_SELF});

class User {
  int? id;
  String? username;
  String? firstName;
  LastName? lastName;
  String? email;
  String? phone;
  dynamic countryCode;

  User({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.countryCode,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        firstName: json["first_name"],
        lastName: lastNameValues.map[json["last_name"]]!,
        email: json["email"],
        phone: json["phone"],
        countryCode: json["country_code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "first_name": firstName,
        "last_name": lastNameValues.reverse[lastName],
        "email": email,
        "phone": phone,
        "country_code": countryCode,
      };
}

enum LastName { K, KV, NN }

final lastNameValues =
    EnumValues({"K": LastName.K, "KV": LastName.KV, "nn": LastName.NN});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
