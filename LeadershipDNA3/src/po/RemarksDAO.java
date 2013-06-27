package po;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import SessionFactory.*;

public class RemarksDAO {
	public static final String CONTENT = "content";
	public static final String IS_READ = "isRead";
	
	public void save(Remarks remark){
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.save(remark);
			tx.commit();
			
		} catch (Exception e) {
			// TODO: handle exception
			tx.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}	
	}
	
	public void delete(Remarks remark){
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.delete(remark);
			tx.commit();
		} catch (Exception e) {
			// TODO: handle exception
			tx.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}	
	}
	
	public Remarks findById(java.lang.Long id) {
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		try {
			Remarks instance = (Remarks) session.get("po.Remarks", id);
			return instance;
		} catch (RuntimeException re) {
			throw re;
		}finally{
			session.close();
		}
	}
	
	public List findByProperty(String propertyName, Object value) {
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		try {	
			String queryString = "from Remarks as model where model."+propertyName+"=?";
			Query queryObject = session.createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			// TODO: handle exception
			session.getTransaction().rollback();
			re.printStackTrace();	
			throw re;
		}finally{
			session.close();
		}
	}
	
	public List findByContent(Object content) {
		return findByProperty(CONTENT, content);
	}

	public List findByIsRead(Object isRead) {
		return findByProperty(IS_READ, isRead);
	}
	
	public List findAll(){
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		try{
			String queryString = "from Remarks";
			Query queryObject = session.createQuery(queryString);
			return queryObject.list();
		}catch(RuntimeException re){
			session.getTransaction().rollback();
			re.printStackTrace();
			throw re;
		}finally{
			session.close();
		}
	}

}
