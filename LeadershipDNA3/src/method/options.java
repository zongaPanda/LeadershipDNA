package method;
import java.util.List;

import po.*;

public class options {
	public static int whichStep(String currentUser){
		int step = -1;
		
		//step1
		if(!ifHaveACycle.ifHaveACycle(currentUser)){
			step = 1 ; 
			return step;
		}
		RatingDAO ratingdao = new RatingDAO();
		List rlist = ratingdao.findByTargetId(Long.parseLong(currentUser));
		int rlistLength = rlist.size();
		//System.out.println("rlist.size()="+rlistLength);
		
		//step2
		for( int i = 0 ; i < rlistLength ; i++ ){
			if(((Rating)rlist.get(i)).getToWhom()==Long.parseLong(currentUser)){
				if(((Rating)rlist.get(i)).getFinished()==false&&((Rating)rlist.get(i)).getVolid()==true){
					step = 2;
					break;
					//System.out.println("hello");
					//return step;
				}
			}
		}
		
		//step3
		for( int i = 0 ; i < rlistLength ; i++ ){
			if(((Rating)rlist.get(i)).getToWhom()!=Long.parseLong(currentUser)){
				if(((Rating)rlist.get(i)).getFinished()==false&&((Rating)rlist.get(i)).getVolid()==true){
					if(step==2){step=23;}
					else{step=3;}
					break;
					//System.out.println("hello");
					//return step;
				}
			}
		}
		
		//step4
		if(step==3){
			boolean b = true;
			String layerID;
			EmployeeDAO employeedao = new EmployeeDAO();
			layerID = employeedao.findById(Long.parseLong(currentUser)).getLayerId();
			//System.out.println("layerID:"+layerID);
			Long managerID ;
			LayerDAO layerdao = new LayerDAO();
			managerID = layerdao.findById(Integer.parseInt(layerID)).getManagerId();
			//System.out.println("managerID:"+managerID);
			int num = 0 ;
			for( int i = 0 ; i < rlistLength ; i++ ){
				//System.out.println("((Rating)rlist.get("+i+")).getToWhom()="+((Rating)rlist.get(i)).getToWhom());
				if(((Rating)rlist.get(i)).getToWhom()==Long.parseLong(currentUser)){
					if(((Rating)rlist.get(i)).getFinished()==false&&((Rating)rlist.get(i)).getVolid()==true){
						//System.out.println("hfdsfdsfdsfello");
						b = false;
						break;
					}
				}
				else if(((Rating)rlist.get(i)).getToWhom().equals(managerID)){
					//System.out.println("((Rating)rlist.get(i)).getToWhom()="+((Rating)rlist.get(i)).getToWhom());
					if(((Rating)rlist.get(i)).getFinished()==false&&((Rating)rlist.get(i)).getVolid()==true){
						b = false;
						break;
					}
				}else{
					num++;
				}
			}
			if(b==true&&num>0){step=34;}
			return step;
		}else if(step==2||step==23){
			return step;
		}
		
		//step5
		//step6.7
		PlanDAO plandao = new PlanDAO();
		List plist = plandao.findByTargetId(Long.parseLong(currentUser));
		//Plan plan = new Plan();
		int plistLength = plist.size();
		int pnum = 0;
		for( int i = 0 ; i < plistLength ; i++ ){
			if(((Plan)plist.get(i)).getIsApproved()==false&&((Plan)plist.get(i)).getFinished()==false&&((Plan)plist.get(i)).getIsConfirmed()==false){
				//plan = (Plan)plist.get(i);
				pnum++;
				step = 67 ;
				return step;
				//break;
			}
		}
		
		if(pnum==0) {
			step = 10;
			return step;
		}
		/*Long pid = plan.getPid();
		ChosenActionsDAO chosenactiondao = new ChosenActionsDAO();
		List alist = chosenactiondao.findAll();
		int anum = 0;
		for( int i = 0 ; i < alist.size() ; i++ ){
			if(((ChosenActions)alist.get(i)).getPlan().getPid().equals(pid)&&((ChosenActions)alist.get(i)).getPlan().getIsApproved()==false&&((ChosenActions)alist.get(i)).getPlan().getFinished()==false){
				anum++;
			}
		}
		if(anum==0){
			step = 6 ;
			return step;
		}
		
		int notApprovedNum = 0;
		for( int i = 0 ; i < alist.size() ; i++ ){
			if(((ChosenActions)alist.get(i)).getPlan().getPid().equals(pid)&&((ChosenActions)alist.get(i)).getPlan().getIsApproved()==false&&((ChosenActions)alist.get(i)).getPlan().getFinished()==false){
				anum++;
			}
		}*/
		
		//step 8
		for( int i = 0 ; i < plistLength ; i++ ){
			if(((Plan)plist.get(i)).getIsApproved()==true&&((Plan)plist.get(i)).getFinished()==false){
				//plan = (Plan)plist.get(i);
				step = 8 ;
				return step;
				//break;
			}
		}
		
		step = 9;
		
	
		return step;
	}
	
	public static boolean ifOptionEnabled(int step, int optionNum){
		boolean ret = true;
		return ret;
		
	}
	
	public static int OneToFive(int step){
		switch(step){
		case -1:
			return 0;
		case 1:
			return 1;
		case 2:
			return 2;
		case 23:
			return 2;
		case 3:
			return 2;
		case 34:
			return 2;
		case 67:
			return 3;
		case 8:
			return 4;
		case 9:
			return 5;
		case 10:
			return 3;
		default :
			return 0;
		}
		
	}
	
	public static boolean ifHaveAReport(Long sb){
		int step = whichStep(Long.toString(sb));
		if(step==67||step==8||step==9||step==10) return true;
		else return false;
		
	}
	
	public static boolean ifApproved(Long sb){
		PlanDAO plandao = new PlanDAO();
		List plist = plandao.findByTargetId(sb);
		int plistLength = plist.size();
		if(plistLength==0){
			return true;
		}else{
			for( int i = 0 ; i < plistLength ; i++ ){
				Plan plan = (Plan)plist.get(i);
				if(!plan.getFinished()&&!plan.getIsApproved()){
					return false;
				}
			}
			return true;
		}
	}
	
	public static void main(String[] args){
		System.out.println(whichStep("123450"));
	
	}
	
	
	
	
}
