package entity;
//实体类-和数据库表一一对应
public class User {
    private String username;//String-varchar
    private String password;

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    @Override
    public String toString() {
        return "demo{" +
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
