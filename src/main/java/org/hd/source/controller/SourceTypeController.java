package org.hd.source.controller;

import org.hd.source.dto.Result;
import org.hd.source.entity.SourceType;
import org.hd.source.service.SourceTypeService;
import org.hd.source.util.UUIDUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

@RestController
@RequestMapping("type")
public class SourceTypeController {

    @Autowired
    private SourceTypeService sourceTypeService;

    @GetMapping("list")
    public Result getSourceTypes(){
        return Result.SUCCESS().setData("list", sourceTypeService.getSourceTypes());
    }

    @GetMapping("save")
    public Result save(String description){
        SourceType sourceType = new SourceType();
        sourceType.setDescription(description);
        sourceType.setStatus(1);
        sourceType.setId(UUIDUtils.getUuid());
        sourceType.setCreateTime(new Date());
        sourceTypeService.save(sourceType);
        return Result.SUCCESS();
    }
}
