package po;

public class Admin {
	private String admin;
	private String pwd;
	
	public Admin(){
		
	}
	
	public Admin(String admin, String pwd){
		this.admin = admin;
		this.pwd = pwd;
	}
	
	public String getAdmin(){
		return this.admin;
	}
	
	public void setAdmin(String admin){
		this.admin = admin;
	}
	
	public String getPwd(){
		return this.pwd;
	}
	
	public void setPwd(String pwd){
		this.pwd = pwd;
	}

}
