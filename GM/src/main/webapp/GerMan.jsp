<%-- 
    Document   : GerMan
    Created on : 28/03/2023, 09:05:35 AM
    Author     : diana
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Gerente de Mantenimiento</h1>
        <form name="uno" action="asign.jsp" method="get" >
            <table border="1" width="600">
                <tr>
                    <th>Reporte</th>
                    <th>Nombre del caso</th>
                    <th>Estatus</th>
                    <th>Ingeniero</th> 
                    <th>Fecha de creación</th>
                </tr>
                <%
                    Connection connection = null;
                    Statement statement = null;
                    ResultSet resultSet = null;
                    
                    try{
                        Class.forName("com.mysql.jdbc.Driver");
                        connection=DriverManager.getConnection
                        ("jdbc:mysql://localhost:3306/elet?usuario=root&password=n0m3l0");
                        
                        statement = connection.createStatement();
                        resultSet = statement.executeQuery("select id, case_name,"
                                + "case_status, case_ing, creation_date *from tbl_cases");
                        while (resultSet.next()){
                            %>
                            <tr> 
                                <th><%Integer id=resultSet.getInt("Id");%></th>  
                                <th><%String case_name=resultSet.getString(2);%></th>
                                <th><%String case_status=resultSet.getString(3);%></th>
                                <th><%String case_ing=resultSet.getString(4);%></th>
                                <th><%String last =resultSet.getString(5);%></th>
                            </tr>
                           <%
                           
                               }
                            
                            statement.close();
                            resultSet.close();
                            connection.close();
                    }catch(Exception e){

}
                
                %>
            </table>
            
        </form>
    </body>
</html>
