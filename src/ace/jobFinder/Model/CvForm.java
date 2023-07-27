package ace.jobFinder.Model;

import java.sql.Blob;

public class CvForm {
int id;
Blob data;
String name;
String email;
String website;
String position;
String company;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public Blob getData() {
	return data;
}
public void setData(Blob data) {
	this.data = data;
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
public String getPosition() {
	return position;
}
public void setPosition(String position) {
	this.position = position;
}
public String getCompany() {
	return company;
}
public void setCompany(String company) {
	this.company = company;
}
}
