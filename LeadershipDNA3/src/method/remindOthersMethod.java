package method;
import java.util.List;

import po.*;

public class remindOthersMethod {
	public static boolean remindothers(String currentUser){
		try{
			RatingDAO ratingdao = new RatingDAO();
			List rlist = ratingdao.findByTargetId(Long.parseLong(currentUser));
			int rlistLength = rlist.size();
			if(rlistLength!=0){
				for( int i = 0 ; i < rlistLength ; i++ ){
					Rating rating = (Rating)rlist.get(i);
					System.out.println("remindOthersMethod rating.towhom = "+rating.getToWhom());
					if(!rating.getToWhom().equals(Long.parseLong(currentUser))&&!whatRole.ifManager(rating.getToWhom(), Long.parseLong(currentUser))&&rating.getFinished()==false&&rating.getVolid()==true){
						UsersDAO usersdao = new UsersDAO();
						List ulist = usersdao.findByUid(rating.getToWhom());
						int ulistLength = ulist.size();
						System.out.println("remindOthersMethod ulist.size = "+ulistLength);
						if(ulistLength!=0){
							Users user = (Users)usersdao.findByUid(rating.getToWhom()).get(0);
							String toName = jobnumberToName.jobnumtoname(rating.getToWhom());
							String targetName = jobnumberToName.jobnumtoname(Long.parseLong(currentUser));
							String email = user.getPasswd();
							String a="168chengyuxing@sina.com";
							String b=email;
							String c="remind";
							String d="Hello, " + toName+". Please perform a rating for "+targetName;
							System.out.println(a+'\n'+b+'\n'+c+'\n'+d+'\n');
							boolean send = false;
							int sendTimes = 0;
							while(sendTimes<5&&(!send)){
								send=servlet.MailSender.send(a, b, c, d);
								sendTimes++;
							}
						}
					}
				}
				return true;
			}else return false;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}
}
