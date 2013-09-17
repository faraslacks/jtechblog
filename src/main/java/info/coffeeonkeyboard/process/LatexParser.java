package info.coffeeonkeyboard.process;

/**
 * User: faraslacks
 * Date: 14.09.13
 * Time: 22:07
 * LaTeX parsing class.
 */
public class LatexParser {

    private int cursor = 0;

    private String text;

    public int getCursor() {
        return cursor;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String process(String text)
    {
        setText(text);
        return "<h1>Hello, world!</h1>";
    }

    protected String nextLexem() {
        return "";
    }

}
