package com.example.ssmspringboot.pojo;

public class Result {
    /**
     * 状态码 200成功；201失败
     */
    private Integer status;
    /**
     * 状态信息
     */
    private String msg;

    public Result() {
    }

    public Result(Integer status, String msg){
        this.status=status;
        this.msg=msg;
    }
    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
