package method;
import po.*;

public class MailSenderMethod {
	
	public static int  mailCheck(String job_number , String name , String email_address){
		//return false;
		UsersDAO usersDAO = new UsersDAO();
		EmployeeDAO employeeDAO = new EmployeeDAO();
		if(usersDAO.findByUid(Long.parseLong(job_number))!=null){
			return 1;//错误类型1:该id的employee已经注册，及已经存在于users表中了
		}
		if(employeeDAO.findById(Long.parseLong(job_number)).getEname()!=name){
			return 2;//错误类型2：id和用户名不匹配；
		}
		Users user = new Users();
		user.setUid(Long.parseLong(job_number));
		user.setEmail(email_address);
		user.setLicense(getLicense.getlicense());
		usersDAO.save(user);
		
		return 0;
	} 

}
