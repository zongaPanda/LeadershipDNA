package method;
import po.*;

public class StartAPlanMethod {
	public static boolean startAPlan(String currentUser){
		try{
			PlanDAO plandao = new PlanDAO();
			Plan plan = new Plan();
			plan.setTargetId(Long.parseLong(currentUser));
			plan.setIsApproved(false);
			plan.setFinished(false);
			plan.setIsApproved(false);
			plandao.save(plan);
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}
}
