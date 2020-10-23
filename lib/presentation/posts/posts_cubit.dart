import 'package:bloc/bloc.dart';
import 'package:flutter_base/core/domain/post/usecase/get_post_usecase.dart';
import 'package:flutter_base/presentation/posts/posts_state.dart';

class PostCubit extends Cubit<PostsState> {
  final GetPostUseCase getPostUseCase;

  PostCubit(this.getPostUseCase) : super(PostsInitialState());

  Future<void> getPosts() async {
    emit(PostsLoadingState());
    var response = await getPostUseCase.call();
    response.fold((failure) {
      emit(PostsErrorState('failure : $failure'));
    }, (posts) {
      emit(PostsLoadedState(posts));
    });
  }
}
