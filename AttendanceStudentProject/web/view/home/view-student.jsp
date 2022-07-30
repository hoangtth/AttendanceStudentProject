
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Student</title>
    </head>
    <body>
        <style>
            table{
                display:inline-table;
            }
            .active{
                text-decoration: none;
                font-size: large;
                color: black;
            }
        </style>
        <table class="table table-borderless">
            <thead>
                <tr>
                    <th scope="col">Campus</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td style="font-size: large;">${requestScope.campus.name}</td>
                </tr>
            </tbody>
        </table>
        <table class="table table-borderless">
            <thead>
                <tr>
                    <th scope="col">Group</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.grs}" var="gr">
                    <tr>
                        <td><a class="${gid == gr.id ?"active":""}" href="view-student?gid=${gr.id}">${gr.name}</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <%int count = 1;%>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">No</th>
                    <th scope="col">Code</th>
                    <th scope="col">Name</th>
                    <th scope="col">Image</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${students}" var="S">
                    <tr>
                        <th scope="row"><%= count++%></th>
                        <td>${S.code}</td>
                        <td>${S.displayName}</td>
                        <td><img width="100px" src="images/${S.imageUrl}" alt="image Student"/></td>
                    </tr>    
                </c:forEach>
            </tbody>
        </table>
        <script type="text/javascript">
        </script>
    </body>
</html>
