package org.backstage.dao;

import org.apache.ibatis.annotations.Param;
import org.backstage.entity.User;

import java.util.List;


public interface AdminDao {

    List<User> SelectAllUserList(@Param("page") int page, @Param("limit") int limit, @Param("keystr") String keystr);

    int TotalCount(@Param("keystr") String keystr);

    //导出事件
    List<User> ExportAll();
}
