package memo.yueyiqiu.tool;

public class StringUtil {
	
	public String toBIG5(String stringvalue){
		String returnstring=null;
		try{
		if(stringvalue==null)
		{
			returnstring="";
		}
		else
		{
			returnstring=new String(stringvalue.getBytes("ISO-8859-1"),"BIG5");
			}
		}
		catch(Exception e){
			returnstring="";
		}
		return returnstring;
	}
	
	public String formatNO(int str,int length){
			String returnStr="";
			Integer input=new Integer(str);
			returnStr=String.format("%0"+length+"d", input);
			return returnStr;
	}
	
}
