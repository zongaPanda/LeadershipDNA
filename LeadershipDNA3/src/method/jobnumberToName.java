package method;
import po.*;

public class jobnumberToName {
	public static String jobnumtoname(Long jobnumber){
		EmployeeDAO employeedao = new EmployeeDAO();
		try{
			return employeedao.findById(jobnumber).getEname();
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
}
