package com.stylefeng.guns.modular.auditrecord.controller;

import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.stylefeng.guns.core.base.controller.BaseController;
/*<dependency>
<groupId>org.apache.poi</groupId>
<artifactId>poi</artifactId>
<version>4.0.1</version>
</dependency>


*/
@Controller
@RequestMapping("/attendance")
public class kaoqinController extends BaseController {

    private final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    private static Logger logger = LoggerFactory.getLogger(kaoqinController.class);
 
    @RequestMapping(value = "/exportattendance")
    @ResponseBody
    public String export(Object paramobj, HttpServletResponse response, HttpServletRequest request) throws Exception {

        //获取考勤记录  
        List<Object> list = null;
        String[] title = {"姓名", "AD", "班次", "上班", "下班", "状态", "备注", "复核"};
        String[] sheetName = {"明细", "汇总"};
        String[][] content = new String[list.size()][7];
        for (int i = 0; i < list.size(); i++) {
            content[i] = new String[title.length];
            Object obj = list.get(i);
            content[i][0] = obj.getName();
            content[i][1] = obj.getUserId();
            content[i][2] = obj.getBanci();
            content[i][3] = obj.getPunchintime();
            content[i][4] = obj.getPunchouttime();
            content[i][5] = obj.getState();
            content[i][6] = obj.getContent();
            content[i][7] = obj.getReview();
        }

        HSSFWorkbook wb = this.getHSSFWorkbook(sheetName, title, content);

        try {
            final String userAgent = request.getHeader("USER-AGENT");
            String fileName = "Statistics" + System.currentTimeMillis() + ".xls";
            String finalFileName = null;
            if (StringUtils.contains(userAgent, "MSIE")) {//IE浏览器
                finalFileName = URLEncoder.encode(fileName, "UTF8");
            } else if (StringUtils.contains(userAgent, "Mozilla")) {//google,火狐浏览器
                finalFileName = new String(fileName.getBytes(), "ISO8859-1");
            } else {
                finalFileName = URLEncoder.encode(fileName, "UTF8");//其他浏览器
            }

            this.setResponseHeader(response, finalFileName);
            OutputStream os = response.getOutputStream();
            wb.write(os);
            os.flush();
            os.close();
        } catch (Exception e) {
            logger.error("Exception", e);
        }
        return "OK";
    }
    
    public static HSSFWorkbook getHSSFWorkbook(String[] sheetName,String []title,String [][]values){
        // 第一步，创建一个HSSFWorkbook，对应一个Excel文件
    	HSSFWorkbook  wb = new HSSFWorkbook();
        // 第二步，在workbook中添加一个sheet,对应Excel文件中的sheet
        HSSFSheet sheet = wb.createSheet(sheetName[0]);
        int[] colwidth1 = {8*256,20*256,20*256,30*256,30*256,20*256,20*256,20*256};
        for(int i=0; i < colwidth1.length; i++){
        	sheet.setColumnWidth(i, colwidth1[i]);
        }
        // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制
        HSSFRow row = sheet.createRow(0);
        // 第四步，创建单元格，并设置值表头 设置表头居中
        HSSFCellStyle titlestyle = wb.createCellStyle();
        titlestyle.setAlignment(HorizontalAlignment.CENTER); // 创建垂直一个居中格式
        titlestyle.setVerticalAlignment(VerticalAlignment.CENTER); // 创建一个居中格式
        Font titlefont = wb.createFont();
        titlefont.setBold(true);
        titlefont.setFontName("宋体");
        titlestyle.setFont(titlefont);
      
        HSSFCellStyle cellstyle = wb.createCellStyle();
        cellstyle.setAlignment(HorizontalAlignment.CENTER); // 创建垂直一个居中格式
        cellstyle.setVerticalAlignment(VerticalAlignment.CENTER); // 创建一个居中格式
        Font font = wb.createFont();
        font.setFontName("宋体");
        cellstyle.setFont(font);
        
        //声明列对象
        HSSFCell cell = null;
        //创建标题
        for(int i=0;i<title.length;i++){
            cell = row.createCell(i);
            cell.setCellValue(title[i]);
            cell.setCellStyle(titlestyle);
        }

        //创建内容
        for(int i=0;i<values.length;i++){
            row = sheet.createRow(i + 1);
            for(int j=0;j<values[i].length;j++){
                //将内容按顺序赋给对应的列对象
               cell = row.createCell(j);
               cell.setCellValue(values[i][j]);
               cell.setCellStyle(cellstyle);
            }
        }
        return wb;
    }
    
    
    public static HSSFWorkbook getHSSFWorkbook(String sheetName,String []title,String [][]values,HSSFWorkbook wb){

        // 第一步，创建一个HSSFWorkbook，对应一个Excel文件
        if(wb == null){
            wb = new HSSFWorkbook();
        }
       
        // 第二步，在workbook中添加一个sheet,对应Excel文件中的sheet
        HSSFSheet sheet = wb.createSheet(sheetName);
        int[] colwidth1 = {25,30,15,15,15,5,15,10,30,20,5,5,15,5,15};
        for(int i=0; i < colwidth1.length; i++){
        	sheet.setColumnWidth(i, colwidth1[i]*256);
        }
        // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制
        HSSFRow row = sheet.createRow(0);
        // 第四步，创建单元格，并设置值表头 设置表头居中
        HSSFCellStyle titlestyle = wb.createCellStyle();
        titlestyle.setAlignment(HorizontalAlignment.CENTER); // 创建垂直一个居中格式
        titlestyle.setVerticalAlignment(VerticalAlignment.CENTER); // 创建一个居中格式
        Font titlefont = wb.createFont();
        titlefont.setBold(true);
        titlefont.setFontName("宋体");
        titlestyle.setFont(titlefont);
      
        HSSFCellStyle cellstyle = wb.createCellStyle();
        cellstyle.setAlignment(HorizontalAlignment.CENTER); // 创建垂直一个居中格式
        cellstyle.setVerticalAlignment(VerticalAlignment.CENTER); // 创建一个居中格式
        Font font = wb.createFont();
        font.setFontName("宋体");
        cellstyle.setFont(font);
        
        //声明列对象
        HSSFCell cell = null;
        //创建标题
        for(int i=0;i<title.length;i++){
            cell = row.createCell(i);
            cell.setCellValue(title[i]);
            cell.setCellStyle(titlestyle);
        }

        //创建内容
        for(int i=0;i<values.length;i++){
            row = sheet.createRow(i + 1);
            for(int j=0;j<values[i].length;j++){
                //将内容按顺序赋给对应的列对象
               cell = row.createCell(j);
               cell.setCellValue(values[i][j]);
               cell.setCellStyle(cellstyle);
            }
        }
        
        return wb;
    }
    
    //发送响应流方法
    public static void setResponseHeader(HttpServletResponse response, String fileName) {
        try {
        	
            fileName = new String(fileName.getBytes(),"UTF-8");
            response.setContentType("application/octet-stream;charset=ISO8859-1");
            response.setHeader("Content-Disposition", "attachment;filename="+ fileName);
            response.addHeader("Pargam", "no-cache");
            response.addHeader("Cache-Control", "no-cache");
        } catch (Exception ex) {
        	logger.error("Exception",ex);
        }
    }
}
