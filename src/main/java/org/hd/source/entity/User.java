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
@TableName("sys_user")
public class User {
    @TableId(type = IdType.INPUT)
    private String uid;
    private String userName;
    private String password;
    private String salt;
    private String email;
    private Integer status;
    private int isVip;
    private int coin;
    private Date createTime;
}
