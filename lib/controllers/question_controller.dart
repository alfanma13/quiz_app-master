import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:quiz_app/models/Questions.dart';
import 'package:quiz_app/screens/score/score_screen.dart';

// Get buat package manajemen
class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  // buat animasi package bar

  AnimationController _animationController;
  Animation _animation;
  // buat akses animasi 
  Animation get animation => this._animation;

  PageController _pageController;
  PageController get pageController => this._pageController;

  List<Question> _questions = sample_data
      .map(
        (question) => Question(
            id: question['id'],
            question: question['question'],
            options: question['options'],
            answer: question['answer_index']),
      )
      .toList();
  List<Question> get questions => this._questions;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  int _correctAns;
  int get correctAns => this._correctAns;

  int _selectedAns;
  int get selectedAns => this._selectedAns;

  // buat chek obs maka check documentation
  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  int _numOfCorrectAns = 0;

  int get numOfCorrectAns => this._numOfCorrectAns;

  // buat manggil segera setelah widget dialokasikan oleh memory
  @override
  void onInit() {
    // durasi animasi 30 detik
    // isi progress bar dengan animasi sebelum 30 detik
    _animationController =
    
        AnimationController(duration: Duration(seconds: 30), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        // update setState
        update();
      });

    // start animasi
    // saaat udah 30 detik maka ke pertanyaan selanjutnya
    _animationController.forward().whenComplete(nextQuestion);
    _pageController = PageController();
    super.onInit();
  }

  // // memanggil hanya saat controller terhapus dari memory
  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  void checkAns(Question question, int selectedIndex) {
    // karena per sekali user mencet langsung run
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) _numOfCorrectAns++;

    // buat nyetop counter
    _animationController.stop();
    update();

    // pengguna akan ngeklik jawaban dan setelah 3 dtk delay akan ke pwrtanyaan setelah
    Future.delayed(Duration(seconds: 3), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);

      // buat rest counter
      _animationController.reset();

      // kemudian akan memulai lagi
      // saat counter sampai finish lanjut ke pertanyaan setelahnya
      _animationController.forward().whenComplete(nextQuestion);
    } else {
      // Get package buat simple kita ke scoresreen
      Get.to(ScoreScreen());
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }
}
