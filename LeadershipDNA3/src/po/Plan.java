package po;

import java.util.HashSet;
import java.util.Set;

/**
 * Plan entity. @author MyEclipse Persistence Tools
 */

public class Plan implements java.io.Serializable {

	// Fields

	private Long pid;
	private String targetId;
	private Boolean isApproved;
	private Boolean finished;
	private Boolean isConfirmed;
	private Set remarkses = new HashSet(0);
	private Set chosenActionses = new HashSet(0);

	// Constructors

	/** default constructor */
	public Plan() {
	}

	/** minimal constructor */
	public Plan(String targetId) {
		this.targetId = targetId;
	}

	/** full constructor */
	public Plan(String targetId, Boolean isApproved, Boolean finished,
			Set remarkses, Set chosenActionses) {
		this.targetId = targetId;
		this.isApproved = isApproved;
		this.finished = finished;
		this.remarkses = remarkses;
		this.chosenActionses = chosenActionses;
	}

	// Property accessors

	public Long getPid() {
		return this.pid;
	}

	public void setPid(Long pid) {
		this.pid = pid;
	}

	public String getTargetId() {
		return this.targetId;
	}

	public void setTargetId(String targetId) {
		this.targetId = targetId;
	}

	public Boolean getIsApproved() {
		return this.isApproved;
	}

	public void setIsApproved(Boolean isApproved) {
		this.isApproved = isApproved;
	}
	
	public Boolean getIsConfirmed() {
		return this.isConfirmed;
	}

	public void setIsConfirmed(Boolean isApproved) {
		this.isConfirmed = isApproved;
	}
	
	public Boolean getFinished() {
		return this.finished;
	}

	public void setFinished(Boolean finished) {
		this.finished = finished;
	}

	public Set getRemarkses() {
		return this.remarkses;
	}

	public void setRemarkses(Set remarkses) {
		this.remarkses = remarkses;
	}

	public Set getChosenActionses() {
		return this.chosenActionses;
	}

	public void setChosenActionses(Set chosenActionses) {
		this.chosenActionses = chosenActionses;
	}

}