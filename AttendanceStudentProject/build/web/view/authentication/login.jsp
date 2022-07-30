<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="css/all.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css.css" rel="stylesheet" type="text/css"/>
        <link href="css/loginstyle.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.bundle.min.js" type="text/javascript"></script>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                    <div class="card border-0 shadow rounded-3 my-5">
                        <div class="card-body p-4 p-sm-5">
                            <h5 class="card-title text-center mb-5 fw-light fs-5">Sign In</h5>
                            <form action="login" method="POST">
                                <div class="text-center pb-4">
                                    <select style="height: 37px; width: 150px;" name="campus">
                                        <option value="0">Select campus</option>
                                        <c:forEach items="${listCampuses}" var="C">
                                            <option ${campus == C.id?"selected":""} value="${C.id}">${C.name}</option>
                                        </c:forEach>
                                    </select>
                                    <h5 class="text-danger">${error}</h5>
                                    <h5 class="text-danger">${errorCampus}</h5>
                                </div>
                                <div class="form-floating mb-3">
                                    <input type="email" class="form-control" id="floatingInput" name="email" placeholder="name@example.com">
                                    <label for="floatingInput">Email address</label>
                                    <h6 class="text-danger">${errorEmail}</h6>
                                </div>
                                <div class="form-floating mb-3">
                                    <input type="password" class="form-control" id="floatingPassword" name="password" placeholder="Password">
                                    <label for="floatingPassword">Password</label>
                                </div>
                                <h6 class="text-danger">${errorAccount}</h6>
                                <div class="d-grid">
                                    <button class="btn btn-primary btn-login text-uppercase fw-bold" type="submit">Sign
                                        in</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
