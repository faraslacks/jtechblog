package info.coffeeonkeyboard.dao;

import info.coffeeonkeyboard.domain.Blog;

/**
 * User: numlock
 * Date: 28.01.14
 * Time: 11:15
 */
public interface BlogsDao {

    public Blog createBlog(String name, String title, String epigraph);
    public Blog getBlog(String name);

}
