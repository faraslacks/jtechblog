package info.coffeeonkeyboard.web;

import info.coffeeonkeyboard.dao.BlogsDao;
import info.coffeeonkeyboard.dao.BlogsDaoJdbcImpl;
import info.coffeeonkeyboard.domain.Blog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * User: faraslacks
 * Date: 28.08.13
 * Time: 21:03
 * Main controller of application.
 */

@Controller
public class MainController {

    @Autowired
    private BlogsDao blogsDao;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    String mapBlog() {

        Blog blog = blogsDao.createBlog("Math", "Математический блог", "Пишу тут, что хочу...");

        return "index";
    }

}