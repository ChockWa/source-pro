package org.hd.source.controller;

import cn.hutool.core.collection.CollectionUtil;
import com.google.common.collect.Lists;
import lombok.var;
import org.hd.source.dto.PageParam;
import org.hd.source.entity.SourceType;
import org.hd.source.service.SourceService;
import org.hd.source.service.SourceTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.PostConstruct;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

@Controller
@RequestMapping("")
public class PageController {

    @Autowired
    private SourceTypeService sourceTypeService;
    @Autowired
    private SourceService sourceService;
    @Value("${requestPrefix}")
    private String requestPrefix;

    private List<SourceType> typeList = Collections.emptyList();

    @GetMapping("/index")
    public ModelAndView index(){
        var sourceInfo = sourceService.getSourceListPage(new PageParam(1, 15));
        ModelAndView mv = new ModelAndView("index");
        mv.addObject("requestPrefix", requestPrefix);
        mv.addObject("types", typeList);
        mv.addObject("sourceTotal", sourceInfo.getTotal());
//        mv.addObject("sourceInfo", sourceInfo);
        mv.addObject("iframePath", "/list?pageIndex=1&pageSize=15");
//        mv.addObject("pageType", "list");
        return mv;
    }

    @GetMapping("/list")
    public ModelAndView sourceList(@RequestParam Integer pageIndex, @RequestParam Integer pageSize,
                                   @RequestParam(required = false) String type){
        var sourceInfo = sourceService.getSourceListPage(new PageParam(pageIndex, pageSize));
        ModelAndView mv = new ModelAndView("source.list");
        mv.addObject("sourceInfo", sourceInfo);
        mv.addObject("requestPrefix", requestPrefix);
        return mv;
    }

    @GetMapping("/{sourceId}/source-detail")
    public ModelAndView detail(@PathVariable String sourceId){
        var detailInfo = sourceService.getSource(sourceId);
        ModelAndView mv = new ModelAndView("index");
        mv.addObject("requestPrefix", requestPrefix);
        mv.addObject("types", typeList);
        mv.addObject("detailInfo", detailInfo.getSource());
        mv.addObject("pageType", "detail");
        return mv;
    }

    @GetMapping("/{typeId}/sources")
    public ModelAndView changeType(@PathVariable String typeId){
        List<SourceType> types = Lists.newArrayList(typeList);
        types.forEach(e -> {
            if(e.getId().equals(typeId)){
                e.setIsChoose(1);
            }else{
                e.setIsChoose(0);
            }
        });
        var sourceInfo = sourceService.getSourceListPage(new PageParam(1, 15));
        ModelAndView mv = new ModelAndView("index");
        mv.addObject("requestPrefix", requestPrefix);
        mv.addObject("types", types);
        mv.addObject("sourceInfo", sourceInfo);
        mv.addObject("pageType", "list");
        return mv;
    }

    @PostConstruct
    public synchronized void init(){
        if (CollectionUtils.isEmpty(typeList)){
            typeList = sourceTypeService.getSourceTypes();
            typeList.get(0).setIsChoose(1);
        }
    }
}
