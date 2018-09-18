package org.backstage.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.ibatis.annotations.Param;
import org.apache.poi.hssf.usermodel.*;
import org.backstage.dto.Pager;
import org.backstage.entity.User;
import org.backstage.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;


@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    public AdminService serviceManager;

    @RequestMapping(value = "/listbypage")
    public String listByPage() {
        return "AdminManager/listByPage";
    }

    @RequestMapping(value = "/getdata", method = RequestMethod.POST)
    @ResponseBody
    public String getPostMessage(Integer page, Integer limit, String keystr) {
        int pagePar = 0;
        if (page == 1) {
            pagePar = 0;
        } else {
            pagePar = (page - 1) * limit;
        }
        System.out.println(keystr);
        Pager<User> pager = new Pager<User>();
        List<User> data = serviceManager.SelectAllUser(pagePar, limit, keystr);
        int count = serviceManager.TotalCount(keystr);
        //设置分页内容
        pager.setCode(0);
        pager.setCount(count);
        pager.setData(data);
        pager.setMsg("成功");

        String jsonStr = "";
        //转换成Json
        ObjectMapper mapper = new ObjectMapper();
        try {
            jsonStr = mapper.writeValueAsString(pager);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return jsonStr;
    }

    @RequestMapping(value = "upload")
    @ResponseBody
    public String uploadInfo(HttpServletRequest request, HttpServletResponse response) {
        String str = "";

        return "";
    }

    /*
    导出Excel
    status:状态参数
     */
    @RequestMapping(value = "/exportExcel")
    public void ExportAllData(@Param("stats") String status, HttpServletResponse response) {
        //查询条件（状态）
        System.out.println(status);        // 第一步，创建一个webbook，对应一个Excel文件
        HSSFWorkbook wb = new HSSFWorkbook();
        // 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet
        HSSFSheet sheet = wb.createSheet("sheet1");
        // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short
        HSSFRow row = sheet.createRow((int) 0);
        // 第四步，创建单元格，并设置值表头 设置表头居中
        HSSFCellStyle style = wb.createCellStyle();
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式
        HSSFCell cell = row.createCell(0);
        //设置标头
        cell.setCellValue("故障名称");
        cell.setCellStyle(style);
        cell = row.createCell(1);
        cell.setCellValue("起始时间");
        cell.setCellStyle(style);
        cell = row.createCell(2);
        cell.setCellValue("结束时间");
        cell.setCellStyle(style);
        cell = row.createCell(3);
        cell.setCellValue("费用");
        cell.setCellStyle(style);
        //查找数据
        List<User> list = serviceManager.ExportAll();
        for (int i = 0; i < list.size(); i++) {
            row = sheet.createRow(i + 1);
            User history = list.get(i);
            // 第四步，创建单元格，并设置值
            row.createCell(0).setCellValue((history.getUsername() == null ? "" : history.getUsername()));
            row.createCell(1).setCellValue(history.getPassword());
            row.createCell(2).setCellValue(history.getGender());
            row.createCell(3).setCellValue((history.getUsername() == null ? "" : history.getUsername()));
        }

        //下载
        ServletOutputStream out;
        try {
            out = response.getOutputStream();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
            Date date = new Date();
            String fileName = sdf.format(date) + ".xls";
            response.reset();
            response.setContentType("application/msexcel");
            response.setHeader("Content-disposition", "attachment; filename=" + fileName);
            wb.write(out);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
