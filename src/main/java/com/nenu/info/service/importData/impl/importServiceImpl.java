package com.nenu.info.service.importData.impl;

import com.nenu.info.Dao.category.*;
import com.nenu.info.Dao.common.StudentDao;
import com.nenu.info.common.dto.common.StudentDto;
import com.nenu.info.common.dto.category.*;
import com.nenu.info.common.entities.category.*;
import com.nenu.info.common.entities.common.Student;
import com.nenu.info.common.entities.common.DataType;
import com.nenu.info.common.utils.ExcelReader2003;
import com.nenu.info.service.category.*;
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
    private ThesisDao thesisDao;

    @Autowired
    private PatentDao patentDao;

    @Autowired
    private ScientificProjectDao scientificProjectDao;

    @Autowired
    private ACMDao acmDao;

    @Autowired
    private MathModelPrizeDao mathModelPrizeDao;

    @Autowired
    private InternetPlusDao internetPlusDao;

    @Autowired
    private ChallengeCupDao challengeCupDao;

    @Autowired
    private StudentService studentService;

    @Autowired
    private ThesisService thesisService;

    @Autowired
    private PatentService patentService;

    @Autowired
    private ScientificProjectService scientificProjectService;

    @Autowired
    private ACMService acmService;

    @Autowired
    private MathModelPrizeService mathModelPrizeService;

    @Autowired
    private InternetPlusService internetPlusService;

    @Autowired
    private ChallengeCupService challengeCupService;

    //学生

    String[] studentExcelFormat = {"姓名", "性别","学号","年级","专业","电话"};

    DataType[] studentExcelType = {
            new DataType("name", 0),new DataType("sex",1),
            new DataType("stuNumber",2),new DataType("grade",3),
            new DataType("major",4),new DataType("phone",5),
    };


    //论文


    String[] thesisExcelFormat = {  "期刊级别","发表刊物","论文题目","发表时间",
                                    "作者1","作者1等级","作者1学号",
                                    "作者2","作者2等级","作者2学号",
                                    "作者3","作者3等级","作者3学号",
                                    "作者4","作者4等级","作者4学号",
                                    "作者5","作者5等级","作者5学号",
                                    "指导老师","论文摘要"};

    DataType[] thesisExcelType = {
            new DataType("journalLevel", 0),new DataType("journalName", 1),
            new DataType("thesisTitle", 2),new DataType("publishTime", 3),
            new DataType("authorName1",4), new DataType("authorLevel1",5),new DataType("authorStuNumber1",6),
            new DataType("authorName2",7), new DataType("authorLevel2",8),new DataType("authorStuNumber2",9),
            new DataType("authorName3",10), new DataType("authorLevel3", 11),new DataType("authorStuNumber3",12),
            new DataType("authorName4",13), new DataType("authorLevel4",14),new DataType("authorStuNumber4",15),
            new DataType("authorName5",16), new DataType("authorLevel5",17),new DataType("authorStuNumber5",18),
            new DataType("teacherName",19), new DataType("thesisAbstract", 20),
    };


    //专利
    String[] patentExcelFormat = { "专利类别","专利名称","申请成功时间",
                                   "申请人1","申请人1学号","申请人2","申请人2学号",
                                   "申请人3","申请人3学号","申请人4","申请人4学号",
                                   "申请人5","申请人5学号","指导老师","专利简介"};

    DataType[] patentExcelType = {
            new DataType("patentType", 0),new DataType("patentName", 1), new DataType("applyTime", 2),
            new DataType("applierName1",3), new DataType("applierStuNumber1",4),
            new DataType("applierName2",5), new DataType("applierStuNumber2",6),
            new DataType("applierName3",7), new DataType("applierStuNumber3",8),
            new DataType("applierName4",9), new DataType("applierStuNumber4",10),
            new DataType("applierName5",11), new DataType("applierStuNumber5",12),
            new DataType("teacherName",13),new DataType("introduce",14),
    };


    //国创科研
    String[] scientificProjectExcelFormat = { "项目类别","项目名称","立项年份",
                                              "项目负责人","负责人学号",
                                              "项目成员1姓名","项目成员1学号",
                                              "项目成员2姓名","项目成员2学号",
                                              "项目成员3姓名","项目成员3学号",
                                              "项目成员4姓名","项目成员4学号",
                                              "指导老师","批复经费","项目介绍"
    };

    DataType[] scientificProjectExcelType = {
            new DataType("projectType", 0),new DataType("projectName", 1), new DataType("setYear", 2),
            new DataType("projectManName",3), new DataType("projectManStuNumber",4),
            new DataType("projectMemberName1",5), new DataType("projectMemberStuNumber1",6),
            new DataType("projectMemberName2",7), new DataType("projectMemberStuNumber2",8),
            new DataType("projectMemberName3",9), new DataType("projectMemberStuNumber3",10),
            new DataType("projectMemberName4",11), new DataType("projectMemberStuNumber4",12),
            new DataType("teacherName",13),new DataType("fundsLimit",14),new DataType("projectIntroduce",15)
    };


    //ACM
    String[] ACMPrizeExcelFormat = { "比赛类别","比赛名称","主办单位",
                                     "获奖时间","获奖等级","团队名称",
                                     "参赛人员1姓名","参赛人员1学号",
                                     "参赛人员2姓名","参赛人员2学号",
                                     "参赛人员3姓名","参赛人员3学号",
                                     "指导老师"
    };

    DataType[] ACMPrizeExcelType = {
            new DataType("matchLevel", 0),new DataType("matchName", 1), new DataType("hostUnit", 2),
            new DataType("prizeTime",3), new DataType("prizeLevel",4), new DataType("teamName",5),
            new DataType("teammateName1",6), new DataType("teammateStuNumber1",7),
            new DataType("teammateName2",8), new DataType("teammateStuNumber2",9),
            new DataType("teammateName3",10), new DataType("teammateStuNumber3",11),
            new DataType("teacherName",12),
    };

    //数学建模


    String[] MathExcelFormat = {"比赛类别","比赛名称","主办单位",
                                "获奖时间","获奖等级","团队名称",
                                "参赛人员1姓名","参赛人员1学号",
                                "参赛人员2姓名","参赛人员2学号",
                                "参赛人员3姓名","参赛人员3学号",
                                "指导老师"
    };

    DataType[] MathExcelType = {
            new DataType("matchLevel", 0),new DataType("matchName", 1), new DataType("hostUnit", 2),
            new DataType("prizeTime",3), new DataType("prizeLevel",4), new DataType("teamName",5),
            new DataType("teammateName1",6), new DataType("teammateStuNumber1",7),
            new DataType("teammateName2",8), new DataType("teammateStuNumber2",9),
            new DataType("teammateName3",10), new DataType("teammateStuNumber3",11),
            new DataType("teacherName",12),
    };

    //互联网加

    String[] InternetPlusExcelFormat = {"比赛级别","比赛名称","项目名","队伍名",
            "成员1姓名","成员1学号","成员2姓名","成员2学号","成员3姓名","成员3学号",
            "成员4姓名","成员4学号","成员5姓名","成员5学号","成员6姓名","成员6学号",
            "成员7姓名","成员7学号","成员8姓名","成员8学号","获奖等级","获奖时间",
            "主办单位","指导教师"
    };

    DataType[] InternetPlusExcelType = {
            new DataType("matchLevel", 0),new DataType("matchName", 1), new DataType("projectName", 2), new DataType("teamName",3),
            new DataType("stuName1",4), new DataType("stuNumber1",5),
            new DataType("stuName2",6), new DataType("stuNumber2",7),
            new DataType("stuName3",8), new DataType("stuNumber3",9),
            new DataType("stuName4",10), new DataType("stuNumber4",11),
            new DataType("stuName5",12), new DataType("stuNumber5",13),
            new DataType("stuName6",14), new DataType("stuNumber6",15),
            new DataType("stuName7",16), new DataType("stuNumber7",17),
            new DataType("stuName8",18), new DataType("stuNumber8",19),
            new DataType("prizeLevel",20), new DataType("prizeTime",21),
            new DataType("hostUnit",22), new DataType("teacherName",23),
    };

    //挑战杯

    String[] ChallengeCupExcelFormat = {
            "比赛级别","比赛名称","项目名","队伍名",
            "成员1姓名","成员1学号","成员2姓名","成员2学号","成员3姓名","成员3学号",
            "成员4姓名","成员4学号","成员5姓名","成员5学号","成员6姓名","成员6学号",
            "成员7姓名","成员7学号","成员8姓名","成员8学号","获奖等级","获奖时间",
            "主办单位","指导教师"

    };

    DataType[] ChallengeCupExcelType = {
            new DataType("matchLevel", 0),new DataType("matchName", 1), new DataType("projectName", 2), new DataType("teamName",3),
            new DataType("stuName1",4), new DataType("stuNumber1",5),
            new DataType("stuName2",6), new DataType("stuNumber2",7),
            new DataType("stuName3",8), new DataType("stuNumber3",9),
            new DataType("stuName4",10), new DataType("stuNumber4",11),
            new DataType("stuName5",12), new DataType("stuNumber5",13),
            new DataType("stuName6",14), new DataType("stuNumber6",15),
            new DataType("stuName7",16), new DataType("stuNumber7",17),
            new DataType("stuName8",18), new DataType("stuNumber8",19),
            new DataType("prizeLevel",20), new DataType("prizeTime",21),
            new DataType("hostUnit",22), new DataType("teacherName",23),
    };




    public boolean checkStudent(File studentExcel) throws Exception{
        return this.checkFormat(studentExcel, studentExcelFormat);

    }

    public void importStudent(File studentExcel) throws Exception{

       try{
           List<StudentDto> studentDtoList = (List<StudentDto>) ExcelReader2003.readExcel(StudentDto.class,studentExcel,1,studentExcelType);
           for(int i = 0; i < studentDtoList.size(); i++){
               StudentDto studentDto = studentDtoList.get(i);
               if(studentDto.getStuNumber() == null ){
                   break;
               }
               Student student = studentService.convertDtoToEntity(studentDto);
               studentDao.add(student);
           }
       }catch (Exception e){
           e.printStackTrace();
           throw new Exception("导入数据存在空行或数据不完整");
       }

    }


    //论文


    public boolean checkThesis(File thesisExcel) throws Exception{
        return this.checkFormat(thesisExcel, thesisExcelFormat);

    }

    public void importThesis(File thesisExcel) throws Exception{

        try{
            List<ThesisDto> thesisDtoList = (List<ThesisDto>) ExcelReader2003.readExcel(ThesisDto.class,thesisExcel,1,thesisExcelType);
            for(int i = 0; i < thesisDtoList.size(); i++){
                ThesisDto thesisDto = thesisDtoList.get(i);
                if(thesisDto.getThesisTitle() == null){
                    break;
                }
                Thesis thesis = thesisService.convertDtoToEntity(thesisDto);
                thesisDao.add(thesis);
            }
        }catch (Exception e){
            e.printStackTrace();
            throw new Exception("导入数据存在空行或数据不完整");
        }

    }

    //专利

    public boolean checkPatent(File patentExcel) throws Exception{
        return this.checkFormat(patentExcel, patentExcelFormat);

    }

    public void importPatent(File patentExcel) throws Exception{

        try{
            List<PatentDto> patentDtoList = (List<PatentDto>) ExcelReader2003.readExcel(PatentDto.class,patentExcel,1,patentExcelType);
            for(int i = 0; i < patentDtoList.size(); i++){
                PatentDto patentDto = patentDtoList.get(i);
                if(patentDto.getPatentName() == null){
                    break;
                }
                Patent patent = patentService.convertDtoToEntity(patentDto);
                patentDao.add(patent);
            }
        }catch (Exception e){
            e.printStackTrace();
            throw new Exception("导入数据存在空行或数据不完整");
        }

    }

    //国创科研

    public boolean checkScientificProject(File scientificProjectExcel ) throws Exception{
        return this.checkFormat(scientificProjectExcel,scientificProjectExcelFormat);
    }

    public void importScientificProject(File scientificProjectExcel ) throws Exception{

        try{
            List<ScientificProjectDto> scientificProjectDtoList = (List<ScientificProjectDto>) ExcelReader2003.readExcel(ScientificProjectDto.class,scientificProjectExcel,1,scientificProjectExcelType);
            for(int i = 0; i < scientificProjectDtoList.size(); i++){
                ScientificProjectDto scientificProjectDto = scientificProjectDtoList.get(i);
                if(scientificProjectDto.getProjectType() == null){
                    break;
                }
                ScientificProject scientificProject = scientificProjectService.convertDtoToEntity(scientificProjectDto);
                scientificProjectDao.addScientificProject(scientificProject);
            }
        }catch (Exception e){
            e.printStackTrace();
            throw new Exception("导入数据存在空行或数据不完整");
        }
    }

    //ACM

    public boolean checkACMPrize(File ACMPrizeExcel ) throws Exception{
        return this.checkFormat(ACMPrizeExcel,ACMPrizeExcelFormat);
    }

    public void importACMPrize(File ACMPrizeExcel ) throws Exception{

        try{
            List<ACMPrizeDto> acmPrizeDtoList = (List<ACMPrizeDto>) ExcelReader2003.readExcel(ACMPrizeDto.class,ACMPrizeExcel,1,ACMPrizeExcelType);
            for(int i = 0; i < acmPrizeDtoList.size(); i++){
                ACMPrizeDto acmPrizeDto = acmPrizeDtoList.get(i);
                if(acmPrizeDto.getMatchLevel() == null){
                    break;
                }
                ACMPrize acmPrize = acmService.convertDtoToEntity(acmPrizeDto);
                acmService.add(acmPrize);
            }
        }catch (Exception e){
            e.printStackTrace();
            throw new Exception("导入数据存在空行或数据不完整");
        }
    }

    //数学建模
    public boolean checkMath(File mathExcel ) throws Exception{
        return this.checkFormat(mathExcel,MathExcelFormat);
    }

    public void importMath(File MathExcel ) throws Exception{

        try{
            List<MathModelPrizeDto> mathModelPrizeDtoList = (List<MathModelPrizeDto>) ExcelReader2003.readExcel(MathModelPrizeDto.class,MathExcel,1,MathExcelType);
            for(int i = 0; i < mathModelPrizeDtoList.size(); i++){
                MathModelPrizeDto mathModelPrizeDto = mathModelPrizeDtoList.get(i);
                if(mathModelPrizeDto.getMatchLevel() == null){
                    break;
                }
                MathModelPrize mathModelPrize = mathModelPrizeService.convertDtoToEntity(mathModelPrizeDto);
                mathModelPrizeDao.add(mathModelPrize);
            }
        }catch (Exception e){
            e.printStackTrace();
            throw new Exception("导入数据存在空行或数据不完整");
        }
    }

    //互联网加

    public boolean checkInternetPlus(File internetPlusExcel ) throws Exception{
        return this.checkFormat(internetPlusExcel,InternetPlusExcelFormat);
    }

    public void importInternetPlus(File internetPlusExcel ) throws Exception{

        try{
            List<InternetPlusDto> internetPlusDtoList = (List<InternetPlusDto>) ExcelReader2003.readExcel(InternetPlusDto.class,internetPlusExcel,1,InternetPlusExcelType);
            for(int i = 0; i < internetPlusDtoList.size(); i++){
                InternetPlusDto internetPlusDto = internetPlusDtoList.get(i);
                if(internetPlusDto.getMatchLevel() == null){
                    break;
                }
                InternetPlus internetPlus = internetPlusService.convertDtoToEntity(internetPlusDto);
                internetPlusDao.add(internetPlus);
            }
        }catch (Exception e){
            e.printStackTrace();
            throw new Exception("导入数据存在空行或数据不完整");
        }
    }

    //挑战杯

    public boolean checkChallengeCup(File challengeCupExcel ) throws Exception{
        return this.checkFormat(challengeCupExcel,ChallengeCupExcelFormat);
    }

    public void importChallengeCup(File challengeCupExcel ) throws Exception{

        try{
            List<ChallengeCupDto> challengeCupDtoList = (List<ChallengeCupDto>) ExcelReader2003.readExcel(ChallengeCupDto.class,challengeCupExcel,1,ChallengeCupExcelType);
            for(int i = 0; i < challengeCupDtoList.size(); i++){
                ChallengeCupDto challengeCupDto= challengeCupDtoList.get(i);
                if(challengeCupDto.getMatchLevel() == null){
                    break;
                }
                ChallengeCup challengeCup = challengeCupService.convertDtoToEntity(challengeCupDto);
                challengeCupDao.add(challengeCup);
            }
        }catch (Exception e){
            e.printStackTrace();
            throw new Exception("导入数据存在空行或数据不完整");
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
