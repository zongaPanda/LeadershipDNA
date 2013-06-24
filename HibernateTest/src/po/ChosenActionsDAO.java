package po;

import java.util.Date;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;

/**
 * A data access object (DAO) providing persistence and search support for
 * ChosenActions entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see po.ChosenActions
 * @author MyEclipse Persistence Tools
 */

public class ChosenActionsDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory.getLog(ChosenActionsDAO.class);
	// property constants
	public static final String SUPPORT = "support";
	public static final String FINISHED = "finished";

	public void save(ChosenActions transientInstance) {
		log.debug("saving ChosenActions instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(ChosenActions persistentInstance) {
		log.debug("deleting ChosenActions instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public ChosenActions findById(java.lang.Long id) {
		log.debug("getting ChosenActions instance with id: " + id);
		try {
			ChosenActions instance = (ChosenActions) getSession().get(
					"po.ChosenActions", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(ChosenActions instance) {
		log.debug("finding ChosenActions instance by example");
		try {
			List results = getSession().createCriteria("po.ChosenActions").add(
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
		log.debug("finding ChosenActions instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from ChosenActions as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findBySupport(Object support) {
		return findByProperty(SUPPORT, support);
	}

	public List findByFinished(Object finished) {
		return findByProperty(FINISHED, finished);
	}

	public List findAll() {
		log.debug("finding all ChosenActions instances");
		try {
			String queryString = "from ChosenActions";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public ChosenActions merge(ChosenActions detachedInstance) {
		log.debug("merging ChosenActions instance");
		try {
			ChosenActions result = (ChosenActions) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(ChosenActions instance) {
		log.debug("attaching dirty ChosenActions instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(ChosenActions instance) {
		log.debug("attaching clean ChosenActions instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}