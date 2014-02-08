package info.coffeeonkeyboard.jdbc;

import info.coffeeonkeyboard.domain.Blog;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * User: numlock
 * Date: 08.02.14
 * Time: 13:47
 */
public class BlogExtractor implements ResultSetExtractor<Blog> {

    @Override
    public Blog extractData(ResultSet resultSet) throws SQLException, DataAccessException {
        Blog blog = new Blog();

        return blog;
    }
}
