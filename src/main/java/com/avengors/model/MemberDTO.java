package com.avengors.model;

public class MemberDTO {
	
	
	private int idx;
	private String email, userpw, name, birth, gender, address, deleted, salt;
	
	@Override
    public String toString() {
        return "Member{" +
                "idx=" + idx +
                ", email='" + email + '\'' +
                ", userPw='" + "****" + '\'' +
                ", name='" + name + '\'' +
                ", birth='" + birth + '\'' +
                ", gender='" + gender + '\'' +
                ", address='" + address + '\'' +
                ", deleted=" + deleted + '\'' +
                ", salt=" + "****" +
                '}';
    }
	
	public MemberDTO() {
    }

    public MemberDTO(String email, String userpw, String name, String birth, String gender, String address, String salt) {
        this.email = email;
        this.userpw = userpw;
        this.name = name;
        this.birth = birth;
        this.gender = gender;
        this.address = address;
        this.salt = salt;
    }
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDeleted() {
		return deleted;
	}
	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	
	
	
	
}


