package po;

import java.util.List;
import java.util.Set;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;

/**
 * A data access object (DAO) providing persistence and search support for Plan
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see po.Plan
 * @author MyEclipse Persistence Tools
 */

public class PlanDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory.getLog(PlanDAO.class);
	// property constants
	public static final String TARGET_ID = "targetId";
	public static final String IS_APPROVED = "isApproved";
	public static final String FINISHED = "finished";

	public void save(Plan transientInstance) {
		log.debug("saving Plan instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Plan persistentInstance) {
		log.debug("deleting Plan instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Plan findById(java.lang.Long id) {
		log.debug("getting Plan instance with id: " + id);
		try {
			Plan instance = (Plan) getSession().get("po.Plan", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Plan instance) {
		log.debug("finding Plan instance by example");
		try {
			List results = getSession().createCriteria("po.Plan").add(
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
		log.debug("finding Plan instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Plan as model where model."
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

	public List findByIsApproved(Object isApproved) {
		return findByProperty(IS_APPROVED, isApproved);
	}

	public List findByFinished(Object finished) {
		return findByProperty(FINISHED, finished);
	}

	public List findAll() {
		log.debug("finding all Plan instances");
		try {
			String queryString = "from Plan";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Plan merge(Plan detachedInstance) {
		log.debug("merging Plan instance");
		try {
			Plan result = (Plan) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Plan instance) {
		log.debug("attaching dirty Plan instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Plan instance) {
		log.debug("attaching clean Plan instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}