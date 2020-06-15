package cn.itcast.itcaststore.dao;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;  
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.itcast.itcaststore.domain.Product;
import cn.itcast.itcaststore.domain.User;
import cn.itcast.itcaststore.utils.DataSourceUtils;
import java.sql.Timestamp;
public class UserDao {
	// 添加用户
	public void addUser(User user) throws SQLException {
		user.setRole("customer");
		String sql = "insert into user(name,password,sex,email,phone,address,activecode,role) values(?,?,?,?,?,?,?,?)";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		int row = runner.update(sql, user.getUsername(), user.getPassword(),
				user.getSex(), user.getEmail(), user.getPhone(),
				user.getAddress(), user.getActiveCode(),user.getRole());
		if (row == 0) {
			throw new RuntimeException();
		}
	}
	
	// 添加销售人员
	public void addSalesman(User user) throws SQLException {
		user.setRole("sales");
		String sql = "insert into user(name,password,sex,email,phone,address,activecode,role) values(?,?,?,?,?,?,?,?)";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		int row = runner.update(sql, user.getUsername(), user.getPassword(),
				user.getSex(), user.getEmail(), user.getPhone(),
				user.getAddress(), user.getActiveCode(),user.getRole());
		if (row == 0) {
			throw new RuntimeException();
		}
	}
	
	// 查找所有销售人员
	public List<User> listAllSalesman() throws SQLException {
		String sql = "select * from user where role=sales";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		return runner.query(sql, new BeanListHandler<User>(User.class));
	}
	
	//添加登录记录日志
	public void addloginlog(String username,String role,String ip_address) throws SQLException {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();//获取当前时间，Date型  
        String dateStr = dateFormat.format(date);
        String state = "login";
		String sql = "insert into log(name,type,time,role,ip_address) values(?,?,?,?,?)";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		int row = runner.update(sql, username, state, dateStr,role,ip_address);
		if (row == 0) {
			throw new RuntimeException();
		}
	}
	
	//添加登录记录日志
		public void addlogoutlog(String username,String role,String ip_address) throws SQLException {
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date = new Date();//获取当前时间，Date型  
	        String dateStr = dateFormat.format(date);
	        String state = "logout";
			String sql = "insert into log(name,type,time,role,ip_address) values(?,?,?,?,?)";
			QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
			int row = runner.update(sql, username, state, dateStr,role,ip_address);
			if (row == 0) {
				throw new RuntimeException();
			}
		}
	
	// 根据激活码查找用户
	public User findUserByActiveCode(String activeCode) throws SQLException {
		String sql = "select * from user where activecode=?";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		return runner.query(sql, new BeanHandler<User>(User.class), activeCode);

	}
	// 根据激活码查找用户
		public User findUserByID(String id) throws SQLException {
			String sql = "select * from user where id=?";
			QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
			return runner.query(sql, new BeanHandler<User>(User.class), id);

		}
		
	//根据用户名查找用户
	public User findUserByUsername(String username) throws SQLException {
		String sql="select * from user where name=?";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		return runner.query(sql, new BeanHandler<User>(User.class),username);
	}
		
	// 激活用戶
	public void activeUser(String activeCode) throws SQLException {
		String sql = "update user set state=? where activecode=?";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		runner.update(sql, 1, activeCode);
	}
	
	//根据用户名与密码查找用户
	public User findUserByUsernameAndPassword(String username, String password) throws SQLException {
		String sql="select * from user where name=? and password=?";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		return runner.query(sql, new BeanHandler<User>(User.class),username,password);
	}

	//查找目前最大的user的id
	public int findLatestID() throws SQLException {
		String sql="select * from user order by id asc";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		User usertemp = runner.query(sql, new BeanHandler<User>(User.class));
		System.out.println(usertemp.getId());
		return usertemp.getId();
	}
}
