package ca.esystem.bridges.web.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ca.esystem.bridges.domain.ServiceProduct;
import ca.esystem.bridges.security.LoggedInUser;
import ca.esystem.bridges.service.MembershipService;
import ca.esystem.bridges.service.ServiceProductMngService;
import ca.esystem.framework.web.controller.AbstractController;

/**
 * Index.html 首页
 * 
 * @author cherie
 *
 */
@Controller
public class PageIndexController extends AbstractController {

    private final Logger           logger = LoggerFactory.getLogger(this.getClass().getName());

    @Resource(name = "MembershipService")
    private MembershipService      membershipService;

    @Resource(name = "ServiceProductMngService")
    private ServiceProductMngService productservice;
    
    private BCryptPasswordEncoder encoder;
    
    public PageIndexController(){
        encoder = new BCryptPasswordEncoder();
    }

    @RequestMapping(value = "/index", method = { RequestMethod.GET })
    public String openIndexPage(Model model, HttpServletRequest request) throws Exception {
    	ServiceProduct serviceProductQuery = new ServiceProduct();
    	List recommendlist = productservice.queryServiceProductForIndex(serviceProductQuery);
    	model.addAttribute("recommendlist", recommendlist);
        return "/index";
    }
}
