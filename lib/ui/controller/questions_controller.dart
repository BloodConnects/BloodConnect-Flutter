import 'package:blood_donation_app/domain/share_preference/share_preference_service.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuestionController extends GetxController {
  var currentQuestionIndex = 0.obs;

  final List<String> questions = [
    'Are you at least 18 years old and gained 50kg weight or more than that?',
    'Have you ever been diagnosed with disease like HIV/AIDS, hepatitis, cancer, leukemia,  heart attack, heart disease, stroke, bleeding disorder, diabetes, syphilis or gonorrhea?',
    'Do you have history of high blood pressure or take medications for it?',
    'Have you ever had malaria or lived in a malaria-endemic area or other infectious diseases within the past 3 years?',
    'Have you had close contact with someone who has hepatitis, HIV/AIDS, or any other infectious disease within the past 12 months?',
    'Have you gotten a tattoo, piercing, acupuncture, or engaged in any high-risk behavior such as unprotected sex or intravenous drug use within the past 12 months?',
    'Have you had a successful donation in the past 8 weeks?',
    'Have you had any recent illnesses, or infections within the past 4 weeks?',
    'Have you received any vaccinations within the past 4 weeks?',
    'Have you experienced any symptoms such as fever, cough, sore throat, or diarrhea within the past 1 week?',
  ];

  @override
  void onInit() {
    super.onInit();
    currentQuestionIndex.listen((_) {
      update();
    });
    loadQuestionIndex();
  }

  void goToNextQuestion() {
    if (currentQuestionIndex.value < questions.length - 1) {
      currentQuestionIndex.value++;

      //save the updated questions index
      savedQuestionIndex();
    }
  }

  double get progress {
    return (currentQuestionIndex.value + 1) / questions.length;
  }

  String getCurrentQuestion() {
    return questions[currentQuestionIndex.value];
  }

  Future<void> loadQuestionIndex() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int savedIndex = prefs.getInt('questionIndex') ?? 0;
    currentQuestionIndex.value = savedIndex;
  }

  Future<void> savedQuestionIndex() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt('questionIndex', currentQuestionIndex.value);
  }
}
