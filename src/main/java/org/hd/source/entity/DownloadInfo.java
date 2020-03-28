package org.hd.source.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@TableName("sys_download_info")
public class DownloadInfo {
    @TableId(type = IdType.AUTO)
    private int id;
    private String sourceId;
    private String downloadUrl;
    private String downloadCode;
    private Integer status;
    private String decompressionCode;
    private Date createTime;
}
