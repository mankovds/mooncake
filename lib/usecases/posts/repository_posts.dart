import 'package:dwitter/entities/entities.dart';

/// Represents the repository that can be used in order to read
/// and write data related to posts, comments and likes.
abstract class PostsRepository {
  /// Returns the post having the given [postId], or `null` if no
  /// such post could be found.
  Future<Post> getPostById(String postId);

  /// Returns the list of all posts that represent comments to
  /// the post having the given [postId].
  Future<List<Post>> getPostComments(String postId);

  /// Returns the full list of posts available.
  Future<List<Post>> getPosts(int page);

  /// Returns the list of posts to sync.
  Future<List<Post>> getPostsToSync();

  /// Returns a [Stream] that emits new posts as they are created.
  Stream<Post> get postsStream;

  /// Saves the given [post].
  Future<void> savePost(Post post);

  /// Asynchronously fetches new posts that have not yet been
  /// downloaded locally.
  Future<void> fetchPosts();

  /// Syncs the given posts by sending them to the blockchain.
  Future<void> syncPosts(List<Post> posts);

  /// Deleted the post having the given [postId].
  Future<void> deletePost(String postId);
}
