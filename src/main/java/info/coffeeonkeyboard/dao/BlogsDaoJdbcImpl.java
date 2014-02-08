package info.coffeeonkeyboard.dao;

import info.coffeeonkeyboard.domain.Blog;

import java.sql.Connection;

/**
 * User: numlock
 * Date: 28.01.14
 * Time: 11:58
 */
public class BlogsDaoJdbcImpl implements BlogsDao {

    private Connection connection;

    @Override
    public Blog getBlog(String name) {
        return null;
    }
}
