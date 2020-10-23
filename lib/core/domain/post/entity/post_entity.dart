import 'package:equatable/equatable.dart';

class ResPost extends Equatable {
  ResPost({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  @override
  // TODO: implement props
  List<Object> get props => [
        userId,
        id,
        title,
        body,
      ];
}
