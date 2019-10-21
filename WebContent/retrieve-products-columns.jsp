<%@page	language="java" 
		contentType="text/html; charset=ISO-8859-1"
    	pageEncoding="ISO-8859-1"
    	import = "java.sql.*"
    	import = " javax.servlet.*"
		import= " javax.servlet.http.*"
		import = "java.io.*"
		import ="java.util.*"
%>
<!-- Connection method and div generation -->
<%  
	String type_prod = request.getParameter("type_prod");
	String model_prod = request.getParameter("model_prod");
	
	if( (type_prod != null || type_prod.trim().equals("")) && model_prod == null ){ 
	  
		try
		{  
			Class.forName("com.mysql.cj.jdbc.Driver");  
<<<<<<< HEAD
			Connection con = DriverManager.getConnection("jdbc:mysql://root:root@localhost:3306/techlord_db?autoReconnect=true&useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC");  
=======
			Connection con = DriverManager.getConnection("jdbc:mysql://root:root@localhost:3306/PowerfulRig_db?autoReconnect=true&useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC");  
>>>>>>> branch 'master' of https://github.com/ant0x/Powerfulrig.git
			PreparedStatement ps = con.prepareStatement("SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '"+type_prod+"_component' ORDER BY ordinal_position");   
			ResultSet rs = ps.executeQuery();  
			
			while(rs.next())
			{  
				// gli ultimi 2 campi di ogni singola componente non devono essere re-inseriti
				if(rs.getString(1).contains("model") || rs.getString(1).contains("label"))
				{
					continue;
				}
				
				
				String format2 = "<div class=\"row form-group\"> \r\n" + 
						"<label for=\""+rs.getString(1)+"\" class=\"4 form-label\">"+rs.getString(1)+"</label> \r\n" +
						"<div class=\"col-xl-8\"> \r\n" +
							"<input type=\"text\" class=\"form-input\" name=\""+rs.getString(1)+"\"> \r\n" +
						"</div> \r\n" +
					"</div>";
						
				out.print(format2);
			}  
			con.close();  
			}catch(Exception e){e.printStackTrace();}
	}
%>
</body>

</html>