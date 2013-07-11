package po;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Rating entity. @author MyEclipse Persistence Tools
 */

public class Rating implements java.io.Serializable {

	// Fields

	private Long rindx;
	private Long targetId;
	private Long toWhom;
	private Date startDate;
	private Date dueDate;
	private Boolean finished;
	private Boolean volid;
	private Set answerses = new HashSet(0);

	// Constructors

	/** default constructor */
	public Rating() {
	}

	/** minimal constructor */
	public Rating(Long targetId, Long toWhom) {
		this.targetId = targetId;
		this.toWhom = toWhom;
	}

	/** full constructor */
	public Rating(Long targetId, Long toWhom, Date startDate, Date dueDate,
			Boolean finished, Boolean volid, Set answerses) {
		this.targetId = targetId;
		this.toWhom = toWhom;
		this.startDate = startDate;
		this.dueDate = dueDate;
		this.finished = finished;
		this.volid = volid;
		this.answerses = answerses;
	}

	// Property accessors

	public Long getRindx() {
		return this.rindx;
	}

	public void setRindx(Long rindx) {
		this.rindx = rindx;
	}

	public Long getTargetId() {
		return this.targetId;
	}

	public void setTargetId(Long targetId) {
		this.targetId = targetId;
	}

	public Long getToWhom() {
		return this.toWhom;
	}

	public void setToWhom(Long toWhom) {
		this.toWhom = toWhom;
	}

	public Date getStartDate() {
		return this.startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getDueDate() {
		return this.dueDate;
	}

	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}

	public Boolean getFinished() {
		return this.finished;
	}

	public void setFinished(Boolean finished) {
		this.finished = finished;
	}
	
	public Boolean getVolid(){
		return this.volid;
	}
	
	public void setVolid(Boolean volid){
		this.volid = volid;
	}

	public Set getAnswerses() {
		return this.answerses;
	}

	public void setAnswerses(Set answerses) {
		this.answerses = answerses;
	}

}