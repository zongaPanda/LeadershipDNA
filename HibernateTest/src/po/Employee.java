package po;

import java.util.HashSet;
import java.util.Set;

/**
 * Employee entity. @author MyEclipse Persistence Tools
 */

public class Employee implements java.io.Serializable {

	// Fields

	private Long uid;
	private String ename;
	private String layerId;
	private Set userses = new HashSet(0);

	// Constructors

	/** default constructor */
	public Employee() {
	}

	/** full constructor */
	public Employee(String ename, String layerId, Set userses) {
		this.ename = ename;
		this.layerId = layerId;
		this.userses = userses;
	}

	// Property accessors

	public Long getUid() {
		return this.uid;
	}

	public void setUid(Long uid) {
		this.uid = uid;
	}

	public String getEname() {
		return this.ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public String getLayerId() {
		return this.layerId;
	}

	public void setLayerId(String layerId) {
		this.layerId = layerId;
	}

	public Set getUserses() {
		return this.userses;
	}

	public void setUserses(Set userses) {
		this.userses = userses;
	}

}