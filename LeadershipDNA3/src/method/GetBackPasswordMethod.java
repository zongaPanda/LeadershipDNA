package method;
import java.util.List;

import po.*;
import servlet.*;

public class GetBackPasswordMethod {
	public static boolean getBackPasswordMethod(String job_number , String name){
		boolean ret = false;
		UsersDAO usersdao = new UsersDAO();
		EmployeeDAO employeedao = new EmployeeDAO();
		List ulist = usersdao.findByUid(Long.parseLong(job_number));
		if(ulist.size()==0){
			ret = false;
			return false;
		}
		Employee employee = employeedao.findById(Long.parseLong(job_number));
		String dbname = employee.getEname();
		if(!dbname.equals(name)){
			ret = false;
			return ret;
		}
		//ret = true;
		String password = ((Users)ulist.get(0)).getPasswd();
		String email = ((Users)ulist.get(0)).getEmail();
		String a="168chengyuxing@sina.com";
		String b=email;
		String c="get back your password";
		String d="Your password is : ";
		d += password;
		boolean send = false;
		int sendTimes = 0;
		while(sendTimes<5&&(!send)){
			send=servlet.MailSender.send(a, b, c, d);
			sendTimes++;
		}
		if(send) ret = true;
		else ret = false;
		return ret;
	}
}
