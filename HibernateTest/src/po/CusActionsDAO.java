package po;

import java.util.List;
import java.util.Set;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;

/**
 * A data access object (DAO) providing persistence and search support for
 * CusActions entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see po.CusActions
 * @author MyEclipse Persistence Tools
 */

public class CusActionsDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory.getLog(CusActionsDAO.class);
	// property constants
	public static final String CONTENT = "content";
	public static final String LINK = "link";

	public void save(CusActions transientInstance) {
		log.debug("saving CusActions instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(CusActions persistentInstance) {
		log.debug("deleting CusActions instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public CusActions findById(java.lang.Long id) {
		log.debug("getting CusActions instance with id: " + id);
		try {
			CusActions instance = (CusActions) getSession().get(
					"po.CusActions", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(CusActions instance) {
		log.debug("finding CusActions instance by example");
		try {
			List results = getSession().createCriteria("po.CusActions").add(
					Example.create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding CusActions instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from CusActions as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByContent(Object content) {
		return findByProperty(CONTENT, content);
	}

	public List findByLink(Object link) {
		return findByProperty(LINK, link);
	}

	public List findAll() {
		log.debug("finding all CusActions instances");
		try {
			String queryString = "from CusActions";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public CusActions merge(CusActions detachedInstance) {
		log.debug("merging CusActions instance");
		try {
			CusActions result = (CusActions) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(CusActions instance) {
		log.debug("attaching dirty CusActions instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(CusActions instance) {
		log.debug("attaching clean CusActions instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}