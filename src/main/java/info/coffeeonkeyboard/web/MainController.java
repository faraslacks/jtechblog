package info.coffeeonkeyboard.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * User: faraslacks
 * Date: 28.08.13
 * Time: 21:03
 * Main controller of application.
 */

@Controller
public class MainController {

    private int i;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    String mapBlog() {
        return "index";
    }

}