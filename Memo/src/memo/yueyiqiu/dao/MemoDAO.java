package memo.yueyiqiu.dao;

import java.sql.ResultSet;
import java.util.*;

import memo.yueyiqiu.model.MemoForm;
import memo.yueyiqiu.tool.ConnDB;

public class MemoDAO {
	private ConnDB conn=null;
	
	public MemoDAO(){
		conn=new ConnDB();
	}
	
	public List<MemoForm> query(String name){
		List<MemoForm> list=new ArrayList<MemoForm>();
		String sql="select * from tb_memo where creator='"+name+"'";
		sql="select * from tb_memo";
		ResultSet rs=conn.executeQuery(sql);
		try{
			while(rs.next()){
				MemoForm f=new MemoForm();
				f.setId(rs.getInt(1));
				f.setTitle(rs.getString(2));
				f.setContent(rs.getString(3));
				f.setRemindTime(rs.getString(4));
				f.setRemindMode(rs.getInt(5));
				f.setCreator(rs.getString(6));
				f.setFlag(rs.getString(7));
				f.setIsRead(rs.getInt(8));
				list.add(f);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	public int del(int id){
		int result=0;
		
		try{
			String sql="delete from tb_memo where id='"+id+"'";
			result=conn.executeUpdate(sql);
		}
		catch(Exception e){
			System.out.println(e.getMessage());
			result=0;
		}
		conn.close();
		return result;
	}
}
