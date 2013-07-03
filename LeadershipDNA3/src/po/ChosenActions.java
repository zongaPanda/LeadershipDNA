package po;

import java.util.Date;

/**
 * ChosenActions entity. @author MyEclipse Persistence Tools
 */

public class ChosenActions implements java.io.Serializable {

	// Fields

	private Long indx;
	private Plan plan;
	private long pId;
	private CusActions cusActions;
	private Date dueDate;
	private String support;
	private Boolean finished;
	

	// Constructors

	/** default constructor */
	public ChosenActions() {
	}

	/** full constructor */
	public ChosenActions(Plan plan, CusActions cusActions, Date dueDate,
			String support, Boolean finished) {
		this.plan = plan;
		this.cusActions = cusActions;
		this.dueDate = dueDate;
		this.support = support;
		this.finished = finished;
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
	public long getPid(){
		return plan.getPid();
	}
	public void setPid(){
		this.pId=plan.getPid();
	}

	public CusActions getCusActions() {
		return this.cusActions;
	}

	public void setCusActions(CusActions cusActions) {
		this.cusActions = cusActions;
	}

	public Date getDueDate() {
		return this.dueDate;
	}

	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}

	public String getSupport() {
		return this.support;
	}

	public void setSupport(String support) {
		this.support = support;
	}

	public Boolean getFinished() {
		return this.finished;
	}

	public void setFinished(Boolean finished) {
		this.finished = finished;
	}

}