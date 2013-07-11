package po;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import SessionFactory.*;

public class UsersDAO {
	public static final String UID = "uid";
	public static final String PASSWD = "passwd";
	public static final String EMAIL = "email";
	public static final String LICENSE = "license";
	public static final String SEX = "sex";
	public static final String TELEPHONE = "telephone";
	public static final String ADDRESS = "address";
	public static final String QQ = "qq";
	public static final String MSN = "msn";
	public static final String EDUCATION = "education";
	public static final String IFINCYCLE = "ifincycle";
	
	
	public void save(Users user){
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.save(user);
			tx.commit();
			
		} catch (Exception e) {
			// TODO: handle exception
			tx.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}	
	}
	
	public void delete(Users user){
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.delete(user);
			tx.commit();
		} catch (Exception e) {
			// TODO: handle exception
			tx.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}	
	}
	
	public void update(Users user){
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.update(user);
			tx.commit();
		} catch (Exception e) {
			// TODO: handle exception
			tx.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}
	}
	
	public Users findById(java.lang.Long id) {
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		try {
			Users instance = (Users) session.get("po.Users", id);
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
			String queryString = "from Users as model where model."+propertyName+"=?";
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
	
	public List findByUid(Object uid) {
		return findByProperty(UID, uid);
	}

	public List findByPasswd(Object passwd) {
		return findByProperty(PASSWD, passwd);
	}

	public List findByEmail(Object email) {
		return findByProperty(EMAIL, email);
	}

	public List findByLicense(Object license) {
		return findByProperty(LICENSE, license);
	}
	
	public List findBySex(Object sex){
		return findByProperty(SEX, sex);
	}
	
	public List findByTelephone(Object telephone){
		return findByProperty(TELEPHONE, telephone);
	}
	
	public List findByAddress(Object address){
		return findByProperty(ADDRESS, address);
	}
	
	public List findByQq(Object qq){
		return findByProperty(QQ, qq);
	}
	
	public List findByMsn(Object msn){
		return findByProperty(MSN, msn);
	}
	
	public List findByEducation(Object education){
		return findByProperty(EDUCATION, education);
	}
	
	public List findByIfincycle(Object ifincycle) {
		return findByProperty(IFINCYCLE, ifincycle);
	}
	
	public List findAll(){
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		try{
			String queryString = "from Users";
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
