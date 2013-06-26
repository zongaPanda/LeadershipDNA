package test;
import static org.junit.Assert.*;

import java.util.List;

import junit.framework.TestCase;

import org.hibernate.Query;
import org.hibernate.Session;
import org.junit.Test;
import SessionFactory.*;
import po.*;

public class test {
	
	@Test
	public static final void main(String[] args) {
		Session session =  HibernateSessionFactory.getSessionFactory().openSession();
		session.beginTransaction();
		try{
			Long a = (long) 123450;
			//Users user = new Users(a,"321","1433119561@qq.com","fdasfg");
			/*Users user = new Users();
			user.setUid(a);
			user.setPasswd("fdasfg");
			
			session.save(user);
			session.getTransaction().commit();*/
			/*Questions q = new Questions();
			q.setQid(3);
			q.setContent("fdsafds");
			session.save(q);
			session.getTransaction().commit();*/
			/*String queryString = "from Questions as model where model."+ "content" + "= ?";
			Query queryObject = session.createQuery(queryString);
			queryObject.setParameter(0, "fdsafds");
			List list = queryObject.list();*/
			QuestionsDAO questionsdao = new QuestionsDAO();
			List list = questionsdao.findByContent("fdsafds");
			int i=0;
			for(i=0;i<list.size();i++){
				System.out.println(((Questions)list.get(i)).getQid());
				System.out.println(((Questions)list.get(i)).getContent());
			}
			
			
					
			
			
			
			
		}catch(Exception e){
			session.getTransaction().rollback();
			e.printStackTrace();
		}finally{
			session.close();
			
		}
	}

}
