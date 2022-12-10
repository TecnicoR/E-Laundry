<%@ page import="com.elaundry.service.UserService" %>
<%@ page import="com.elaundry.service.OrderService" %>
<%@ page import="com.elaundry.entity.User" %>
<%@ page import="com.elaundry.enums.Role" %>
<%@ page import="com.elaundry.entity.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./home.css">
    <link rel="stylesheet" href="./nav.css">
    <title>Home</title>
</head>
<%
    response.setHeader("cache-control","no-cache,no-store,must-revalidate"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setHeader("Expires","0"); //proxy

    if(session.getAttribute("activeUser") == null){
        response.sendRedirect("login.jsp");
    }
    User user = (User) session.getAttribute("activeUser");
    final OrderService orderService = new OrderService();
    List<Order> orders = new ArrayList<>();
    if(user.getRole().equals(Role.USER)){
        orders = orderService.getAll(user.getId());
    }else{
        orders = orderService.getAll();
    }
%>
<body>
    <div class="nav">
        <jsp:include page="./navbar.jsp">
            <jsp:param name="userName" value="<%=user.getName()%>"/>
            <jsp:param name="userRole" value="<%=user.getRole().toString()%>"/>
        </jsp:include>
    </div>

    <div class="mainHome">
        <h1>All Orders</h1>
        <div class="content">
            <table>
                <thead>
                    <tr>
                        <th>
                            Name
                        </th>
                        <th>Price</th>
                        <th>Items</th>
                        <th>Date of order</th>
                        <th>Date of completion</th>
                        <th>status</th>
                        <th colspan="2">Action</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    for (Order order : orders) {
                %>
                    <tr>
                        <td>
                            <%=order.getUserName()%>
                        </td>
                        <td><%=order.getPrice()%></td>
                        <td><%=order.getItems().toString().replace("[", "").replace("]", "")%></td>
                        <td><%=order.getOrderDate()%></td>
                        <td><%=order.getCompletionDate()%></td>
                        <td><%=order.getStatus()%></td>
                        <td><a href="#">delete</a></td>
                        <td><a href="#">edit</a></td>
                    </tr>
                <%}%>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>