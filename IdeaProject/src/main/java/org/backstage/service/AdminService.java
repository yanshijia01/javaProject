package org.backstage.service;


import org.apache.ibatis.annotations.Param;
import org.backstage.entity.User;

import java.util.List;

public interface AdminService {
    List<User> SelectAllUser(@Param(value = "page") int page,@Param("limit") int limit,@Param("keystr") String keystr);

    int TotalCount(@Param("keystr") String keystr);

    List<User> ExportAll();
}
