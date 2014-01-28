package info.coffeeonkeyboard.dao;

import info.coffeeonkeyboard.domain.Post;
import info.coffeeonkeyboard.exceptions.BaseException;

import java.util.Date;
import java.util.List;

/**
 * User: numlock
 * Date: 28.01.14
 * Time: 12:01
 */
public class PostsDaoJdbcImpl implements PostsDao {

    @Override
    public List<Post> getPosts() {
        return null;
    }

    @Override
    public List<Post> getPosts(Date from, Date to) throws BaseException {
        return null;
    }

    @Override
    public List<Post> getPosts(List<String> tags) throws BaseException {
        return null;
    }

    @Override
    public List<Post> getSearchResult(String query) {
        return null;
    }
}
