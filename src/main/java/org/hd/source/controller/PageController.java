package org.hd.source.controller;

import lombok.var;
import org.hd.source.dto.PageParam;
import org.hd.source.service.SourceService;
import org.hd.source.service.SourceTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("")
public class PageController {

    @Autowired
    private SourceTypeService sourceTypeService;
    @Autowired
    private SourceService sourceService;

    @GetMapping("/index")
    public ModelAndView index(){
        var types = sourceTypeService.getSourceTypes();
        types.get(0).setIsChoose(1);
        var sourceInfo = sourceService.getSourceListPage(new PageParam(1, 15));

        ModelAndView mv = new ModelAndView("index");
        mv.addObject("requestPrefix", "http://106.12.161.232:16989");
        mv.addObject("types", types);
        mv.addObject("sourceInfo", sourceInfo);
        return mv;
    }
}
