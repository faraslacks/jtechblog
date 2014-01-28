package info.coffeeonkeyboard.domain;

import java.util.Date;
import java.util.List;

/**
 * User: numlock
 * Date: 28.01.14
 * Time: 11:01
 */
public class Post {

    private String text;
    private Date date;
    private String header;
    private List<Comment> comments;
    private Blog blog;

    public Blog getBlog() {
        return blog;
    }

    public void setBlog(Blog blog) {
        this.blog = blog;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    public String getHeader() {
        return header;
    }

    public void setHeader(String header) {
        this.header = header;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

}
