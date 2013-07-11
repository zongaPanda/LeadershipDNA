package method;
import po.*;
import servlet.*;

public class MailSenderMethod {
	
	public static int  mailCheck(String job_number , String name , String email_address){
		//return false;
		UsersDAO usersDAO = new UsersDAO();
		EmployeeDAO employeeDAO = new EmployeeDAO();
		String a,b,c,d;
		System.out.println(job_number);
		if(usersDAO.findByUid(Long.parseLong(job_number)).size()!=0&&((Users)usersDAO.findByUid(Long.parseLong(job_number)).get(0)).getPasswd()!=null){
			return 1;//错误类型1:该id的employee已经注册，及已经存在于users表中了
		}
		
		if(employeeDAO.findByUid(Long.parseLong(job_number)).size()==0){
			return 4;//错误类型4：employee中没有这号人
		}
		
		if(!employeeDAO.findById(Long.parseLong(job_number)).getEname().equals(name)){
			System.out.println("数据库中的名字是："+employeeDAO.findById(Long.parseLong(job_number)).getEname());
			System.out.println("输入的名字是："+name);
			return 2;//错误类型2：id和用户名不匹配；
		}
		
		if(usersDAO.findByUid(Long.parseLong(job_number)).size()!=0&&((Users)usersDAO.findByUid(Long.parseLong(job_number)).get(0)).getPasswd()==null){
			Users u = ((Users)usersDAO.findByUid(Long.parseLong(job_number)).get(0));
			u.setEmail(email_address);
			usersDAO.update(u);
			
			a="168chengyuxing@sina.com";
			b=email_address;
			c="get your license";
			d="Hello, "+job_number+", your license is ";
			d += ((Users)usersDAO.findByUid(Long.parseLong(job_number)).get(0)).getLicense();
			servlet.MailSender.send(a,b,c,d);
			
			return 3;
		}
		String license = getLicense.getlicense();
		Users user = new Users();
		user.setUid(Long.parseLong(job_number));
		user.setEmail(email_address);
		user.setLicense(license);
		usersDAO.save(user);
		
		
		a="168chengyuxing@sina.com";
		b=email_address;
		c="get your license";
		d="Your license is ";
		d += license;
		
		servlet.MailSender.send(a,b,c,d);
		
		return 0;
	} 

}
