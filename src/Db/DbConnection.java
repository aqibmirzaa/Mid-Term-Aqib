package Db;

import java.sql.*;

/**
 * Created by fawad.tariq on 9/26/2019.
 */
public class DbConnection {
    private String dbURL = "jdbc:mysql://localhost:3306/job";
    private String username = "root";
    private String password = "";
    private Connection connection;
    public DbConnection(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(dbURL,username,password);
            if(connection!=null){
                System.out.println("Success");
            }
        }catch (ClassNotFoundException e){
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void insertUserData(String name,String email,String password) {
        try {

            String sqlQuery = "INSERT INTO user(name,email,password) VALUES(?,?,?)";

            PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);

           // preparedStatement.setInt(1, id);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, password);

            int noOfRowsInserted = preparedStatement.executeUpdate();
            if (noOfRowsInserted > 0) {
                System.out.println(noOfRowsInserted + " rows inserted!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void insertJobData(String title,String description,String jobtype, String jobcity,int postedby) {
        try {

            String sqlQuery = "INSERT INTO job_table (title,description,jobtype, jobcity,postedby) VALUES(?,?,?,?,?)";

            PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);

            // preparedStatement.setInt(1, id);
            preparedStatement.setString(1, title);
            preparedStatement.setString(2, description);
            preparedStatement.setString(3, jobtype);
            preparedStatement.setString(4, jobcity);
            preparedStatement.setInt(5, postedby);

            int noOfRowsInserted = preparedStatement.executeUpdate();
            if (noOfRowsInserted > 0) {
                System.out.println(noOfRowsInserted + " rows inserted!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ResultSet displayUserRecords() {
        ResultSet resultSet = null;
        try {
            String sqlQuery = "SELECT * FROM user ";
            Statement statement = connection.createStatement();
            resultSet = statement.executeQuery(sqlQuery);


        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }

    public ResultSet displayJobRecords() {
        ResultSet resultSet = null;
        try {
            String sqlQuery = "SELECT * FROM job_table";
            Statement statement = connection.createStatement();
            resultSet = statement.executeQuery(sqlQuery);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }

    public int userLoginAuthentication(String email, String password) {
        try {
            String sqlQuery = "select email,password from user where  email=? and password=?";
            PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);

            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            ResultSet result = preparedStatement.executeQuery();
            int count = 0;

            while (result.next()) {
                count = result.getInt(1);
            }
            if (count > 0) {
                return 1;
            } else {
                return 0;
            }

        } catch (SQLException e) {
            System.out.println("exception occured");
            e.printStackTrace();
        }
        return 0;
    }

}