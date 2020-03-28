package org.hd.source.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.hd.source.entity.User;

@Mapper
public interface UserMapper extends BaseMapper<User> {
}