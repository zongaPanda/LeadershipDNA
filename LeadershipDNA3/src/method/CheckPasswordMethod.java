package method;
import po.*;

public class CheckPasswordMethod {
	public static boolean savepassword(String registerUser,String password){
		Users user = new Users();
		UsersDAO usersDAO = new UsersDAO();
		user = (Users)usersDAO.findByUid(Long.parseLong(registerUser)).get(0);
		user.setPasswd(password);
		usersDAO.update(user);
		return true;
	}

}
