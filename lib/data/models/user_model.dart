import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String email;
  final String username;
  final String phoneNumber;
  final String fullName;
  final bool isOnline;
  final Timestamp createdAt;
  final Timestamp lastSeen;
  final String fcmToken;
  final List<String> blockedUsers;

  UserModel({
    required this.uid,
    required this.email,
    required this.username,
    required this.phoneNumber,
    required this.fullName,
    this.isOnline = false,
    Timestamp? createdAt,
    Timestamp? lastSeen,
    required this.fcmToken,
    this.blockedUsers = const [],
  }) : createdAt = createdAt ?? Timestamp.now(),
       lastSeen = lastSeen ?? Timestamp.now();

  UserModel copyWith({
    String? uid,
    String? email,
    String? username,
    String? phoneNumber,
    String? fullName,
    bool? isOnline,
    Timestamp? createdAt,
    Timestamp? lastSeen,
    String? fcmToken,
    List<String>? blockedUsers,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      username: username ?? this.username,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      fullName: fullName ?? this.fullName,
      isOnline: isOnline ?? this.isOnline,
      createdAt: createdAt ?? this.createdAt,
      lastSeen: lastSeen ?? this.lastSeen,
      fcmToken: fcmToken ?? this.fcmToken,
      blockedUsers: blockedUsers ?? this.blockedUsers,
    );
  }

  factory UserModel.fromMap(DocumentSnapshot document) {
    final map = document.data() as Map<String, dynamic>;
    return UserModel(
      uid: map['uid'] as String,
      email: map['email'] as String,
      username: map['username'] as String,
      phoneNumber: map['phoneNumber'] as String,
      fullName: map['fullName'] as String,
      isOnline: map['isOnline'] as bool? ?? false,
      createdAt: map['createdAt'] as Timestamp?,
      lastSeen: map['lastSeen'] as Timestamp?,
      fcmToken: map['fcmToken'] as String,
      blockedUsers: List<String>.from(map['blockedUsers'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'username': username,
      'phoneNumber': phoneNumber,
      'fullName': fullName,
      'isOnline': isOnline,
      'createdAt': createdAt,
      'lastSeen': lastSeen,
      'fcmToken': fcmToken,
      'blockedUsers': blockedUsers,
    };
  }
}
