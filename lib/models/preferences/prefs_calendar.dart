class PrefsCalendar {
  String university;
  String campus;
  String department;
  String year;
  String group;

  PrefsCalendar({
    this.university,
    this.campus,
    this.department,
    this.year,
    this.group,
  });

  Map<String, String> getValues() {
    return {
      'university': university,
      'campus': campus,
      'department': department,
      'year': year,
      'group': group
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PrefsCalendar &&
          runtimeType == other.runtimeType &&
          university == other.university &&
          campus == other.campus &&
          department == other.department &&
          year == other.year &&
          group == other.group;

  @override
  int get hashCode =>
      university.hashCode ^
      campus.hashCode ^
      department.hashCode ^
      year.hashCode ^
      group.hashCode;
}
