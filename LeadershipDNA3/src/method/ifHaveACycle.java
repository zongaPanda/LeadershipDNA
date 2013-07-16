package method;
import java.util.List;
import po.*;

public class ifHaveACycle {
	public static boolean ifHaveACycle(String currentUser){
		boolean ret = false;
		/*RatingDAO ratingdao = new RatingDAO();
		List rlist = ratingdao.findByTargetId(Long.parseLong(currentUser));
		int rlistLength = rlist.size();
		for( int i = 0 ; i < rlistLength ; i++ ){
			if(((Rating)rlist.get(i)).getFinished()==false&&((Rating)rlist.get(i)).getVolid()==true){
				ret = true;
				return ret;
			}
		}
		
		
		PlanDAO plandao = new PlanDAO();
		List plist = plandao.findByTargetId(Long.parseLong(currentUser));
		int plistLength = plist.size();
		for(int i = 0 ; i < plistLength ; i++ ){
			if(!((Plan)plist.get(i)).getFinished()){
				ret = true;
				return ret;
			}
		}*/
		
		UsersDAO usersdao = new UsersDAO();
		List ulist = usersdao.findByUid(Long.parseLong(currentUser));
		if(ulist.size()!=0){
			if(((Users)ulist.get(0)).getIfincycle()){
				ret = true;
			}
			else{
				ret = false;
			}
		}
		
		return ret;
	
	}
	
	public static void main(String[] args){
		System.out.println(ifHaveACycle("123450"));
	}
		
}
