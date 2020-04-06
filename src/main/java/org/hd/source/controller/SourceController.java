package org.hd.source.controller;


import org.hd.source.dto.PageParam;
import org.hd.source.dto.Result;
import org.hd.source.dto.SourceDto;
import org.hd.source.service.SourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("source")
public class SourceController {

    @Autowired
    private SourceService sourceService;

    @GetMapping("list")
    public Result getSourceList(PageParam pageParam){
        return Result.SUCCESS().setData(sourceService.getSourceListPage(pageParam));
    }

    @PostMapping("save")
    public Result save(@RequestBody SourceDto sourceDto){

        sourceService.save(sourceDto);
        return Result.SUCCESS();
    }

    @GetMapping("info")
    public Result getSourceInfo(String sourceId){
        return Result.SUCCESS().setData(sourceService.getSource(sourceId));
    }

    @GetMapping("updateStatus")
    public Result updateStatus(String sourceId, Integer status){
        sourceService.updateStatus(sourceId, status);
        return Result.SUCCESS();
    }

    @GetMapping("simpleSourcePage")
    public Result simpleSourcePage(PageParam pageParam){
        return Result.SUCCESS().setData(sourceService.simpleSourcePage(pageParam));
    }

}
