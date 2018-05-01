import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import jxl.Sheet;
import jxl.Workbook;

public class Test
{

public static void main(String[] args) throws Exception 
{
	try 
	{
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
		Statement st=con.createStatement();
		
		File file = new File("D://input.xls");
		Workbook workbook = Workbook.getWorkbook(file);  
	    Sheet sh = workbook.getSheet(0);
	    
	    String q, op1, op2, op3, op4, str;
	    int ans, subId;
	    
	    for (int rows = 0; rows < sh.getRows(); rows++) 
	    {	        
	    	q = sh.getCell(0, rows).getContents();
	    	op1 = sh.getCell(1, rows).getContents();
	    	op2 = sh.getCell(2, rows).getContents();
	    	op3 = sh.getCell(3, rows).getContents();
	    	op4 = sh.getCell(4, rows).getContents();
	    	ans = sh.getCell(5, rows).getContents();
	    	subId = sh.getCell(6, rows).getContents();
	    	
	    	str = "insert into questions"+ " (questionName, option1, option2, option3, option4, answerNo, subId) values ('"
	    			+ q+ "', '"+ op1+ "', '"+ op2+ "', '"+ op3+ "', '"+ op4+ "', "+ ans+ ", "+ subId+ ");";
	    	//System.out.println(str);
	    	st.executeUpdate(str);	    	
	    } 
		con.close();
	}
	catch (IOException e) 
		{e.printStackTrace();}
    }  
}
