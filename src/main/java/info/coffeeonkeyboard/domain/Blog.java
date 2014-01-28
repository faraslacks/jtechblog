package info.coffeeonkeyboard.domain;

import java.util.List;

/**
 * User: numlock
 * Date: 28.01.14
 * Time: 11:07
 */
public class Blog {

    private List<Post> posts;
    private String title;
    private String epigraph;

    public List<Post> getPosts() {
        return posts;
    }

    public void setPosts(List<Post> posts) {
        this.posts = posts;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getEpigraph() {
        return epigraph;
    }

    public void setEpigraph(String epigraph) {
        this.epigraph = epigraph;
    }
}
