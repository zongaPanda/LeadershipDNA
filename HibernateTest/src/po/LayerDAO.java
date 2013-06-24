package po;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;

/**
 * A data access object (DAO) providing persistence and search support for Layer
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see po.Layer
 * @author MyEclipse Persistence Tools
 */

public class LayerDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory.getLog(LayerDAO.class);
	// property constants
	public static final String LAYER_NAME = "layerName";
	public static final String MANAGER_ID = "managerId";

	public void save(Layer transientInstance) {
		log.debug("saving Layer instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Layer persistentInstance) {
		log.debug("deleting Layer instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Layer findById(java.lang.Integer id) {
		log.debug("getting Layer instance with id: " + id);
		try {
			Layer instance = (Layer) getSession().get("po.Layer", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Layer instance) {
		log.debug("finding Layer instance by example");
		try {
			List results = getSession().createCriteria("po.Layer").add(
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
		log.debug("finding Layer instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Layer as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByLayerName(Object layerName) {
		return findByProperty(LAYER_NAME, layerName);
	}

	public List findByManagerId(Object managerId) {
		return findByProperty(MANAGER_ID, managerId);
	}

	public List findAll() {
		log.debug("finding all Layer instances");
		try {
			String queryString = "from Layer";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Layer merge(Layer detachedInstance) {
		log.debug("merging Layer instance");
		try {
			Layer result = (Layer) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Layer instance) {
		log.debug("attaching dirty Layer instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Layer instance) {
		log.debug("attaching clean Layer instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}