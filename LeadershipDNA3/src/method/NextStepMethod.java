package method;
import java.util.List;

import po.*;

public class NextStepMethod {
	public static void nextStepMethod(String currentUser){
		//boolean ret = false;
		RatingDAO ratingdao = new RatingDAO();
		List rlist = ratingdao.findByTargetId(Long.parseLong(currentUser));
		int rlistLength = rlist.size();
		System.out.println("rlist.size = "+rlistLength);
		for( int i=0 ; i < rlistLength ; i++ ){
			Rating rating = (Rating)rlist.get(i);
			if(rating.getFinished()==false&&rating.getVolid()==true){
				rating.setVolid(false);
				ratingdao.update(rating);
			}
		}
		//return ret;
	}
}
