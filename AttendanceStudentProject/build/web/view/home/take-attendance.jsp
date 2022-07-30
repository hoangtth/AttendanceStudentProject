<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
        <link href="css/take-attendance.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>


        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title text-uppercase mb-0">Take attendance</h5>
                        </div>
                        <div class="table-responsive">
                           <%int count = 1;%>
                            <form action="take-attendance" method="POST">
                                <table class="table no-wrap user-table mb-0">
                                    <thead>
                                        <tr>
                                            <th scope="col" class="border-0 text-uppercase font-medium pl-4">#</th>
                                            <th scope="col" class="border-0 text-uppercase font-medium">Name</th>
                                            <th scope="col" class="border-0 text-uppercase font-medium">Group</th>
                                            <th scope="col" class="border-0 text-uppercase font-medium">Status</th>
                                            <th scope="col" class="border-0 text-uppercase font-medium">Comment</th>
                                            <th scope="col" class="border-0 text-uppercase font-medium">Image</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${students}" var="S">                                        
                                            <tr>
                                        
                                                <td class="pl-4"><%= count++%></td>
                                                <td>
                                                    <input type="hidden" name="lid" value="${lid}"  />
                                                    <h5 class="font-medium mb-0">${S.displayName}</h5>
                                                    <span class="text-muted">${S.code}</span>
                                                </td>
                                                <td>
                                                    <span class="text-muted">${lession.group.name}</span><br>
                                                </td>
                                                <td>
                                                    <fieldset>
                                                        <label>
                                                            <input  checked="" type="radio" name="${S.id}" value="absent">    
                                                            absent
                                                        </label>
                                                        &nbsp;
                                                        <label>
                                                            <input type="radio" name="${S.id}" value="present">
                                                            present
                                                        </label>
                                                    </fieldset>
                                                </td>
                                                <td>
                                                    <input type="text" name="comment-${S.id}" placeholder="comment ...">
                                                </td>
                                                <td>
                                                    <span class="text-muted"><a href="#">Show image</a></span><br>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <input class="float-right btn-outline-success" style="margin-right: 500px; padding: 0 16px" type="submit" value="Add" />
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
