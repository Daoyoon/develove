package com.emopicture.domain;

public class Criteria {

	private int pageNo;
	private String searchType;
	private String keyword;	
	private int totalCount;
	
	//한 페이지당 자료수
	private double perPage;
	//페이지 갯수
	private double perPageNum;
	
	public Criteria(){
		this.pageNo = 1;
		this.perPage = 15.0;
		this.perPageNum = 5.0;
		this.searchType="";
		this.keyword="";
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public double getPerPage() {
		return perPage;
	}
	public void setPerPage(double perPage) {
		this.perPage = perPage;
	}
	public double getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(double perPageNum) {
		this.perPageNum = perPageNum;
	}
	@Override
	public String toString() {
		return "{pageNo:" + pageNo + ", searchType:'" + searchType + "', keyword:'" + keyword + "', totalCount:"
				+ totalCount + ", perPage:" + perPage + ", perPageNum:" + perPageNum + "}";
	}

	
}