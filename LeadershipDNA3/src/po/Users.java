package po;

/**
 * Users entity. @author MyEclipse Persistence Tools
 */

public class Users implements java.io.Serializable {

	// Fields

	private Long indx;
	private Long uid;
	private String passwd;
	private String email;
	private String license;

	// Constructors

	/** default constructor */
	public Users() {
	}

	/** minimal constructor */
	public Users(Long uid) {
		this.uid = uid;
	}

	/** full constructor */
	public Users(Long uid, String passwd, String email, String license) {
		this.uid = uid;
		this.passwd = passwd;
		this.email = email;
		this.license = license;
	}

	// Property accessors

	public Long getIndx() {
		return this.indx;
	}

	public void setIndx(Long indx) {
		this.indx = indx;
	}

	public Long getUid() {
		return this.uid;
	}

	public void setUid(Long uid) {
		this.uid = uid;
	}

	public String getPasswd() {
		return this.passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getLicense() {
		return this.license;
	}

	public void setLicense(String license) {
		this.license = license;
	}

}