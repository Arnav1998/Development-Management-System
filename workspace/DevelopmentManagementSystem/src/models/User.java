package models;

public class User {
	
	String name, password;
	
	public User (String name, String password) {
		
		this.name = name;
		this.password = password;
		
	}
	
	public String getName() {
		return this.name;
	}
	
	public String getPassword() {
		return this.password;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}

}
