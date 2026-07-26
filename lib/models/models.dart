enum ApplicationStatus { review, accepted, rejected }

extension ApplicationStatusX on ApplicationStatus {
  String get label {
    switch (this) {
      case ApplicationStatus.review:
        return 'قيد المراجعة';
      case ApplicationStatus.accepted:
        return 'مقبول';
      case ApplicationStatus.rejected:
        return 'مرفوض';
    }
  }
}

enum JobStatus { active, closed, draft }

extension JobStatusX on JobStatus {
  String get label {
    switch (this) {
      case JobStatus.active:
        return 'نشط';
      case JobStatus.closed:
        return 'مغلق';
      case JobStatus.draft:
        return 'مسودة';
    }
  }
}

class Applicant {
  final String name;
  final String title;
  final String date;
  final String initials;
  final ApplicationStatus status;
  final String email;
  final String phone;
  final String location;
  final String education;

  const Applicant({
    required this.name,
    required this.title,
    required this.date,
    required this.initials,
    required this.status,
    this.email = 'ahmed@email.com',
    this.phone = '+966 966 543 210',
    this.location = 'الرياض',
    this.education = 'بكالوريوس هندسة برمجيات - جامعة الملك سعود',
  });
}

class Job {
  final String title;
  final String department;
  final String date;
  final String location;
  final int applicants;
  final JobStatus status;

  const Job({
    required this.title,
    required this.department,
    required this.date,
    required this.location,
    required this.applicants,
    required this.status,
  });
}

class AppNotification {
  final String title;
  final String description;
  final String time;
  final bool unread;
  final NotificationType type;

  const AppNotification({
    required this.title,
    required this.description,
    required this.time,
    required this.unread,
    required this.type,
  });
}

enum NotificationType { newApplication, documents }
