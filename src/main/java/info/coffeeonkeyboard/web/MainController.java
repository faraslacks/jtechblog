package info.coffeeonkeyboard.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * User: faraslacks
 * Date: 28.08.13
 * Time: 21:03
 * Main web of application.
 */

@Controller
public class MainController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    String mapBlog() {
        return "index";
    }

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    String mapAdmin() {
        return "admin";
    }

}
