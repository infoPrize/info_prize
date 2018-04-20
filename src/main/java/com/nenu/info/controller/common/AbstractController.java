package com.nenu.info.controller.common;

import com.nenu.info.service.category.*;
import com.nenu.info.service.common.MaterialService;
import com.nenu.info.service.common.StudentService;
import com.nenu.info.service.common.TeacherService;
import com.nenu.info.service.importData.ImportService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author: software-liuwang
 * @time: 2018/3/15 8:50
 * @description:
 */
public class AbstractController {

    @Autowired
    protected ACMService acmService;

    @Autowired
    protected ChallengeCupService challengeCupService;

    @Autowired
    protected InternetPlusService internetPlusService;

    @Autowired
    protected MathModelPrizeService mathModelPrizeService;

    @Autowired
    protected OtherMatchService otherMatchService;

    @Autowired
    protected PatentService patentService;

    @Autowired
    protected ScientificProjectService scientificProjectService;

    @Autowired
    protected ThesisService thesisService;

    @Autowired
    protected MaterialService materialService;

    @Autowired
    protected StudentService studentService;

    @Autowired
    protected TeacherService teacherService;

    @Autowired
    protected ImportService importService;

    public static final String NO_SUCH_PAGE_ERROR = "对不起，您访问的页面不存在";

    public static final String SYSTEM_ERROR = "对不起，系统抛出异常，请联系系统管理员";

    public static final String INCOMPLETE_DATA_ERROR = "对不起，您填写的数据不全，请完善数据";

    /**
     * 发送JSON数组对象
     * @param jsonArray
     * @return
     */
    public JSONObject sendJSONArray(JSONArray jsonArray) {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("data", jsonArray);

        return jsonObject;
    }
}
