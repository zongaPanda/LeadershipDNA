package po;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import SessionFactory.*;

public class RatingDAO {
	public static final String TARGET_ID = "targetId";
	public static final String TO_WHOM = "toWhom";
	public static final String FINISHED = "finished";
	
	public void save(Rating rating){
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.save(rating);
			tx.commit();
			
		} catch (Exception e) {
			// TODO: handle exception
			tx.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}	
	}
	
	public void delete(Rating rating){
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.delete(rating);
			tx.commit();
		} catch (Exception e) {
			// TODO: handle exception
			tx.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}	
	}
	
	public void newRating(long t,long r){
		Rating rating=new Rating();
		rating.setTargetId(t);
		rating.setToWhom(r);
		rating.setFinished(false);
		
		Date now=new Date();
		rating.setStartDate(now);
		
		Calendar cd = Calendar.getInstance();
		cd.setTime(new Date());
		int duration = 14;
		cd.add(Calendar.DATE, duration);
		Date newDate = cd.getTime();
		rating.setDueDate(newDate);
		
		save(rating);
		
	}
	
	public Rating findById(java.lang.Long id) {
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		try {
			Rating instance = (Rating) session.get("po.Rating", id);
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
			String queryString = "from Rating as model where model."+propertyName+"=?";
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
	
	public List findByTargetId(Object targetId) {
		return findByProperty(TARGET_ID, targetId);
	}

	public List findByToWhom(Object toWhom) {
		return findByProperty(TO_WHOM, toWhom);
	}

	public List findByFinished(Object finished) {
		return findByProperty(FINISHED, finished);
	}
	
	public List findAll(){
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		try{
			String queryString = "from Rating";
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
