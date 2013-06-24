package method;
import po.Employee;
import po.EmployeeDAO;
import po.Users;
import po.UsersDAO;

public class checkloginMethod {
	public boolean checkNameAndPwd(String name, String pwd){
		boolean ret=false;
		EmployeeDAO employeeDAO = new EmployeeDAO();
		UsersDAO usersDAO = new UsersDAO();
		//System.out.println(employeeDAO.findAll().size());
		//System.out.println(usersDAO.findAll().size());
		if(employeeDAO.findByEname(name).size()!=0){
			Long uid=((Employee)(employeeDAO.findByEname(name).get(0))).getUid();
			if(usersDAO.findByUid(uid).size()!=0){
				String passwd = ((Users)(usersDAO.findByUid(uid).get(0))).getPasswd();
				if(passwd.equals(pwd)){
					return true;
				}
			}
			else{
				return false;
			}
		}
		else{
			return false;
		}
		return ret;
	}
	
}
