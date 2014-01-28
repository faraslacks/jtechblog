package info.coffeeonkeyboard.dao;

import info.coffeeonkeyboard.domain.Comment;
import info.coffeeonkeyboard.domain.Post;

import java.util.List;

/**
 * User: numlock
 * Date: 28.01.14
 * Time: 11:16
 */
public interface CommentsDao {

    public List<Comment> getComments(Post post);

}
