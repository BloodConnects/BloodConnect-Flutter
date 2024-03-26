enum BloodGroup {
  oPositive,
  oNegative,
  aPositive,
  aNegative,
  bPositive,
  bNegative,
  abPositive,
  abNegative,
  unknown;

  String toDisplayText() {
    switch(this) {
      case BloodGroup.oPositive:{
        return "O Positive";
      }
      case BloodGroup.oNegative:{
        return "O Negative";
      }
      case BloodGroup.aPositive:{
        return "A Positive";
      }
      case BloodGroup.aNegative:{
        return "A Negative";
      }
      case BloodGroup.bPositive:{
        return "B Positive";
      }
      case BloodGroup.bNegative:{
        return "B Negative";
      }
      case BloodGroup.abPositive:{
        return "AB Positive";
      }
      case BloodGroup.abNegative:{
        return "AB Negative";
      }
      default: return "unknown";
    }
  }
}