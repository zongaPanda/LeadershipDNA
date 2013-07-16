package method;
import po.*;

public class whatRole {
	public static boolean ifManager(Long myself, Long other){
		EmployeeDAO employeedao = new EmployeeDAO();
		String otherLayer = employeedao.findById(other).getLayerId();
		LayerDAO layerdao = new LayerDAO();
		Long otherManager = layerdao.findById(Integer.parseInt(otherLayer)).getManagerId();
		if(myself.equals(otherManager)) return true;
		else return false;
	}
	
	public static void main(String[] args){
		System.out.println(ifManager(Long.parseLong("123450"),Long.parseLong("123452")));
		System.out.println(jobnumberToName.jobnumtoname(Long.parseLong("123452")));
		System.out.println(options.ifHaveAReport(Long.parseLong("123452")));
	}
}
