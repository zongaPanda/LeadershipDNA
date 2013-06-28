package method;

import java.util.Random;

public class getLicense {
	public static String getlicense(){
		Random rd = new Random();
		int ret;
		String str = "";
		do{
			ret = (rd.nextInt(36));
			if(ret<10&&ret>=0){
				ret += 48;
			}else if(ret>=10&&ret<36){
				ret += 87;
			}
			char ch = (char)ret;
			str += Character.toString(ch);
		}while(str.length()<10);
		return str;
	}

}
