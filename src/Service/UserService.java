package Service;

import DAO.UserDAO;
import entity.User;

// service - 完成用户管理、登录注册的业务逻辑
public class UserService {
    public boolean login(String username, String password) {
        UserDAO userDao = new UserDAO();
        User user = userDao.selectByName(username);
        if(user != null&& user.getPassword().equals(password)) {
                return true;
            }
        return false;
    }
    public void insert(String name,String password){
        UserDAO userDao = new UserDAO();
        userDao.insert(name, password);
    }
    public boolean selectuser(String name){
        UserDAO userDao = new UserDAO();
        return userDao.selectUser(name);
    }
}
