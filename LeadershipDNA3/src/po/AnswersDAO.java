package po;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import SessionFactory.*;

public class AnswersDAO {
	public static final String ANSWER = "answer";
	public static final String COMMENT = "comment";

	public void save(Answers answer) {
		Session session = HibernateSessionFactory.getSessionFactory()
				.openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.save(answer);
			tx.commit();

		} catch (Exception e) {
			// TODO: handle exception
			tx.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	public void delete(Answers answer) {
		Session session = HibernateSessionFactory.getSessionFactory()
				.openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.delete(answer);
			tx.commit();
		} catch (Exception e) {
			// TODO: handle exception
			tx.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}

	}

	public Answers findById(java.lang.Long id) {
		Session session = HibernateSessionFactory.getSessionFactory()
				.openSession();
		try {
			Answers instance = (Answers) session.get("po.Answers", id);
			return instance;
		} catch (RuntimeException re) {
			throw re;
		} finally {
			session.close();
		}
	}

	public List findByProperty(String propertyName, Object value) {
		Session session = HibernateSessionFactory.getSessionFactory()
				.openSession();
		try {
			String queryString = "from Answers as model where model."
					+ propertyName + "=?";
			Query queryObject = session.createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			// TODO: handle exception
			session.getTransaction().rollback();
			re.printStackTrace();
			throw re;
		} finally {
			session.close();
		}
	}

	public List findByAnswer(Object answer) {
		return findByProperty(ANSWER, answer);
	}

	public List findByComment(Object comment) {
		return findByProperty(COMMENT, comment);
	}

	public List findAll() {
		Session session = HibernateSessionFactory.getSessionFactory()
				.openSession();
		try {
			String queryString = "from Answers";
			Query queryObject = session.createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			session.getTransaction().rollback();
			re.printStackTrace();
			throw re;
		} finally {
			session.close();
		}
	}

	public static List ret() {
		List list = null;
		Session session = HibernateSessionFactory.getSessionFactory()
				.openSession();
		try {
			Query query = session.createQuery("from Questions ");
			list = query.list();

			return list;
		} catch (RuntimeException re) {
			session.getTransaction().rollback();
			re.printStackTrace();
			throw re;
		} finally {
			session.close();
		}

	}

}
