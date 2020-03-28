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
@TableName("sys_source_type")
public class SourceType {
    @TableId(type = IdType.INPUT)
    private String id;
    private String description;
    private Integer status;
    private Date createTime;
}
