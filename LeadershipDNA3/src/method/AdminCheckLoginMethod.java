package method;
import java.util.List;

import po.*;

public class AdminCheckLoginMethod {
	public static boolean adminchecklogin(String admin , String pwd){
		boolean ret = false;
		AdminDAO admindao = new AdminDAO();
		List alist = admindao.findByAdmin(admin);
		int alistLength = alist.size();
		if(alistLength==0){
			return false;
		}
		Admin ad = (Admin)alist.get(0);
		String password = ad.getPwd();
		if(pwd.equals(password)){
			return true;
		}
		else return false;
	}

}
