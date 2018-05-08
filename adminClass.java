import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import jxl.Sheet;
import jxl.Workbook;

public class Test
{
	private static void uploadXls(String fileName)
	{
		try 
		{
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","akd","haha");
			Statement st = con.createStatement();
			
			File file = new File(fileName);
			Workbook workbook = Workbook.getWorkbook(file);  
		    Sheet sh = workbook.getSheet(0);
		    
		    String q, op1, op2, op3, op4, str, ans, subId;
		    
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
		    			+ q+ "', '"+ op1+ "', '"+ op2+ "', '"+ op3+ "', '"+ op4+ "', "+ ans+ ");";		    	
		    	st.executeUpdate(str);
		    	
		    	
		    	String[] atomicSubId = subId.split("\\s+");		    	
		    	str = "select max(questionId) from questions";
		    	ResultSet rs = st.executeQuery(str);		    
		    	rs.next();
		    	int qId = rs.getInt(1);
		    	
		    	for(int i=0; i<atomicSubId.length; i++)
		    	{
		    		str = "insert into subjectquestionmapping"+ " (subId, questionId) values ("
		    				+ atomicSubId[i]+ ", "+ qId+ ");";
		    		st.executeUpdate(str);
		    	}
		    	
		    } 
			con.close();
		}
		catch (Exception e) 
			{e.printStackTrace();}
	}

	private static void deleteQuestion(int qId)
	{
		try 
		{
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","akd","haha");
			Statement st=con.createStatement();			
			String str;

			str = "delete from questions where questionId="+ qId;
		    st.executeUpdate(str);	    			
		    str = "delete from subjectquestionmapping where questionId="+ qId;
		    st.executeUpdate(str);
		    
			con.close();
		}
		catch (Exception e) 
			{e.printStackTrace();}
	}

	public static void main(String[] args) throws Exception 
	{			
		String file = "C:\\Users\\Training\\Desktop\\test.xls";
		int questionId = 32;
		//uploadXls(file);
		//deleteQuestion(questionId);
    }  
}
