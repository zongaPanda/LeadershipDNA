package po;

import java.util.HashSet;
import java.util.Set;

/**
 * CusActions entity. @author MyEclipse Persistence Tools
 */

public class CusActions implements java.io.Serializable {

	// Fields

	private Long aid;
	private String content;
	private String link;
	private Set chosenActionses = new HashSet(0);

	// Constructors

	/** default constructor */
	public CusActions() {
	}

	/** full constructor */
	public CusActions(String content, String link, Set chosenActionses) {
		this.content = content;
		this.link = link;
		this.chosenActionses = chosenActionses;
	}

	// Property accessors

	public Long getAid() {
		return this.aid;
	}

	public void setAid(Long aid) {
		this.aid = aid;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getLink() {
		return this.link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public Set getChosenActionses() {
		return this.chosenActionses;
	}

	public void setChosenActionses(Set chosenActionses) {
		this.chosenActionses = chosenActionses;
	}

}