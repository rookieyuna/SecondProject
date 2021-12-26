package board;

public class BoardDTO {
	private String num; 			// 번호
	private String id;				// 아이디
	private String title;			// 글제목
	private String content;			// 글내용
	private String postdate;		// 작성일
	private String ofile;			// 기존파일명
	private String sfile;			// 서버파일명
	private String downcount;		// 다운로드횟수
	private String visitcount;		// 조회수
	private String category;		// 게시판 카테고리
									/*
									 	CATEGORY
										 	공지사항 : notB
											프로그램 : proB
											자유게시판 : freeB
											사진게시판 : photoB
											정보게시판 : infoB
											직원자료실 : stafB
											보호자자료실 : guardB
									 */
	private String name;
	private String email;
	
	// getter & setter 생성
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
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
	public String getPostdate() {
		return postdate;
	}
	public void setPostdate(String postdate) {
		this.postdate = postdate;
	}
	public String getOfile() {
		return ofile;
	}
	public void setOfile(String ofile) {
		this.ofile = ofile;
	}
	public String getSfile() {
		return sfile;
	}
	public void setSfile(String sfile) {
		this.sfile = sfile;
	}
	public String getDowncount() {
		return downcount;
	}
	public void setDowncount(String downcount) {
		this.downcount = downcount;
	}
	public String getVisitcount() {
		return visitcount;
	}
	public void setVisitcount(String visitcount) {
		this.visitcount = visitcount;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
}
