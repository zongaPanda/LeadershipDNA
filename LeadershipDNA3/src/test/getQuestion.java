package test;
import static org.junit.Assert.*;
import java.util.List;
import junit.framework.TestCase;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.junit.Test;
import SessionFactory.*;
import po.*;

public class getQuestion {
	
	@Test
	public static final void main(String[] args) {
		Session session =  HibernateSessionFactory.getSessionFactory().openSession();
		Transaction newTransaction = session.beginTransaction();
		try{
		//	Long a = (long) 123450;
			//Users user = new Users(a,"321","1433119561@qq.com","fdasfg");
			/*Users user = new Users();
			user.setUid(a);
			user.setPasswd("fdasfg");
			
			session.save(user);
			session.getTransaction().commit();*/
	/*		Questions q = new Questions();
			q.setQid(3);
			q.setContent("fdsafds");
			session.save(q);
			session.getTransaction().commit();
*/
			
			Query query = session.createQuery("from Questions ");
			List list = query.list();
			for(int i = 0 ; i < list.size() ; i++ ){
				System.out.println(((Questions)list.get(i)).getQid() + ":");
		        System.out.println(((Questions)list.get(i)).getContent());
			}
			
	/*		List questions =  (List) session.createQuery("from Questions as m order by m.qid asc").list();
			System.out.println( questions.size() + ":");
			for(Iterator iter = questions.iterator();iter.hasNext();){
				Questions question = (Questions) iter.next();
			    System.out.println(question.getContent());
			}
			*/	
			newTransaction.commit();
		
		}catch(Exception e){
			session.getTransaction().rollback();
			e.printStackTrace();
		}finally{
			session.close();
			
		}
	}
	
	public static List ret(){
		List list = null;
		Session session =  HibernateSessionFactory.getSessionFactory().openSession();
		Query query = session.createQuery("from Questions ");
		list = query.list();
		
		return list;
	}

}
