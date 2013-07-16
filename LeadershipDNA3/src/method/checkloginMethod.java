package method;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import po.*;
import SessionFactory.*;


public class checkloginMethod {
	public boolean checkNameAndPwd(Long name, String pwd){
		boolean ret=false;
	
		UsersDAO usersDAO = new UsersDAO();
		if(usersDAO.findByUid(name).size()!=0){
			String passwd = ((Users)usersDAO.findByUid(name).get(0)).getPasswd();
			if(passwd.equals(pwd)){
				return true;
			}else return false;
		}else return false;
	}
	
}
