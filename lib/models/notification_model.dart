class NotificationModel {
  final String notificationId;
  final String type; // 'like', 'comment', 'follow'
  final String fromUserId;
  final String toUserId;
  final String? postId;
  final DateTime dateCreated;

  NotificationModel({
    required this.notificationId,
    required this.type,
    required this.fromUserId,
    required this.toUserId,
    this.postId,
    required this.dateCreated,
  });

  NotificationModel.fromMap(Map<String, dynamic> map) 
    : notificationId = map['notificationId'],
      type = map['type'],
      fromUserId = map['fromUserId'],
      toUserId = map['toUserId'],
      postId = map['postId'],
      dateCreated = (map['dateCreated']);

  Map<String, dynamic> toMap() {
    return {
      'notificationId': notificationId,
      'type': type,
      'fromUserId': fromUserId,
      'toUserId': toUserId,
      'postId': postId,
      'dateCreated': dateCreated,
    };
  }
}
