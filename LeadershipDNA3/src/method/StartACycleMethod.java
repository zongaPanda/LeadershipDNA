package method;
import java.util.List;
import po.*;

public class StartACycleMethod {
	public static boolean startacycle(String currentUser){
		try{
			UsersDAO usersdao = new UsersDAO();
			List ulist = usersdao.findByUid(Long.parseLong(currentUser));
			int ulistLength = ulist.size();
			if(ulistLength==0){
				return false;
			}
			for( int i = 0 ; i < ulistLength ; i++ ){
				Users user = (Users)ulist.get(i);
				if(user.getIfincycle()){
					return false;
				}
			}
			Users user = (Users)ulist.get(0);
			user.setIfincycle(true);
			usersdao.update(user);
			return true;
			
		}catch(Exception e){
			e.printStackTrace();
			return false ;
		}
	}
	
}
