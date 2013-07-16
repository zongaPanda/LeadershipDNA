package method;

import java.util.Date;
import java.util.List;

import po.*;

public class UpdateInfoMethod {
	public static boolean updateinfo(String currentUser, String sex,
			String email, String telephone, String address, Date birthday,
			String qq, String education) {
		try {
			UsersDAO usersdao = new UsersDAO();
			List ulist = usersdao.findByUid(Long.parseLong(currentUser));
			int ulistLength = ulist.size();
			if (ulistLength == 0)
				return false;
			Users user = (Users) ulist.get(0);
			if (!sex.equals("-1")) {
				user.setSex(sex);
			}
			user.setEmail(email);
			user.setTelephone(telephone);
			user.setAddress(address);
			if (birthday != null) {
				user.setBirthday(birthday);
			}
			user.setQq(qq);
			if (!education.equals("-1")) {
				/*switch (education) {
				case "1":
					user.setEducation("doctor");
					break;
				case "2":
					user.setEducation("master");
					break;
				case "3":
					user.setEducation("university student");
					break;
				case "4":
					user.setEducation("community college");
					break;
				case "5":
					user.setEducation("polytechnic school");
					break;
				case "6":
					user.setEducation("vocational school");
					break;
				case "7":
					user.setEducation("senior high school");
					break;
				case "8":
					user.setEducation("junior high school");
					break;
				case "9":
					user.setEducation("primary school");
					break;

				default:
					user.setEducation("");
				}*/
				user.setEducation(education);

			}
			usersdao.update(user);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}
}
