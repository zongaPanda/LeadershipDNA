package po;

import java.util.HashSet;
import java.util.Set;

/**
 * Questions entity. @author MyEclipse Persistence Tools
 */

public class Questions implements java.io.Serializable {

	// Fields

	private Integer qid;
	private String content;
	private Set answerses = new HashSet(0);

	// Constructors

	/** default constructor */
	public Questions() {
	}

	/** minimal constructor */
	public Questions(String content) {
		this.content = content;
	}

	/** full constructor */
	public Questions(String content, Set answerses) {
		this.content = content;
		this.answerses = answerses;
	}

	// Property accessors

	public Integer getQid() {
		return this.qid;
	}

	public void setQid(Integer qid) {
		this.qid = qid;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Set getAnswerses() {
		return this.answerses;
	}

	public void setAnswerses(Set answerses) {
		this.answerses = answerses;
	}

}