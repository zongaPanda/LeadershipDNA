package po;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import SessionFactory.*;

public class LayerDAO {
	public static final String LAYER_NAME = "layerName";
	public static final String MANAGER_ID = "managerId";
	
	public void save(Layer layer){
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.save(layer);
			tx.commit();
			
		} catch (Exception e) {
			// TODO: handle exception
			tx.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}	
	}
	
	public void delete(Layer layer){
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.delete(layer);
			tx.commit();
		} catch (Exception e) {
			// TODO: handle exception
			tx.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}	
	}
	
	public Layer findById(java.lang.Long id) {
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		try {
			Layer instance = (Layer) session.get("po.Layer", id);
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
			String queryString = "from Layer as model where model."+propertyName+"=?";
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
	
	public List findByLayerName(Object layerName) {
		return findByProperty(LAYER_NAME, layerName);
	}

	public List findByManagerId(Object managerId) {
		return findByProperty(MANAGER_ID, managerId);
	}
	
	public List findAll(){
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		try{
			String queryString = "from Layer";
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
