package info.coffeeonkeyboard.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import info.coffeeonkeyboard.process.LatexParser;

/**
 * User: faraslacks
 * Date: 28.08.13
 * Time: 21:03
 * Main web of application.
 */

@Controller
public class MainController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    String mapBlog(Model model)
    {
        LatexParser parser = new LatexParser();
        String text =
                "\\section{Заголовок}\n" +
                "\\subsection{Подзаголовок}\n" +
                "\\subsubsection{Подподзаголовок}\n\n" +
                "Текст абзаца в который включена формула: $f(x) = 0$\n\n" +
                "\\subsubsection{Подподзаголовок 2}\n\n" +
                "Текст абзаца в который включена большая формула: $$f(x) = 0$$\n\n";
        text = parser.process(text);
        model.addAttribute("text", text);
        return "index";
    }

}
