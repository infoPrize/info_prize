package com.nenu.info.common.utils.excel;

import java.util.ArrayList;

/**
 * 测试excel
 *
 * @author zhaiaxin
 * @time: 2017/12/13 19:56.
 */
public class Test {
    public static void main(String[] args) throws Exception {
        PoiExcelHelper helper;
        String filePath = "C:\\Users\\Joiner-Axin\\Desktop\\16级计算机学生信息.xlsx";
        int sheetIndex = 0;

        if(filePath.indexOf(".xlsx")!=-1) {
            helper = new PoiExcel2k7Helper();
        }else {
            helper = new PoiExcel2k3Helper();
        }

        ArrayList<ArrayList<String>> dataList = helper.readExcel(filePath, 0);

        int index = 0;

        for(ArrayList<String> data : dataList) {
            index ++;
            System.out.println();
            System.out.print(index);
            for(String v : data) {
                System.out.print(v);
            }
        }
//
//        DataType[] studentExcelType = {
//                new DataType("name", 0),new DataType("sex",1),
//                new DataType("stuNumber",2),new DataType("grade",3),
//                new DataType("majorCode",4),new DataType("phone",5),
//        };
//
//        DataType dataType = null ;
//
//        List<Student> studentList = new ArrayList<Student>();
//
//        Student student = null;
//
//        System.out.println(getFiledName(student));
//        String[] fieldNames=new String[fields.length];
//        for(int i=0;i<fields.length;i++){
//            System.out.println(fields[i].getType());
//            fieldNames[i]=fields[i].getName();
//        }

//        for(ArrayList<String> data : dataList){
//            for(String property : data) {
//                try{
//                    BeanUtils.setProperty(student,student.getClass().getDeclaredFields(),property);
//                }catch (Exception e){
//                    throw new Exception("不能转化为目标的属性");
//                }
//                System.out.println();
//            }
//        }



//
//    }
//    private static String[] getFiledName(Object o){
//        Field[] fields=o.getClass().getDeclaredFields();
//        String[] fieldNames=new String[fields.length];
//        for(int i=0;i<fields.length;i++){
//            System.out.println(fields[i].getType());
//            fieldNames[i]=fields[i].getName();
//        }
//        return fieldNames;
    }



}
