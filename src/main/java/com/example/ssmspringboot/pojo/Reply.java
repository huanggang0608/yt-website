package com.example.ssmspringboot.pojo;

public class Reply {
    /**
     * 回复内容
     */
    private String hfContent;

    /**
     * 回复对像名
     */
    private String atName;

    public Reply() {
    }

    public Reply(String hfContent, String atName) {
        this.hfContent = hfContent;
        this.atName = atName;
    }

    public String getHfContent() {
        return hfContent;
    }

    public void setHfContent(String hfContent) {
        this.hfContent = hfContent;
    }

    public String getAtName() {
        return atName;
    }

    public void setAtName(String atName) {
        this.atName = atName;
    }
}
