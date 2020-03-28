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
@TableName("sys_comment")
public class Comment {
    @TableId(type = IdType.AUTO)
    private int id;
    private String uid;
    private String sourceId;
    private String content;
    private String parentCommentId;
    private Date createTime;
}
