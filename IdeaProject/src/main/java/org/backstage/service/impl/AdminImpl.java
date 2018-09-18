package org.backstage.service.impl;

import org.backstage.dao.AdminDao;
import org.backstage.entity.User;
import org.backstage.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminImpl implements AdminService {

    @Autowired
    private AdminDao adminDao;

    @Override
    public List<User> SelectAllUser(int page, int limit, String keystr) {
        List<User> list = adminDao.SelectAllUserList(page, limit, keystr);
        return list;
    }

    @Override
    public int TotalCount(String keystr) {
        int count = adminDao.TotalCount(keystr);
        return count;
    }

    @Override
    public List<User> ExportAll() {
        List<User> list = adminDao.ExportAll();
        return list;
    }
}
