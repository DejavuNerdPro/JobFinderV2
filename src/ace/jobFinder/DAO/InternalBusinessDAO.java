package ace.jobFinder.DAO;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.mysql.cj.jdbc.Blob;

import ace.jobFinder.DTO.ApplyJobInDTO;
import ace.jobFinder.DTO.LoginInDTO;
import ace.jobFinder.DTO.PostJobInDTO;
import ace.jobFinder.DTO.UpdateJobInDTO;
import ace.jobFinder.Model.CvForm;
import ace.jobFinder.Model.Job;
import ace.jobFinder.Model.User;
import ace.jobFinder.Utility.DBUtility;

@Service("InternalBusinessLogic")
public class InternalBusinessDAO {

	Connection connection=DBUtility.getConnection();


	public InternalBusinessDAO(){}

	public void UserDataInsertion(User user){
		String query="insert into m_user(userId,name,email,password)values(?,?,?,?)";
		PreparedStatement statement=DBUtility.getPreparedStatement(connection, query);
		try {
			String userId=getMaxUserId();
			if(userId==null){
				userId="uid0001";
			}else{
				String prefix="uid";
				String stringLeading=userId.replace("uid", "");
				String stringNo=stringLeading.replace("0", "");
				int number=Integer.parseInt(stringNo);
				number++;
				String postfix=String.format("%04d", number);
				userId=prefix+postfix;
			}
			statement.setString(1,userId);
			statement.setString(2,user.getUsername());
			statement.setString(3,user.getEmail());
			statement.setString(4,user.getPassword());
			statement.executeUpdate();
			System.out.println("Insertion is successfully..");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e);
			System.out.println("Insertion Process failed..");
		}
	}

	public String getMaxUserId(){
		String query="select MAX(userId) from m_user";
		String userId=null;
		PreparedStatement statement=DBUtility.getPreparedStatement(connection,query);
		try{
			ResultSet result=DBUtility.getResult(statement);
			ResultSetMetaData columnName=(ResultSetMetaData) result.getMetaData();
			while(result.next()){
				userId=result.getString(columnName.getColumnName(1));
			}
			System.out.println("Maximium number is retrieved.");
		}catch(SQLException e){
			e.printStackTrace();
			System.out.println(e);
			System.out.println("Retrieving maximium number failed.");
		}
		return userId;
	}

	public List<User> getUserDataForLogin(LoginInDTO loginInDTO){
		String query="select * from m_user where email=? and password=?";
		PreparedStatement statement=DBUtility.getPreparedStatement(connection, query);
		User user=new User();
		List<User> list=new ArrayList<>();
		try{
			statement.setString(1, loginInDTO.getEmail());
			statement.setString(2, loginInDTO.getPassword());
			ResultSet result=DBUtility.getResult(statement);
			ResultSetMetaData columnName=(ResultSetMetaData)result.getMetaData();
			while(result.next()){
				user.setUserId(result.getString(columnName.getColumnName(1)));
				user.setUsername(result.getString(columnName.getColumnName(2)));
				user.setEmail(result.getString(columnName.getColumnName(3)));
				user.setPassword(result.getString(columnName.getColumnName(4)));
				list.add(user);
			}
			System.out.println("Retrieving login data passed.");
		}catch(SQLException e){
			e.printStackTrace();
			System.out.println(e);
			System.out.println("Retrieving login data failed.");
		}
		return list;
	}

	public int JobDataInsertion(PostJobInDTO postJobInDTO){
		String query="insert into t_job (jobId,title,location,type,salary,description,responsibility,qualification,vacancy,company,date_line)values(?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement statement=DBUtility.getPreparedStatement(connection, query);
		int flag=0;

		String jobId=getMaxJobId();
		if(jobId==null){
			jobId="jid0001";
		}else{
			String prefix="jid";
			String stringLeading=jobId.replace("jid", "");
			String stringNo=stringLeading.replace("0", "");
			int number=Integer.parseInt(stringNo);
			number++;
			String postfix=String.format("%04d", number);
			jobId=prefix+postfix;
		}
		try{
			statement.setString(1, jobId);
			statement.setString(2, postJobInDTO.getPosition());
			statement.setString(3,postJobInDTO.getAddress());
			statement.setString(4, postJobInDTO.getType());
			statement.setDouble(5, Double.parseDouble(postJobInDTO.getSalary()));
			statement.setString(6,postJobInDTO.getDescription());
			statement.setString(7, postJobInDTO.getResponsibility());
			statement.setString(8, postJobInDTO.getQualification());
			statement.setInt(9, 0);
			statement.setString(10,postJobInDTO.getCompanydetails());
			// Get the current time in milliseconds
	        long currentTimeMillis = System.currentTimeMillis();

	        // Create a Timestamp object for the current time
	        Timestamp currentTimestamp = new Timestamp(currentTimeMillis);

			statement.setTimestamp(11, currentTimestamp);
			flag=statement.executeUpdate();
			System.out.println("Job Data Insertion passed.");

		}catch(SQLException e){
			e.printStackTrace();
			System.out.println(e);
			System.out.println("Job Data Insertion failed.");
		}
		return flag;
	}

	public String getMaxJobId(){
		String query="select MAX(jobId) from t_job";
		String userId=null;
		PreparedStatement statement=DBUtility.getPreparedStatement(connection,query);
		try{
			ResultSet result=DBUtility.getResult(statement);
			ResultSetMetaData columnName=(ResultSetMetaData) result.getMetaData();
			while(result.next()){
				userId=result.getString(columnName.getColumnName(1));
			}
			System.out.println("Maximium number of job id is retrieved.");
		}catch(SQLException e){
			e.printStackTrace();
			System.out.println(e);
			System.out.println("Retrieving maximium number of job id failed.");
		}
		return userId;
	}

	public List<Job> getJobData(){
		String query="select * from t_job";
		PreparedStatement statement=DBUtility.getPreparedStatement(connection, query);

		List<Job> jobList=new ArrayList<>();
		try {
			ResultSet result=DBUtility.getResult(statement);
			ResultSetMetaData columnName=(ResultSetMetaData) result.getMetaData();
			while(result.next()){
				Job job=new Job();
				job.setJobId(result.getString(columnName.getColumnName(1)));
				job.setTitle(result.getString(columnName.getColumnName(2)));
				job.setLocation(result.getString(columnName.getColumnName(3)));
				job.setType(result.getString(columnName.getColumnName(4)));
				job.setSalary(result.getDouble(columnName.getColumnName(5)));
				job.setDescription(result.getString(columnName.getColumnName(6)));
				job.setResponsibility(result.getString(columnName.getColumnName(7)));
				job.setQualification(result.getString(columnName.getColumnName(8)));
				job.setVacancy(result.getInt(columnName.getColumnName(9)));
				job.setCompany(result.getString(columnName.getColumnName(10)));
				job.setDateLine(result.getTimestamp(columnName.getColumnName(11)));
				jobList.add(job);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e);
			System.out.println("Job Data retrieval failed.");
		}
		return jobList;
	}

	public int updateJob(UpdateJobInDTO job){
		String query="update t_job set title=?,location=?,type=?,salary=?,description=?,responsibility=?,qualification=?,company=? where jobId=?";
		PreparedStatement statement=DBUtility.getPreparedStatement(connection, query);
		int flag=0;
		try {
			statement.setString(1, job.getTitle());
			statement.setString(2,job.getLocation());
			statement.setString(3, job.getType());
			statement.setDouble(4, job.getSalary());
			statement.setString(5, job.getDescription());
			statement.setString(6, job.getResponsibility());
			statement.setString(7,job.getQualification());
			statement.setString(8, job.getCompany());
			statement.setString(9, job.getJobId());
			flag=statement.executeUpdate();
			System.out.println("Update job data passed.");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e);
			System.out.println("Update job data failed.");
		}
		return flag;
	}

	public int removeJob(String jobId){
		String query="delete from t_job where jobId=?";
		PreparedStatement statement=DBUtility.getPreparedStatement(connection, query);
		int flag=0;
		try {
			statement.setString(1, jobId);
			flag=statement.executeUpdate();
			System.out.println("Deletion a job passed.");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e);
			System.out.println("Deletion a job failed.");
		}
		return flag;
	}

	public int insertApplyJobData(ApplyJobInDTO form,InputStream file){
		String query="insert into t_cvform (data,name,email,website,position,company) values (?,?,?,?,?,?)";
		PreparedStatement statement=DBUtility.getPreparedStatement(connection, query);
		int flag=0;
		/*InputStream inputStream=new ByteArrayInputStream(file);*/
		try{
			statement.setBlob(1, file);
			statement.setString(2, form.getName());
			statement.setString(3, form.getEmail());
			statement.setString(4, form.getWebsite());
			statement.setString(5,form.getPosition());
			statement.setString(6,form.getCompany());
			flag=statement.executeUpdate();
			System.out.println("Apply job passed.");
		}catch(SQLException e){
			e.printStackTrace();
			System.out.println(e);
			System.out.println("Apply job insertion failed.");
		}
		return flag;
	}

	public List<CvForm> getApplyData(){
		String query="select * from t_cvform";
		PreparedStatement statement=DBUtility.getPreparedStatement(connection, query);
		List<CvForm> cvFormList=new ArrayList<>();
		try{
			ResultSet result=DBUtility.getResult(statement);
			ResultSetMetaData columnName=(ResultSetMetaData) result.getMetaData();
			while(result.next()){
				CvForm cvForm=new CvForm();
				cvForm.setId(result.getInt(columnName.getColumnName(1)));
				cvForm.setData(result.getBlob(columnName.getColumnName(2)));
				cvForm.setName(result.getString(columnName.getColumnName(3)));
				cvForm.setEmail(result.getString(columnName.getColumnName(4)));
				cvForm.setWebsite(result.getString(columnName.getColumnName(5)));
				cvForm.setPosition(result.getString(columnName.getColumnName(6)));
				cvForm.setCompany(result.getString(columnName.getColumnName(7)));
				cvFormList.add(cvForm);
			}
		}catch(SQLException e){
			e.printStackTrace();
			System.out.println(e);
			System.out.println("Apply Data retrieval Failed.");
		}
		return cvFormList;
	}
}
