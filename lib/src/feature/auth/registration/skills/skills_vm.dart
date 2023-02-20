import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zip_care/src/feature/auth/registration/service_rates/service_rates_screen.dart';

final skillsVmProvider =
    ChangeNotifierProvider.autoDispose<SkillsVm>((ref) {
  return SkillsVm();
});

class SkillsVm extends ChangeNotifier {
  List<CheckBoxSkillModel> conditionList = [
    CheckBoxSkillModel(title: "Accident rehablitation"),
    CheckBoxSkillModel(title: "Anxiety"),
    CheckBoxSkillModel(title: "Autism spectrum disorder"),
    CheckBoxSkillModel(title: "Cancer"),
    CheckBoxSkillModel(title: "Catheter care"),
    CheckBoxSkillModel(title: "Continence/incontinence"),
    CheckBoxSkillModel(title: "Depression"),
    CheckBoxSkillModel(title: "Down's syndrome"),
    CheckBoxSkillModel(title: "Eating disorders"),
    CheckBoxSkillModel(title: "Huntingdon's disease"),
    CheckBoxSkillModel(title: "Learning disablities"),
    CheckBoxSkillModel(title: "Mental health"),
    CheckBoxSkillModel(title: "Multiple sclerosis"),
    CheckBoxSkillModel(title: "Occupational therapy"),
    CheckBoxSkillModel(title: "Palliative care"),
    CheckBoxSkillModel(title: "PEG feeding"),
    CheckBoxSkillModel(title: "Physicial disablities (children)"),
    CheckBoxSkillModel(title: "Respiratory conditions"),
    CheckBoxSkillModel(title: "Self-harm"),
    CheckBoxSkillModel(title: "Stoma care"),
    CheckBoxSkillModel(title: "Tourette's syndrome"),
    CheckBoxSkillModel(title: "Anaphylaxis"),
    CheckBoxSkillModel(title: "Arthiritis"),
    CheckBoxSkillModel(title: "Bipolar disorder"),
    CheckBoxSkillModel(title: "Brain injuries"),
    CheckBoxSkillModel(title: "Cerebral palsy"),
    CheckBoxSkillModel(title: "Dementia"),
    CheckBoxSkillModel(title: "Depression"),
    CheckBoxSkillModel(title: "Diabetes"),
    CheckBoxSkillModel(title: "Dysphagia"),
    CheckBoxSkillModel(title: "Epilepsy"),
    CheckBoxSkillModel(title: "Incontinence"),
    CheckBoxSkillModel(title: "Long covid"),
    CheckBoxSkillModel(title: "Motor neurone disease"),
    CheckBoxSkillModel(title: "Obsessive compulsive disorder"),
    CheckBoxSkillModel(title: "Orthopaedic injuries"),
    CheckBoxSkillModel(title: "Parkinson's disease"),
    CheckBoxSkillModel(title: "Physicial disablities"),
    CheckBoxSkillModel(title: "Physiotherapy"),
    CheckBoxSkillModel(title: "Schizophrenia"),
    CheckBoxSkillModel(title: "Spinal injuries"),
    CheckBoxSkillModel(title: "Stroke"),
    CheckBoxSkillModel(title: "Visual and hearing impairments"),
  ];

  List<CheckBoxSkillModel> serviceList = [
    CheckBoxSkillModel(title: "Administration"),
    CheckBoxSkillModel(title: "Cleaning"),
    CheckBoxSkillModel(title: "Cooking"),
    CheckBoxSkillModel(title: "Eating and drinking assistance"),
    CheckBoxSkillModel(title: "Housekeeping"),
    CheckBoxSkillModel(title: "Medication prompting"),
    CheckBoxSkillModel(title: "Gardening"),
    CheckBoxSkillModel(title: "Hoisting"),
    CheckBoxSkillModel(title: "Looking after pets"),
    CheckBoxSkillModel(title: "Huntingdon's disease"),
    CheckBoxSkillModel(title: "Medication prompting"),
    CheckBoxSkillModel(title: "Personal care"),
    CheckBoxSkillModel(title: "Transportation"),
    CheckBoxSkillModel(title: "Companionship"),
  ];

  List<String> enjoyList = [
    'Watching TV shows and movies',
    'Reading',
    'Working out',
    'Arts and Crafts',
    'Board Games',
    'DIY',
    'Yoga',
    'Baking',
    'Gardening',
    'Video games',
    'Meditation',
    'Audio Books and podcasts',
    'Writing',
    'Learning Language',
    'Learning an Instrument'
  ];
  List<String> selectedEnjoy = [];

  List<String> languageList = [
    'English',
    'Hindi',
    'French',
    'Japanese',
    'Spanish'
  ];
  List<String> selectedLanguage = [];

  List<String> softskillList = [
    'Communication',
    'Empathy',
    'Flexibility & adaptability',
    'Emotional stability',
    'Responsibility',
    'Honesty',
    'Time management',
    'Any other'
  ];
  List<String> selectedSoftskill = [];

  addRemoveEnjoy(String data) {
    selectedEnjoy.contains(data)
        ? selectedEnjoy.remove(data)
        : selectedEnjoy.add(data);
    notifyListeners();
  }

  addRemoveLanguage(String data) {
    selectedLanguage.contains(data)
        ? selectedLanguage.remove(data)
        : selectedLanguage.add(data);
    notifyListeners();
  }

  addRemoveSoftSkill(String data) {
    selectedSoftskill.contains(data)
        ? selectedSoftskill.remove(data)
        : selectedSoftskill.add(data);
    notifyListeners();
  }

  updateCheck(index, {bool isService = false}) {
    isService
        ? serviceList[index].isCheck = !serviceList[index].isCheck
        : conditionList[index].isCheck =
            !conditionList[index].isCheck;
    notifyListeners();
  }

  updateRange(index, value, {bool isService = false}) {
    isService
        ? serviceList[index].value = value
        : conditionList[index].value = value;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }

  onNext(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ServiceRatesScreen()));
  }
}

class CheckBoxSkillModel {
  bool isCheck;
  String title;
  RangeValues value;
  CheckBoxSkillModel(
      {this.isCheck = false,
      required this.title,
      this.value = const RangeValues(1.0, 1.0)});
}
