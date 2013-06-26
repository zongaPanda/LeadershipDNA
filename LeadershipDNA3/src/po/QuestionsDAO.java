package po;
import java.util.List;
import java.util.Set;

import javax.servlet.jsp.tagext.TryCatchFinally;
//import org.apache.commons.logging.Log;
//import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Example;
import SessionFactory.*;


public class QuestionsDAO {
	private static final String CONTENT = "content";
	
	public void save(Questions question){
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		Transaction tx = null;
		try {
			//tx = session.beginTransaction();
			session.save(question);
			tx.commit();
			
		} catch (Exception e) {
			// TODO: handle exception
			tx.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}	
	}
	
	public List findByProperty(String propertyName, Object value) {
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		Transaction tx = null;	
		try {	
			String queryString = "from Questions as model where model."+propertyName+"=?";
			Query queryObject = session.createQuery(queryString);
			queryObject.setParameter(0, value);
			//tx.commit();
			return queryObject.list();
		} catch (RuntimeException re) {
			// TODO: handle exception
			tx.rollback();
			re.printStackTrace();	
			throw re;
		}finally{
			session.close();
		}
	}
	
	public List findByContent(Object content){
		return findByProperty(CONTENT, content);
	}
	
	
	

}
