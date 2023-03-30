package chap03;

public class PersonDTO {
	
	private String name;  // 웹은 무조건 string 타입으로 설정되기 때문에 
	private String school;
	private String color;
	private String[] food;
	
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String[] getFood() {
		return food;
	}
	public void setFood(String[] food) {
		this.food = food;
	}
	
	/////////////////////////////////////////////////////////////
	
	public String getStrFoodes() {
		if(food != null)
		{
			return String.join(",", food);   // 배열을 문자열로 합침 
		}
		else {   // null 일때는
			return "";
		}
	}
	
	
}
