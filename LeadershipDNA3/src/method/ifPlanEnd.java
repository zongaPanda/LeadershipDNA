package method;
import java.util.List;
import po.*;

public class ifPlanEnd {
	public static boolean ifplanend(Long sb){
		PlanDAO plandao = new PlanDAO();
		List plist = plandao.findByTargetId(sb);
		int plistLength = plist.size();
		if(plistLength==0){
			return true;
		}
		else{
			for( int i = 0 ; i < plistLength ; i++ ){
				Plan plan = (Plan)plist.get(i);
				if(plan.getIsApproved()&&!plan.getFinished()){
					return false;
				}
			}
			return true;
		}
	}
}
