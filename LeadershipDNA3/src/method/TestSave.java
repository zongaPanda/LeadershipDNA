package method;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;



import SessionFactory.HibernateSessionFactory;

import po.Employee;
import po.Layer;
import po.Questions;
import po.RatingDAO;
import po.Users;


public class TestSave {

	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		// TODO Auto-generated method stub

		/*
		findRelationship f=new findRelationship();
		List l=f.findOthers((long)123450);
		Iterator itr = l.iterator();
		while (itr.hasNext()) {
			
		    Employee nextObj = (Employee) itr.next();
		    System.out.println(nextObj.getEname());
		}*/
		RatingDAO rd=new RatingDAO();
		rd.newRating((long)123450,(long)123000);
		
	}

}
