package org.hd.source.service;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.hd.source.dto.PageParam;
import org.hd.source.dto.PageResult;
import org.hd.source.dto.SourceDto;
import org.hd.source.entity.DownloadInfo;
import org.hd.source.entity.Source;
import org.hd.source.mapper.DownloadInfoMapper;
import org.hd.source.mapper.SourceMapper;
import org.hd.source.util.UUIDUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
@Slf4j
public class SourceService {

    @Autowired
    private SourceMapper sourceMapper;

    @Autowired
    private DownloadInfoMapper downloadInfoMapper;

    public PageResult<Source> getSourceListPage(PageParam pageParam){
        Page<Source> page = new Page<>(pageParam.getPageIndex(), pageParam.getPageSize());
        sourceMapper.selectPage(page, null);

        PageResult<Source> result = new PageResult<>();
        result.setRecords(page.getRecords());
        result.setTotal(page.getTotal());
        return result;
    }


    public SourceDto getSource(String sourceId){
        SourceDto sourceDto = new SourceDto();
        Source source = sourceMapper.selectById(sourceId);
        sourceDto.setSource(source);

        List<DownloadInfo> downloadInfoList = downloadInfoMapper.selectList(Wrappers
                .<DownloadInfo>lambdaQuery().eq(DownloadInfo::getSourceId, source.getId()));

        StringBuilder downloadInfoStr = new StringBuilder();
        for(DownloadInfo downloadInfo : downloadInfoList){
            downloadInfoStr.append(downloadInfo.getDownloadUrl());
            downloadInfoStr.append("|");
            downloadInfoStr.append(downloadInfo.getDownloadCode());
            downloadInfoStr.append(";");
        }
        String str = downloadInfoStr.toString();
        sourceDto.setDownloadInfo(str.substring(0, str.length() - 1));
        return sourceDto;
    }

    @Transactional(rollbackFor = Exception.class)
    public void save(SourceDto sourceDto){
        Source source = sourceDto.getSource();
        if(StringUtils.isBlank(source.getId())){
            String uuid = UUIDUtils.getUuid();
            source.setId(uuid);
            source.setCreateTime(new Date());
            sourceMapper.insert(source);

            try {
                String[] downloadInfos = sourceDto.getDownloadInfo().split(";");
                for(String s : downloadInfos){
                    DownloadInfo downloadInfo = new DownloadInfo();
                    downloadInfo.setStatus(1);
                    downloadInfo.setSourceId(uuid);
                    downloadInfo.setCreateTime(new Date());
                    if(s.contains(":")){
                        String[] item = s.split(":");
                        downloadInfo.setDownloadUrl(item[0]);
                        downloadInfo.setDownloadCode(item[1]);
                    }else{
                        downloadInfo.setDownloadUrl(s);
                    }
                    downloadInfoMapper.insert(downloadInfo);
                }
            }catch (Exception e) {
                log.error("下载信息录入格式不正确", e);
                throw new IllegalArgumentException("下载信息录入格式不正确");
            }
        }else{
            source.setUpdateTime(new Date());
            sourceMapper.updateById(source);

            downloadInfoMapper.delete(Wrappers
                    .<DownloadInfo>lambdaQuery().eq(DownloadInfo::getSourceId, source.getId()));
            try {
                String[] downloadInfos = sourceDto.getDownloadInfo().split("\\|");
                for(String s : downloadInfos){
                    DownloadInfo downloadInfo = new DownloadInfo();
                    downloadInfo.setStatus(1);
                    downloadInfo.setCreateTime(new Date());
                    downloadInfo.setSourceId(source.getId());
                    if(s.contains(":")){
                        String[] item = s.split(":");
                        downloadInfo.setDownloadUrl(item[0]);
                        downloadInfo.setDownloadCode(item[1]);
                    }else{
                        downloadInfo.setDownloadUrl(s);
                    }
                    downloadInfoMapper.insert(downloadInfo);
                }
            }catch (Exception e) {
                log.error("下载信息录入格式不正确", e);
                throw new IllegalArgumentException("下载信息录入格式不正确");
            }
        }
    }

    public void updateStatus(String sourceId, Integer status){
        Source source = new Source();
        source.setId(sourceId);
        source.setStatus(status);
        sourceMapper.updateById(source);
    }
}
