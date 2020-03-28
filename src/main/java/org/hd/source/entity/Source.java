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
@TableName("sys_source")
public class Source {
    @TableId(type = IdType.INPUT)
    private String id;
    private String typeId;
    private String cover;
    private String title;
    private String description;
    private int status;
    private int scanCount;
    private String content;
    private String images;
    private Date createTime;
    private Date updateTime;
}
