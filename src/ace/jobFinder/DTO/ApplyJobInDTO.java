package ace.jobFinder.DTO;

import org.springframework.web.multipart.MultipartFile;

public class ApplyJobInDTO {
String name;
String email;
String website;
MultipartFile file;
String title;
String company;
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getCompany() {
	return company;
}
public void setCompany(String company) {
	this.company = company;
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
public String getWebsite() {
	return website;
}
public void setWebsite(String website) {
	this.website = website;
}
public MultipartFile getFile() {
	return file;
}
public void setFile(MultipartFile file) {
	this.file = file;
}
}
