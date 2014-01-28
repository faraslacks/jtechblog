package info.coffeeonkeyboard.domain;

import java.util.Date;
import java.util.List;

/**
 * User: numlock
 * Date: 28.01.14
 * Time: 11:04
 */
public class Comment {

    private List<Comment> subcomments;
    private Date date;
    private String text;

    public List<Comment> getSubcomments() {
        return subcomments;
    }

    public void setSubcomments(List<Comment> subcomments) {
        this.subcomments = subcomments;
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
