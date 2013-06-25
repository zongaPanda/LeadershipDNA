package po;

import java.util.Date;

/**
 * Remarks entity. @author MyEclipse Persistence Tools
 */

public class Remarks implements java.io.Serializable {

	// Fields

	private Long indx;
	private Plan plan;
	private String content;
	private Boolean isRead;
	private Date rdate;

	// Constructors

	/** default constructor */
	public Remarks() {
	}

	/** full constructor */
	public Remarks(Plan plan, String content, Boolean isRead, Date rdate) {
		this.plan = plan;
		this.content = content;
		this.isRead = isRead;
		this.rdate = rdate;
	}

	// Property accessors

	public Long getIndx() {
		return this.indx;
	}

	public void setIndx(Long indx) {
		this.indx = indx;
	}

	public Plan getPlan() {
		return this.plan;
	}

	public void setPlan(Plan plan) {
		this.plan = plan;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Boolean getIsRead() {
		return this.isRead;
	}

	public void setIsRead(Boolean isRead) {
		this.isRead = isRead;
	}

	public Date getRdate() {
		return this.rdate;
	}

	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}

}