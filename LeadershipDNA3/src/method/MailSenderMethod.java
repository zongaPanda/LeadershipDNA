package method;
import po.*;

public class MailSenderMethod {
	
	public static int  mailCheck(String job_number , String name , String email_address){
		//return false;
		UsersDAO usersDAO = new UsersDAO();
		EmployeeDAO employeeDAO = new EmployeeDAO();
		if(usersDAO.findByUid(Long.parseLong(job_number))!=null){
			return 1;//��������1:��id��employee�Ѿ�ע�ᣬ���Ѿ�������users������
		}
		if(employeeDAO.findById(Long.parseLong(job_number)).getEname()!=name){
			return 2;//��������2��id���û�����ƥ�䣻
		}
		Users user = new Users();
		user.setUid(Long.parseLong(job_number));
		user.setEmail(email_address);
		user.setLicense(getLicense.getlicense());
		usersDAO.save(user);
		
		return 0;
	} 

}
