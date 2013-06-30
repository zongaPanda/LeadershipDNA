package po;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import SessionFactory.*;

public class ChosenActionsDAO {
	public static final String SUPPORT = "support";
	public static final String FINISHED = "finished";
	
	public void save(ChosenActions chosenaction){
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.save(chosenaction);
			tx.commit();
			
		} catch (Exception e) {
			// TODO: handle exception
			tx.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}	
	}
	
	public void delete(ChosenActions chosenaction){
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.delete(chosenaction);
			tx.commit();
		} catch (Exception e) {
			// TODO: handle exception
			tx.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}	
	}
	
	public ChosenActions findById(java.lang.Long id) {
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		try {
			ChosenActions instance = (ChosenActions) session.get("po.ChosenActions", id);
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
			String queryString = "from ChosenActions as model where model."+propertyName+"=?";
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
	
	public List findBySupport(Object support) {
		return findByProperty(SUPPORT, support);
	}

	public List findByFinished(Object finished) {
		return findByProperty(FINISHED, finished);
	}
	
	public List findAll(){
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		try{
			String queryString = "from ChosenActions";
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