package po;

/**
 * Answers entity. @author MyEclipse Persistence Tools
 */

public class Answers implements java.io.Serializable {

	// Fields

	private Long aindx;
	private Questions questions;
	private Rating rating;
	private String answer;
	private String comment;

	// Constructors

	/** default constructor */
	public Answers() {
	}

	/** minimal constructor */
	public Answers(Questions questions) {
		this.questions = questions;
	}

	/** full constructor */
	public Answers(Questions questions, Rating rating, String answer,
			String comment) {
		this.questions = questions;
		this.rating = rating;
		this.answer = answer;
		this.comment = comment;
	}

	// Property accessors

	public Long getAindx() {
		return this.aindx;
	}

	public void setAindx(Long aindx) {
		this.aindx = aindx;
	}

	public Questions getQuestions() {
		return this.questions;
	}

	public void setQuestions(Questions questions) {
		this.questions = questions;
	}

	public Rating getRating() {
		return this.rating;
	}

	public void setRating(Rating rating) {
		this.rating = rating;
	}

	public String getAnswer() {
		return this.answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getComment() {
		return this.comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

}