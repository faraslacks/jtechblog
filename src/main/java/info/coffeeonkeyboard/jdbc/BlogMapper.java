package info.coffeeonkeyboard.jdbc;

import info.coffeeonkeyboard.domain.Blog;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * User: numlock
 * Date: 08.02.14
 * Time: 13:46
 */
public class BlogMapper implements RowMapper<Blog> {

    @Override
    public Blog mapRow(ResultSet resultSet, int i) throws SQLException {
        BlogExtractor blogExtractor = new BlogExtractor();
        return blogExtractor.extractData(resultSet);
    }
}
