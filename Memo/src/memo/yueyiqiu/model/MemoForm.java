package memo.yueyiqiu.model;

public class MemoForm {
	private int id = 0;
	private String title = "";
	private String content = "";
	private String remindTime = "";
	private String creator = ""; 
	private String flag = "";
	private int remindMode = 0;
	private int isRead = 0;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRemindTime() {
		return remindTime;
	}
	public void setRemindTime(String remindTime) {
		this.remindTime = remindTime;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public int getRemindMode() {
		return remindMode;
	}
	public void setRemindMode(int remindMode) {
		this.remindMode = remindMode;
	}
	public int getIsRead() {
		return isRead;
	}
	public void setIsRead(int isRead) {
		this.isRead = isRead;
	}
	
	
	
}
