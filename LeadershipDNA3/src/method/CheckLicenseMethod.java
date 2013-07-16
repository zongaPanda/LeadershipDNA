package method;
import po.*;

public class CheckLicenseMethod {
	public static boolean check(String registerUser,String inputLicense){
		UsersDAO usersDAO = new UsersDAO();
		String DBLicense = ((Users)usersDAO.findByUid(Long.parseLong(registerUser)).get(0)).getLicense();
		if(DBLicense.equals(inputLicense)){
			return true;
		}else{
			return false;
		}
		
	}

}
