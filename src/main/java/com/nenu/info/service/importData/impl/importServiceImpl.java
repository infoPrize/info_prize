package com.nenu.info.service.importData.impl;

import com.nenu.info.Dao.common.StudentDao;
import com.nenu.info.common.dto.StudentDto;
import com.nenu.info.common.entities.Student;
import com.nenu.info.common.entities.common.DataType;
import com.nenu.info.common.utils.ExcelReader2003;
import com.nenu.info.service.common.StudentService;
import com.nenu.info.service.importData.ImportService;
import org.apache.commons.io.FilenameUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.FileInputStream;
import java.util.List;

/**
 * 职责
 *
 * @author zhaiaxin
 * @time: 2017/12/7 21:05.
 */
@Service(value = "importService")
public class importServiceImpl implements ImportService {


    @Autowired
    private StudentDao studentDao;

    @Autowired
    private StudentService studentService;

    String[] studentExcelFormat = {"姓名", "性别","学号","年级","专业","电话"};

    DataType[] studentExcelType = {
            new DataType("name", 0),new DataType("sex",1),
            new DataType("stuNumber",2),new DataType("grade",3),
            new DataType("major",4),new DataType("phone",5),
    };

    public boolean checkStudent(File studentExcel) throws Exception{
        return this.checkFormat(studentExcel, studentExcelFormat);

    }

    public void importStudent(File studentExcel) throws Exception{

       try{
           List<StudentDto> studentDtoList = (List<StudentDto>) ExcelReader2003.readExcel(StudentDto.class,studentExcel,1,studentExcelType);
           for(int i = 0; i < studentDtoList.size(); i++){
               StudentDto studentDto = studentDtoList.get(i);
               if(studentDto == null ||studentDto.equals("")){
                   continue;
               }
               Student student = studentService.convertDtoToEntity(studentDto);
               studentDao.add(student);
           }
       }catch (Exception e){
           e.printStackTrace();
           throw new Exception("导入失败");
       }

    }


    /**
     * 检查是否符合要求
     * @param excel
     * @param excelFormat
     * @return
     * @throws Exception
     */
    private boolean checkFormat(File excel, String[] excelFormat) throws Exception {
        try {
            Workbook workbook = null;
            System.out.println(excel.getName());
            String extensionName = FilenameUtils.getExtension(excel.getName());
            if (extensionName.toLowerCase().equals("xls")) {
                FileInputStream inputStream = new FileInputStream(excel);
                workbook = new HSSFWorkbook(inputStream);
            } else if (extensionName.toLowerCase().equals("xlsx")) {
                FileInputStream inputStream = new FileInputStream(excel);
                workbook = new XSSFWorkbook(inputStream);
            } else return false;
            Sheet sheet = workbook.getSheetAt(0);

            Row row = sheet.getRow(0);

            for (Cell cell : row) {
                String data = cell.getStringCellValue();
                boolean find = false;
                if (!(data == null)|| !data.equals("")) {
                    for (String name : excelFormat) {
                        if (data.equals(name)) {
                            find = true;
                            break;
                        }
                    }
                    if (find == false) return false;
                }
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("传入的Excel不符合要求");
        }
    }
}
