package info.coffeeonkeyboard.dao;

import info.coffeeonkeyboard.domain.Blog;
import info.coffeeonkeyboard.jdbc.BlogMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.sql.DataSource;
import java.util.List;

/**
 * User: numlock
 * Date: 28.01.14
 * Time: 11:58
 */
public class BlogsDaoJdbcImpl implements BlogsDao {

    @Autowired
    private DataSource dataSource;

    private static final String INSERT_BLOG_SQL = "INSERT INTO blogs (name, title, epigraph) VALUES (?, ?, ?)";
    private static final String GET_BLOG_BY_NAME_SQL = "SELECT * FROM blogs WHERE name = ?";

    @Override
    public Blog createBlog(String name, String title, String epigraph) {
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        jdbcTemplate.update(INSERT_BLOG_SQL, new Object[] {name, title, epigraph});

        return getBlog(name);
    }

    @Override
    public Blog getBlog(String name) {
        List<Blog> blogList;
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        blogList = jdbcTemplate.query(GET_BLOG_BY_NAME_SQL, new Object[] {name}, new BlogMapper());
        return  blogList.get(0);
    }
}
