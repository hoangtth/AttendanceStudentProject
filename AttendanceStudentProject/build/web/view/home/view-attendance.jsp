
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <link href="css/all.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    </head>
    <body>
        <div class="w-75 m-md-auto" style="min-height: 1000px">
            <h1>Single activity Attendance</h1>
            <div style="display: inline">Attendance for ${lession.group.course.code} with lecture ${sessionScope.instructor.code}
                at ${lession.timeSlot.name} on ${day} <fmt:formatDate pattern="dd/MM/yyyy" value="${lession.date}" />
                ,Spring 2022 in room ${lession.room.name} at ${sessionScope.instructor.campus.name}
            </div>
            <%int count = 1;%>

            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">No</th>
                        <th scope="col">Group</th>
                        <th scope="col">Code</th>
                        <th scope="col">Name</th>
                        <th scope="col">Image</th>
                        <th scope="col">Status</th>
                        <th scope="col">Comment</th>
                        <th scope="col">Taker</th>
                        <th scope="col">Record Time</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${students}" var="S">
                        <tr>
                            <th scope="row"><%= count++%></th>
                            <td>${lession.group.name}</td>
                            <td>${S.code}</td>
                            <td>${S.displayName}</td>
                            <td><img width="100px" src="images/${S.imageUrl}" alt="image Student"/></td>
                                <c:if test="${S.student_Lession.status eq 'present'}">
                                <td class="text-success font-weight-bold">${S.student_Lession.status}</td>
                            </c:if>
                            <c:if test="${S.student_Lession.status eq 'absent'}">
                                <td class="text-warning font-weight-bold">${S.student_Lession.status}</td>
                            </c:if>
                            <td>${S.student_Lession.comment}</td>
                            <td>${lession.instructor.code}</td>
                            <td>${S.student_Lession.recordtime}</td>
                        </tr>    
                    </c:forEach>
                </tbody>
            </table>
            <form action="edit-attendance" method="GET">
            <input type="hidden" name="lid" value="${lession.id}" />
            <button type="submit" class="float-end btn bg-danger">Edit</button>
            </form>
            <a href="${sessionScope.schedulePage}" class="btn bg-success">Back</a>
        </div>
    </body>
</html>
