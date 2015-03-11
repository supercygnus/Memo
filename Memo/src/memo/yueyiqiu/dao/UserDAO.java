package memo.yueyiqiu.dao;

import java.sql.ResultSet;

import memo.yueyiqiu.model.UserForm;
import memo.yueyiqiu.tool.ConnDB;

public class UserDAO {
	private ConnDB conn=null;
	
	public UserDAO(){
		conn=new ConnDB();
	}
	
	public int login(UserForm form){
		
		int flag=0;
		String sql="select * from tb_user where userName='"+form.getUsername()+"'";
		//sql="select * from tb_user";
		ResultSet rs=conn.executeQuery(sql);
		
		try{
			if(rs.next()){
				String pwd=form.getPassword();
				if(pwd.equals(rs.getString(3))){
					flag=1;
					rs.last();
					int rowNum=rs.getRow();
					rs.first();
					if(rowNum!=1){
						flag=0;
						System.out.println("獲取到的行數:"+rowNum);
					}
				}
				else{
					flag=0;
				}
			}
			else{
				flag=0;
			}
		}
		catch(Exception e){
			flag=0;
		}
		
		return flag;
		
	}
	
}
