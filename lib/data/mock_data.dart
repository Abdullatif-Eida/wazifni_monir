import '../models/models.dart';

class MockData {
  static const List<Applicant> applicants = [
    Applicant(
      name: 'أحمد محمد السالم',
      title: 'مهندس برمجيات أول',
      date: '2025/1/1',
      initials: 'أم',
      status: ApplicationStatus.accepted,
    ),
    Applicant(
      name: 'أحمد محمد السالم',
      title: 'مهندس برمجيات أول',
      date: '2025/1/1',
      initials: 'أم',
      status: ApplicationStatus.accepted,
    ),
    Applicant(
      name: 'أحمد محمد السالم',
      title: 'مهندس برمجيات أول',
      date: '2025/1/1',
      initials: 'أم',
      status: ApplicationStatus.review,
    ),
    Applicant(
      name: 'أحمد محمد السالم',
      title: 'مهندس برمجيات أول',
      date: '2025/1/1',
      initials: 'أم',
      status: ApplicationStatus.rejected,
    ),
  ];

  static const List<Job> jobs = [
    Job(
      title: 'مهندس برمجيات أول',
      department: 'قسم التطوير',
      date: '2025/1/1',
      location: 'الرياض',
      applicants: 55,
      status: JobStatus.active,
    ),
    Job(
      title: 'مهندس برمجيات أول',
      department: 'قسم التطوير',
      date: '2025/1/1',
      location: 'الرياض',
      applicants: 55,
      status: JobStatus.active,
    ),
    Job(
      title: 'مهندس برمجيات أول',
      department: 'قسم التطوير',
      date: '2025/1/1',
      location: 'الرياض',
      applicants: 55,
      status: JobStatus.closed,
    ),
  ];

  static const List<AppNotification> notifications = [
    AppNotification(
      title: 'طلب توظيف جديد',
      description: 'تقدم احمد محمد السالم لوظيفة مهندس برمجيات اول',
      time: 'منذ 3 دقائق',
      unread: true,
      type: NotificationType.newApplication,
    ),
    AppNotification(
      title: 'مستندات مرفوعة',
      description: 'رفع احمد محمد السالم مستنداته المطلوبة',
      time: 'منذ 3 دقائق',
      unread: true,
      type: NotificationType.documents,
    ),
    AppNotification(
      title: 'طلب توظيف جديد',
      description: 'تقدم احمد محمد السالم لوظيفة مهندس برمجيات اول',
      time: 'منذ 3 دقائق',
      unread: false,
      type: NotificationType.newApplication,
    ),
    AppNotification(
      title: 'طلب توظيف جديد',
      description: 'تقدم احمد محمد السالم لوظيفة مهندس برمجيات اول',
      time: 'منذ 3 دقائق',
      unread: false,
      type: NotificationType.newApplication,
    ),
  ];

  static const List<String> departments = [
    'قسم التطوير',
    'قسم الإعلام',
    'قسم الموارد البشرية',
    'قسم المالية',
  ];
}
