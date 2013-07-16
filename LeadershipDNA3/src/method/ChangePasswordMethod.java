package method;
import po.*;

public class ChangePasswordMethod {
	public static boolean changepwd(String currentUser, String old_password, String new_password){
		try{
			UsersDAO usersdao = new UsersDAO();
			String dbpassword = ((Users)usersdao.findByUid(Long.parseLong(currentUser)).get(0)).getPasswd();
			if(!dbpassword.equals(old_password)) return false;
			Users user = ((Users)usersdao.findByUid(Long.parseLong(currentUser)).get(0));
			user.setPasswd(new_password);
			usersdao.update(user);
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}
	
	public static void main(String[] args){
		UsersDAO usersdao = new UsersDAO();
		String dbpassword = ((Users)usersdao.findByUid(Long.parseLong("123450")).get(0)).getPasswd();
		System.out.println(dbpassword);
	}
}
