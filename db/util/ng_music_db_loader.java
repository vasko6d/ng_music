//Import required packages
import java.sql.*;

public class ng_music_db_loader {
   // JDBC driver name and database URL
   static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
   static final String DB_URL = "jdbc:mysql://localhost/ng_music?useSSL=false";
   
   //  Database credentials
   static final String USER = "***";
   static final String PASS = "***";
   
   public static void main(String[] args) {
   Connection conn = null;
   Statement stmt = null;
   try{
      //Register JDBC driver
      Class.forName("com.mysql.jdbc.Driver");

      //Open a connection
      System.out.print("Connecting to database...");
      conn = DriverManager.getConnection(DB_URL,USER,PASS);
      System.out.println("done.");

      //declare statement, sql and file_loc variables to be reused in sql executions
      stmt = conn.createStatement();
      String sql;
      String file_loc;

      //ADD ng_users through local file ng_users.txt
      System.out.print("Creating statement to add ng_users...");
      file_loc = "'C:/Users/David/Desktop/NextGate/TakeHomeAssignment/resource/ng_users.txt'";
      sql = "LOAD DATA LOCAL INFILE " + file_loc + " INTO TABLE ng_users"
          + " FIELDS TERMINATED BY '|'"
          + " LINES TERMINATED BY '\r\n'"
          + " IGNORE 1 LINES"
          + " (@var1,@var2)"
          + " SET username = RTRIM(@var1), password = RTRIM(@var2);";
      stmt.execute(sql);
      System.out.println("done.");

      //ADD ng_singers throuhg local file ng_singers.txt
      System.out.print("Creating statement to add ng_singers...");
      file_loc = "'C:/Users/David/Desktop/NextGate/TakeHomeAssignment/resource/ng_singers.txt'";
      sql = "LOAD DATA LOCAL INFILE " + file_loc + " INTO TABLE ng_singers" 
          + " FIELDS TERMINATED BY '|'"
          + " LINES TERMINATED BY '\r\n'"
          + " IGNORE 1 LINES"
          + " (@var1,@var2,sex)"
          + " SET name = RTRIM(REPLACE(@var1,char(9),'')), dob = STR_TO_DATE( RTRIM( REPLACE( @var2,char(9),'')),'%Y%m%d');";
      stmt.execute(sql);
      System.out.println("done.");      

      //ADD ng_albums throuhg local file ng_singers.txt
      System.out.print("Creating statement to add ng_albums...");
      file_loc = "'C:/Users/David/Desktop/NextGate/TakeHomeAssignment/resource/ng_albums.txt'";
      sql = "LOAD DATA LOCAL INFILE " + file_loc + " INTO TABLE ng_albums"
          + " FIELDS TERMINATED BY '|'"
          + " LINES TERMINATED BY '\r\n'"
          + " IGNORE 1 LINES" 
          + " (@col1,@col2,@col3,@col4)"
          + " SET ng_singers_id = (SELECT ng_singers_id FROM ng_singers WHERE name = RTRIM(REPLACE(@col1,char(9),''))),"
          + "     album_name    = RTRIM(REPLACE(@col2,char(9),'')),"
          + "     release_year = RTRIM(REPLACE(@col3,char(9),'')),"
          + "     record_company = RTRIM(@col4);";
      stmt.execute(sql);
      System.out.println("done.");  

      //Clean-up environment
      stmt.close();
      conn.close();
      }

   //Handle errors for JDBC
   catch(SQLException se) {se.printStackTrace(); }

   //Handle errors for Class.forName
   catch(Exception e) {e.printStackTrace(); }

   //finally block used to close resources
   finally{
      try {if(stmt!=null) stmt.close();} catch(SQLException se2){/*ignored*/ }
      try {if(conn!=null) conn.close();} catch(SQLException se){ se.printStackTrace();}}//end finally
      
   System.out.println("ng_music_db_loader Main Complete.");
}//end main
}//end ng_music_db_loader
