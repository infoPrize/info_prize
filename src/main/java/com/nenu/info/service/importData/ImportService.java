package com.nenu.info.service.importData;

import org.springframework.ui.Model;

import java.io.File;

/**
 * 职责
 *
 * @author zhaiaxin
 * @time: 2017/12/7 21:04.
 */
public interface ImportService {

    /**
     * 检查传入- 学生 -的Excel是否符合要求
     * @param studentExcel
     * @return
     * @throws Exception
     */
    public boolean checkStudent(File studentExcel) throws Exception;

    /**
     *导入- 学生 -Excel
     * @param studentExcel
     * @return
     * @throws Exception
     */
    public int importStudent(File studentExcel, Model model) throws Exception;




    /**
     * 检查传入 - 论文 -的Excel是否符合要求
     * @param thesisExcel
     * @return
     * @throws Exception
     */
    public boolean checkThesis(File thesisExcel) throws Exception;

    /**
     *导入- 论文 -Excel
     * @param thesisExcel
     * @return
     * @throws Exception
     */
    public int importThesis(File thesisExcel) throws Exception;




    /**
     * 检查传入 - 专利 -的Excel是否符合要求
     * @param patentExcel
     * @return
     * @throws Exception
     */
    public boolean checkPatent(File patentExcel) throws Exception;

    /**
     *导入- 专利 -Excel
     * @param patentExcel
     * @return
     * @throws Exception
     */
    public int importPatent(File patentExcel) throws Exception;



    /**
     * 检查传入 - 国创科研 -的Excel是否符合要求
     * @param scientificExcel
     * @return
     * @throws Exception
     */
    public boolean checkScientificProject(File scientificExcel) throws Exception;

    /**
     *导入- 国创科研 -Excel
     * @param scientificExcel
     * @return
     * @throws Exception
     */
    public int importScientificProject(File scientificExcel) throws Exception;



    /**
     * 检查传入 - ACM -的Excel是否符合要求
     * @param ACMPrizeExcel
     * @return
     * @throws Exception
     */
    public boolean checkACMPrize(File ACMPrizeExcel) throws Exception;

    /**
     *导入- ACM -Excel
     * @param ACMPrizeExcel
     * @return
     * @throws Exception
     */
    public int importACMPrize(File ACMPrizeExcel) throws Exception;


    /**
     * 检查传入 - 数学建模 -的Excel是否符合要求
     * @param mathExcel
     * @return
     * @throws Exception
     */
    public boolean checkMath(File mathExcel) throws Exception;

    /**
     *导入- 数学建模 -Excel
     * @param mathExcel
     * @return
     * @throws Exception
     */
    public int importMath(File mathExcel) throws Exception;



    /**
     *检查传入 - 互联网+ -的Excel是否符合要求
     * @param internetPlusExcel
     * @return
     * @throws Exception
     */
    public boolean checkInternetPlus(File internetPlusExcel ) throws Exception;

    /**
     * 导入- 互联网加 -Excel
     * @param internetPlusExcel
     * @throws Exception
     */

    public int importInternetPlus(File internetPlusExcel ) throws Exception;


    /**
     *检查传入 - 挑战杯 -的Excel是否符合要求
     * @param challengeCupExcel
     * @return
     * @throws Exception
     */
    public boolean checkChallengeCup(File challengeCupExcel ) throws Exception;

    /**
     * 导入- 挑战杯 -Excel
     * @param challengeCupExcel
     * @throws Exception
     */

    public int importChallengeCup(File challengeCupExcel ) throws Exception;


    /**
     * 检查传入 - 其他比赛 -的Excel是否符合要求
     * @param otherMatchExcel
     * @return
     * @throws Exception
     */
    public boolean checkOtherMatch(File otherMatchExcel ) throws Exception;

    /**
     * 导入- 其他比赛 -Excel
     * @param otherMatchExcel
     * @throws Exception
     */
    public int importOtherMatch(File otherMatchExcel ) throws Exception;

}
