package method;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import SessionFactory.HibernateSessionFactory;
import po.EmployeeDAO;
import po.Layer;
import po.LayerDAO;
import po.Users;
import po.Employee;

public class findRelationship {
    LayerDAO layerDao=new LayerDAO();
    EmployeeDAO employeeDao=new EmployeeDAO();
	
	public Employee findManager(long uid){
		Employee ma=null;
		Employee em=employeeDao.findById(uid);
		Layer l=layerDao.findById(Integer.parseInt(em.getLayerId()));
		ma=employeeDao.findById(l.getManagerId());
		return ma;
	}
	
public List findDirects (long uid){

		List directs =new ArrayList();
		List l=layerDao.findByManagerId(uid);
		if(l.size()>0){
			List ems=employeeDao.findByLayerId(((Layer) l.get(0)).getLayerId().toString());
			return ems;
		}
		return directs;
	}
public List findOthers(long uid){
    List others=null;
	Session session=HibernateSessionFactory.getSession();
     
     Transaction tx=null;
     try{
    	// tx=session.beginTransaction();
    	 List directs=new ArrayList();
    	 String layerId;
    	 Employee em=(Employee)session.get(Employee.class, uid);
    	 Layer layer=(Layer)session.get(Layer.class, Integer.parseInt(em.getLayerId()));
    	 Employee ma=(Employee)session.get(Employee.class,  layer.getManagerId());
			
    	 if(findDirects(uid)!=null){
    		
    			List l=layerDao.findByManagerId(uid);
    			if(l.size()>0){
    				layerId=((Layer) l.get(0)).getLayerId().toString();
    				
    			
    		
			String queryString2 = "from Employee as model where model."
					+ "layerId" + "= ?";
			Query queryObject2 = session.createQuery(queryString2);
			queryObject2.setParameter(0, layerId);
			if(queryObject2==null){
				return others;
			}
			directs=queryObject2.list();
			}
    	 }
			String queryString3 = "from Employee ";
			Query queryObject3 = session.createQuery(queryString3);
			List all=queryObject3.list();
			all.remove(ma);
			all.remove(em);
			
			all.removeAll(directs);
			/*Iterator it=d.iterator();
			while(it.hasNext()){
				all.remove()
			}*/
			return all;
			
    	// tx.commit();
     }catch(RuntimeException e){
			if(tx!=null){
				tx.rollback();
			}
			throw e;
		}
}





public List findOthersDao(long uid){
	Session session=HibernateSessionFactory.getSession();
	List others=null;
	Employee ma=findManager(uid);
	List directs=findDirects(uid);
	//List all=employeeDao.findAll();
	String queryString3 = "from Employee ";
	Query queryObject3 = session.createQuery(queryString3);
	List all=queryObject3.list();
	System.out.println("all "+all.size());
	
	Employee em=(Employee)session.get(Employee.class, uid);
	System.out.println("em "+em.getEname());
	  boolean is=all.remove((Object)ma);System.out.println("isRemoved ma "+is);
	  all.remove(em);System.out.println("all "+all.size());
	  all.removeAll(directs);
	  return all;

	}


public List findDirects2(long uid){

        
		Session session=HibernateSessionFactory.getSession();

       //  Transaction tx=null;
         try{
        	// tx=session.beginTransaction();
        	 
        	 String queryString = "from Layer as model where model."
 					+ "managerId" + "= ?";
 			Query queryObject = session.createQuery(queryString);
 			queryObject.setParameter(0, uid);
 			if(queryObject.list()!=null){
 				
 			Layer l=(Layer) queryObject.list().get(0);
 			
 			String queryString2 = "from Employee as model where model."
 					+ "layerId" + "= ?";
 			Query queryObject2 = session.createQuery(queryString2);
 			queryObject2.setParameter(0, l.getLayerId().toString());
 			
 			return queryObject2.list();
 			}
 			else{
 				return null;
 			}
        	// tx.commit();
         }catch(RuntimeException e){
 		//	if(tx!=null){
 			//	tx.rollback();
 		//	}
 			throw e;
 		}finally{
 			session.close();
 		}
	}

}
