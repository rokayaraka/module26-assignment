class StudentInfo {
  final String id;
  final String name;
  final int roll;
  final String course1;
  final String course2;
  final String course3;

  StudentInfo({
    required this.id,
    required this.name,
    required this.roll,
    required this.course1,
    required this.course2,
    required this.course3,
  });

  factory StudentInfo.fromjson(String id, Map<String, dynamic> json) {
    return StudentInfo(
      id: id,
      name: json['name'],
      roll: json['roll'],
      course1: json['course1'],
      course2: json['course2'],
      course3: json['course3'],
    );
  }

  Map<String,dynamic> toJson(){
    return{
      'name':name,
      'roll':roll,
      'course1':course1,
      'course2':course2,
      'course3':course3,
    };
  }
}
