class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question({this.id, this.question, this.answer, this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question": "Siapakah Presiden Pertama Indonesia ?",
    "options": ['Luhut Binsar P', 'Ir. Soekarno', 'Raisa', 'Megawati'],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question": "Salah satu pulau terbesar di Indonesia dengan awalan huruf K adalah pulau ?",
    "options": ['Timor Leste', 'NTT', 'Kalimantan', 'Jawa'],
    "answer_index": 2,
  },
  {
    "id": 3,
    "question": "Siapa nama menteri pendidikan kita saat ini ?",
    "options": ['Nadiem Makarim', 'Alfan Maulana', 'Nur rafik', 'Rizky Ilhami'],
    "answer_index": 0,
  },
  {
    "id": 5,
    "question": "Dimana letak Ibukota jawa tengah ?",
    "options": ['Bekasi', 'Cikarang', 'Deli Serdang', 'Semarang'],
    "answer_index": 3,
  },
  {
    "id": 6,
    "question": "Sikap toleransi beragama termasuk contoh penerapan pancasila sila ke?",
    "options": ['1', '2', '3', '4'],
    "answer_index": 0,
  },
  {
    "id": 7,
    "question": "Landasan negara indonesia adalah?",
    "options": ['Kitab Sansekerta', 'Kitab Sun Go Kong', 'UUU', 'UUD 1945'],
    "answer_index": 3,
  },
  {
    "id": 8,
    "question": "Hewan yang hidup di air adalah ? ",
    "options": ['Ikan', 'Burung', 'Cemara', 'Planet mars'],
    "answer_index": 0,
  },
  {
    "id": 9,
    "question": "Mamalia laut adalah ?",
    "options": ['Manusia', 'Beruang', 'Paus', 'Awan'],
    "answer_index": 2,
  },
  {
    "id": 10,
    "question": "Hidup ini harus saling ?",
    "options": ['Saling meledek', 'Memusuhi tetangga', 'Berkelahi', 'Gotong Royong'],
    "answer_index": 3,
  },
];
