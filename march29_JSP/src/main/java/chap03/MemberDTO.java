package chap03;

import java.util.Calendar;

public class MemberDTO {

	private String name;   // 성명
	private String jubun;  // 주민번호  "9603291" "9603292"   "0103083" "0103084"
	
	
	
	
	// 기본 생성자
	public MemberDTO() {}
	// 기본생성자가 없다면 TTP 상태 500 – 내부 서버 오류 오류 발생 
	
	
	
	// 파라미터가 있는 생성자 
	public MemberDTO(String name, String jubun) {
		super();
		this.name = name;
		this.jubun = jubun;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getJubun() {
		return jubun;
	}

	public void setJubun(String jubun) {
		this.jubun = jubun;
	}
	
	
	///////////////////////////////////////////////////////////////
	
	// 1. 성별을 알아오는 메소드 생성하기 
	public String getGender() {
		
		if(jubun != null) {
			
			String n =jubun.substring(6, 7);   // 6번째 부터 7번째 앞까지 추출 
			
			if("1".equals(n) || "3".equals(n)) {
				return "남";
			}
			else if ("2".equals(n) || "4".equals(n)) {
				return "여";
			}
			else {
				return "";
			}
			
		}
		else {				// 주번이 null이면
			return "";
			
		}
		
	} // end of public String getGender() {
	
	
	// 2. 나이를 알아오는 메소드 생성하기
	
	public int getAge() {
		
		if(jubun != null) {
			
			String n =jubun.substring(6, 7);   // 6번째 부터 7번째 앞까지 추출 
			
			// 현재 연도를 알아오자 
			Calendar now = Calendar.getInstance();   // 현재 날짜와 시간을 얻어온다.
			int currentYear = now.get(Calendar.YEAR);  // 현재 년도를 알아온다.
			
			if("1".equals(n) || "2".equals(n)) {     /// 1900년대 생
				return currentYear - (1900 + Integer.parseInt(jubun.substring(0, 2))) +1 ;
			}
			else if ("3".equals(n) || "4".equals(n)) {  // 2000년대 생
				return currentYear - (2000 + Integer.parseInt(jubun.substring(0, 2))) + 1 ;
			}
			else {
				return 0;
			}	
		}
		else {				// 주번이 null이면
			return 0;
			
		}
		
	} // end of public int getAge() {
	
	
}
