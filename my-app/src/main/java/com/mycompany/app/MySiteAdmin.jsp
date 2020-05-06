<%@ page import = "java.io.*,java.util.*,java.sql.*" %>

<html>
    <head>
        <title>Add to Directory</title>
    </head>
    <body>
        <h1>Welcome to the directory!</h1>
        <p>Enter new park information: </p>

        <form action="MySiteAdmin.jsp">
            <label for="name">Park name:</label> <br/>
            <input type="text" id="name" name="park_name"> <br/>

            <label for="country">Country:</label> <br/>
            <input type="text" id="country" name="park_country"> <br/>

            <label for="state">Province/state:</label> <br/>
            <input type="text" id="state" name="park_state"> <br/>

            <label for="activities">Activities to do:</label> <br/>
            <input type="text" id="activities" name="park_activities"> <br/>

            <label for="links">Link:</label> <br/>
            <input type="text" id="links" name="park_links"> <br/>
            
            <label for="pass">Please enter the admin password:</label> <br/>
            <input type="password" id="pass" name="password"> <br/>

            <input type="submit" value="Submit entry"> <br/>
        </form>
        <a href="MySite.jsp"> Return to directory </a>

        <%
        String parkName = request.getParameter("park_name");
        String parkCountry = request.getParameter("park_country");
        String parkState = request.getParameter("park_state");
        String parkActivities = request.getParameter("park_activities");
        String parkLinks = request.getParameter("park_links");
        String password = request.getParameter("password");
        if (parkName != null && !parkName.equals("") && parkCountry != null && !parkCountry.equals("") && parkState != null && !parkState.equals("") && parkActivities != null && parkLinks != null && password.equals("Happy2004!")) {
            Class.forName("org.postgresql.Driver");
            Connection c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/Parks", "postgres", "Happy2004");
            Statement s = c.createStatement();
            s.executeUpdate("INSERT INTO parks (park_name, park_country, park_state, park_activities, park_links) " +
                            "VALUES ('" + parkName + "', '" + parkCountry + "', '" + parkState + "', '" + parkActivities + "', '" + parkLinks + "')" );
            out.println("Updated the database!");
            
            s.close();
            c.close();
        }
        %>
    </body>
</html>
