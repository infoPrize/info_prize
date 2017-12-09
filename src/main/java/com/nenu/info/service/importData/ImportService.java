package com.nenu.info.service.importData;

import java.io.File;

/**
 * 职责
 *
 * @author zhaiaxin
 * @time: 2017/12/7 21:04.
 */
public interface ImportService {

    /**
     * 检查传入的Excel是否符合要求
     * @param studentExcel
     * @return
     * @throws Exception
     */
    public boolean checkStudent(File studentExcel) throws Exception;

    /**
     *导入学生Excel
     * @param studentExcel
     * @return
     * @throws Exception
     */
    public void importStudent(File studentExcel) throws Exception;
}
