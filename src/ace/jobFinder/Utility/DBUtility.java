package ace.jobFinder.Utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class DBUtility {
	public static DBUtility getInstatiate(){
		return new DBUtility();
	   }

	   public static Connection getConnection(){
		   Connection connect=null;
		   try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			try {
				connect=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobentry?autoReconnet=true&useSSL=false&allowPublicKeyRetrieval=true","root","root@mysql");
			} catch (SQLException e) {
				System.out.println("Error : "+e);
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("Connection Not Found.");
			e.printStackTrace();
		}
		   return connect;
	   }

	   public static PreparedStatement getPreparedStatement(Connection connection,String query){
		   PreparedStatement preparedStatement=null;
		   try {
			preparedStatement=connection.prepareStatement(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Statement Prepared.");
		}
		   return preparedStatement;
	   }

	   public static ResultSet getResult(PreparedStatement statement){
		   ResultSet result=null;
		   try {
			result=statement.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Statement Executed.");
		}
		   return result;
	   }

}
