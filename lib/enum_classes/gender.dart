enum Gender {
  Male,
  Female,
  Other;

  String toDisplayText() {
    switch(this) {
      case Gender.Male:{
        return "Male";
      }
      case Gender.Female:{
        return "Female";
      }
      case Gender.Other:{
        return "Other";
      }
    }
  }
}