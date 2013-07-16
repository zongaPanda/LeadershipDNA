package po;


import java.util.Date;

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
	private String sex;
	private String telephone;
	private String address;
	private Date birthday;
	private String qq;
	private String msn;
	private String education;
	private Boolean ifincycle;

	// Constructors

	/** default constructor */
	public Users() {
	}

	/** minimal constructor */
	public Users(Long uid) {
		this.uid = uid;
	}

	/** full constructor */
	public Users(Long uid, String passwd, String email, String license, String sex, String telephone, String address, Date birthday , String qq, String msn, String education) {
		this.uid = uid;
		this.passwd = passwd;
		this.email = email;
		this.license = license;
		this.sex = sex;
		this.telephone = telephone;
		this.address = address;
		this.birthday=birthday;
		this.qq = qq;
		this.msn = msn;
		this.education = education;
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
	
	public String getSex(){
		return this.sex;
	}
	
	public void setSex(String sex){
		this.sex = sex;
	}
	
	public String getTelephone(){
		return this.telephone;
	}
	
	public void setTelephone(String telephone){
		this.telephone = telephone;
	}
	
	public String getAddress(){
		return this.address;
	}
	
	public void setAddress(String address){
		this.address = address;
	}
	
	public Date getBirthday(){
		return this.birthday;
	}
	
	public void setBirthday(Date birthday){
		this.birthday = birthday;
	}
	
	public String getQq(){
		return this.qq;
	}
	
	public void setQq(String qq){
		this.qq = qq;
	}
	
	public String getMsn(){
		return this.msn;
	}
	
	public void setMsn(String msn){
		this.msn = msn;
	}
	
	public String getEducation(){
		return this.education;
	}
	
	public void setEducation(String education){
		this.education = education;
	}
	
	public Boolean getIfincycle() {
		return this.ifincycle;
	}

	public void setIfincycle(Boolean ifincycle) {
		this.ifincycle = ifincycle;
	}
	
}