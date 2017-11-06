package com.nenu.info.common.entities;

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
    @Column(name = "title")
    private String title;

    //第一作者id
    @Column(name = "author_id_1")
    private Integer authorId1;

    //其他作者
    @Column(name = "other_author")
    private String otherAuthor;

    //论文发表时间
    @Column(name = "publish_time")
    private Date publishTime;

    //期刊等级(0-未知; 1-E; 2-D; 3-C; 4-B; 5-A; 6-T)
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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getAuthorId1() {
        return authorId1;
    }

    public void setAuthorId1(Integer authorId1) {
        this.authorId1 = authorId1;
    }

    public String getOtherAuthor() {
        return otherAuthor;
    }

    public void setOtherAuthor(String otherAuthor) {
        this.otherAuthor = otherAuthor;
    }

    public Date getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(Date publishTime) {
        this.publishTime = publishTime;
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
