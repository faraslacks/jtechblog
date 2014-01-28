package info.coffeeonkeyboard.dao;

import info.coffeeonkeyboard.domain.Post;
import info.coffeeonkeyboard.exceptions.BaseException;

import java.util.Date;
import java.util.List;

/**
 * User: numlock
 * Date: 28.01.14
 * Time: 11:12
 */
public interface PostsDao {

    public List<Post> getPosts();
    public List<Post> getPosts(Date from, Date to) throws BaseException;
    public List<Post> getPosts(List<String> tags) throws BaseException;
    public List<Post> getSearchResult(String query);

}
