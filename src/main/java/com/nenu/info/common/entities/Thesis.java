package com.nenu.info.common.entities;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

/**
 * 实体类 - 论文
 * @author: software-liuwang
 * @time: 2017/11/6 10:50
 * @description :
 */

@Entity
@Table(name = "t_thesis")
public class Thesis {

    //id
    @Id
    private Integer id;

    //论文标题
    @Column(name = "thesis_title")
    private String thesisTitle;

    //作者1id
    @Column(name = "author_id_1")
    private Integer authorId1;

    //作者1的等级(1-第一作者; 2-第二作者 ...)
    @Column(name = "author_level_1")
    private Integer authorLevel1;

    //作者2id
    @Column(name = "author_id_2")
    private Integer authorId2;

    //作者2的等级(1-第一作者; 2-第二作者 ...)
    @Column(name = "author_level_2")
    private Integer authorLevel2;

    //作者3id
    @Column(name = "author_id_3")
    private Integer authorId3;

    //作者3的等级(1-第一作者; 2-第二作者 ...)
    @Column(name = "author_level_3")
    private Integer authorLevel3;

    //作者4id
    @Column(name = "author_id_4")
    private Integer authorId4;

    //作者4的等级(1-第一作者; 2-第二作者 ...)
    @Column(name = "author_level_4")
    private Integer authorLevel4;

    //作者5id
    @Column(name = "author_id_5")
    private Integer authorId5;

    //作者5的等级(1-第一作者; 2-第二作者 ...)
    @Column(name = "author_level_5")
    private Integer authorLevel5;

    //论文发表时间
    @Column(name = "publish_time")
    private Date publishTime;

    //期刊名字
    @Column(name = "journal_name")
    private String journalName;

    //期刊等级(1-E; 2-D; 3-C; 4-B; 5-A; 6-T; 7-未知)
    @Column(name = "journal_level")
    private Integer journalLevel;

    //论文摘要
    @Column(name = "thesis_abstract")
    private String thesisAbstract;

    //指导教师id
    @Column(name = "teacher_id")
    private Integer teacherId;

    //创建时间
    @Column(name = "create_time")
    private Date createTime;

    //最后修改时间
    @Column(name = "last_modified_time")
    private Date lastModifiedTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getThesisTitle() {
        return thesisTitle;
    }

    public void setThesisTitle(String thesisTitle) {
        this.thesisTitle = thesisTitle;
    }

    public Integer getAuthorId1() {
        return authorId1;
    }

    public void setAuthorId1(Integer authorId1) {
        this.authorId1 = authorId1;
    }

    public Integer getAuthorLevel1() {
        return authorLevel1;
    }

    public void setAuthorLevel1(Integer authorLevel1) {
        this.authorLevel1 = authorLevel1;
    }

    public Integer getAuthorId2() {
        return authorId2;
    }

    public void setAuthorId2(Integer authorId2) {
        this.authorId2 = authorId2;
    }

    public Integer getAuthorLevel2() {
        return authorLevel2;
    }

    public void setAuthorLevel2(Integer authorLevel2) {
        this.authorLevel2 = authorLevel2;
    }

    public Integer getAuthorId3() {
        return authorId3;
    }

    public void setAuthorId3(Integer authorId3) {
        this.authorId3 = authorId3;
    }

    public Integer getAuthorLevel3() {
        return authorLevel3;
    }

    public void setAuthorLevel3(Integer authorLevel3) {
        this.authorLevel3 = authorLevel3;
    }

    public Integer getAuthorId4() {
        return authorId4;
    }

    public void setAuthorId4(Integer authorId4) {
        this.authorId4 = authorId4;
    }

    public Integer getAuthorLevel4() {
        return authorLevel4;
    }

    public void setAuthorLevel4(Integer authorLevel4) {
        this.authorLevel4 = authorLevel4;
    }

    public Integer getAuthorId5() {
        return authorId5;
    }

    public void setAuthorId5(Integer authorId5) {
        this.authorId5 = authorId5;
    }

    public Integer getAuthorLevel5() {
        return authorLevel5;
    }

    public void setAuthorLevel5(Integer authorLevel5) {
        this.authorLevel5 = authorLevel5;
    }

    public Date getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(Date publishTime) {
        this.publishTime = publishTime;
    }

    public String getJournalName() {
        return journalName;
    }

    public void setJournalName(String journalName) {
        this.journalName = journalName;
    }

    public Integer getJournalLevel() {
        return journalLevel;
    }

    public void setJournalLevel(Integer journalLevel) {
        this.journalLevel = journalLevel;
    }

    public String getThesisAbstract() {
        return thesisAbstract;
    }

    public void setThesisAbstract(String thesisAbstract) {
        this.thesisAbstract = thesisAbstract;
    }

    public Integer getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(Integer teacherId) {
        this.teacherId = teacherId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getLastModifiedTime() {
        return lastModifiedTime;
    }

    public void setLastModifiedTime(Date lastModifiedTime) {
        this.lastModifiedTime = lastModifiedTime;
    }
}
