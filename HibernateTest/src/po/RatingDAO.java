package po;

import java.util.Date;
import java.util.List;
import java.util.Set;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;

/**
 * A data access object (DAO) providing persistence and search support for
 * Rating entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see po.Rating
 * @author MyEclipse Persistence Tools
 */

public class RatingDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory.getLog(RatingDAO.class);
	// property constants
	public static final String TARGET_ID = "targetId";
	public static final String TO_WHOM = "toWhom";
	public static final String FINISHED = "finished";

	public void save(Rating transientInstance) {
		log.debug("saving Rating instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Rating persistentInstance) {
		log.debug("deleting Rating instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Rating findById(java.lang.Long id) {
		log.debug("getting Rating instance with id: " + id);
		try {
			Rating instance = (Rating) getSession().get("po.Rating", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Rating instance) {
		log.debug("finding Rating instance by example");
		try {
			List results = getSession().createCriteria("po.Rating").add(
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
		log.debug("finding Rating instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Rating as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
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

	public List findAll() {
		log.debug("finding all Rating instances");
		try {
			String queryString = "from Rating";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Rating merge(Rating detachedInstance) {
		log.debug("merging Rating instance");
		try {
			Rating result = (Rating) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Rating instance) {
		log.debug("attaching dirty Rating instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Rating instance) {
		log.debug("attaching clean Rating instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}