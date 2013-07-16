package method;
import java.util.List;
import po.*;

public class EndCycleMethod {
	public static boolean endCycle(String currentUser){
		try{
			PlanDAO plandao = new PlanDAO();
			List plist = plandao.findByTargetId(Long.parseLong(currentUser));
			int plistLength = plist.size();
			for( int i = 0 ; i < plistLength ; i++ ){
				if(((Plan)plist.get(i)).getIsApproved()&&!((Plan)plist.get(i)).getFinished()){
					Plan plan = ((Plan)plist.get(i));
					plan.setFinished(true);
					plandao.update(plan);
					break;
				}
			}
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}

}
