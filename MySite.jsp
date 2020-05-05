<%@ page import = "java.io.*,java.util.*,java.sql.*" %>
<html>
    <head>
        <title>Directory of Parks</title>
        <style>
        table, th, td {
            border: 1px solid black;
        }
        </style>
    </head>
    <body>
        <h1>Welcome to the directory!</h1>

        <table style="width:100%">
            <tr>
                <th>Park Name</th>
                <th>Country</th>
                <th>Province/state</th>
                <th>Activities</th>
                <th>Links</th>
            </tr>

            <%
            Class.forName("org.postgresql.Driver");
            Connection c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/Parks", "postgres", "Happy2004");
            Statement s = c.createStatement();
            ResultSet rs = s.executeQuery("SELECT park_name, park_country, park_state, park_activities, park_links FROM parks");
            %>

	    <%! String url = ""; %>
            <% while (rs.next()) { %>
                <tr>
                    <td>
                        <%= rs.getString("park_name") %>
                    </td>
                    <td>
                        <%= rs.getString("park_country") %>
                    </td>
                    <td>
                        <%= rs.getString("park_state") %>
                    </td>
                    <td>
                        <%= rs.getString("park_activities") %>
                    </td>
                    <% url = rs.getString("park_links"); %>
                    <td>
                        <a href='<%=url%>' target='_blank'><%=url%></a>
                    </td>
                </tr>
            <% } %>
            <% s.close();
            c.close();
            rs.close(); %>
        </table>

        <a href="MySiteAdmin.jsp">Click here to add new park</a>
    </body>
</html>
