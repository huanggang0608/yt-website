package com.example.ssmspringboot.pojo;

public class PageBean {

	private int currPage;//当前页
	private int totalCount;//总记录数
	private int totalPage;//总页数
	
	
	public PageBean(int currPage,int totalCount){
		this.currPage=currPage;
		this.totalCount=totalCount;
		// 总页数，总共数据条数/10.0，
		totalPage=(int) Math.ceil(totalCount/10.0);
	}
	
	
	
	public int getCurrPage() {
		return currPage;
	}
	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}

	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	
	
}
