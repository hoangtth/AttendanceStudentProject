
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <link href="css/all.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css.css" rel="stylesheet" type="text/css"/>
        <link href="css/weeklytimetable.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <h3>Choose Week</h3>
                    <%@include file="chooseweek.jsp"%>
                </div>
                <div class="col-md-4" class="text-center">
                    Campus:<select class="mb-2" disabled name="campusId">
                        <option >${sessionScope.instructor.campus.name}</option>
                    </select><br/>
                    Lecture: <input type="text" disabled value="${sessionScope.instructor.code}" />
                </div>
                <div class="col-md-4"></div>
            </div>
            <div class="timetable-img text-center">
                <img src="img/content/timetable.png" alt="">
            </div>
            <div class="table-responsive">
                <table class="table table-bordered text-center">
                    <thead>
                        <tr class="bg-light-gray">
                            <th class="text-uppercase">Time
                            </th>
                            <th class="text-uppercase">Monday</th>
                            <th class="text-uppercase">Tuesday</th>
                            <th class="text-uppercase">Wednesday</th>
                            <th class="text-uppercase">Thursday</th>
                            <th class="text-uppercase">Friday</th>
                            <th class="text-uppercase">Saturday</th>
                            <th class="text-uppercase">Sunday</th>
                        </tr>
                    </thead>
                    <tbody>                 
                        <tr>
                            <td class="align-middle">Slot 1<br/>7:30-9:00</td>
                                <c:forEach items="${lessionsMonday}" var="L">
                                    <c:if test="${L.timeSlot.name eq 'Slot 1'}">
                                    <td>
                                        <span class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">${L.group.course.code}</span>
                                        <div class="font-size13"> at ${L.room.name}</div>
                                        <c:if test="${L.status == 0}">
                                            <a href="take-attendance?lid=${L.id}" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-danger">(Not yet)</div>
                                        </c:if>
                                        <c:if test="${L.status == 1}">
                                            <a href="view-attendance?lid=${L.id}&day=Monday" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-success">(Attended)</div>
                                        </c:if>
                                    </td>
                                </c:if>
                            </c:forEach>

                            <c:forEach items="${lessionsTuesday}" var="L">
                                <c:if test="${L.timeSlot.name eq 'Slot 1'}">
                                    <td>
                                        <span class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">${L.group.course.code}</span>
                                       
                                        <div class="font-size13"> at ${L.room.name}</div>
                                        <c:if test="${L.status == 0}">
                                            <a href="take-attendance?lid=${L.id}" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-danger">(Not yet)</div>
                                        </c:if>
                                        <c:if test="${L.status == 1}">
                                            <a href="view-attendance?lid=${L.id}&day=Tuesday" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-success">(Attended)</div>
                                        </c:if>
                                    </td>
                                </c:if>
                            </c:forEach>



                            <c:forEach items="${lessionsWednesday}" var="L">
                                <c:if test="${L.timeSlot.name eq 'Slot 1'}">
                                    <td>
                                        <span class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">${L.group.course.code}</span>
                                        <div class="font-size13"> at ${L.room.name}</div>
                                        <c:if test="${L.status == 0}">
                                            <a href="take-attendance?lid=${L.id}" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-danger">(Not yet)</div>
                                        </c:if>
                                        <c:if test="${L.status == 1}">
                                            <a href="view-attendance?lid=${L.id}&day=Wednesday" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-success">(Attended)</div>
                                        </c:if>
                                    </td>
                                </c:if>
                            </c:forEach>



                            <c:forEach items="${lessionsThursday}" var="L">
                                <c:if test="${L.timeSlot.name eq 'Slot 1'}">
                                    <td>
                                        <span class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">${L.group.course.code}</span>
                                        
                                        <div class="font-size13"> at ${L.room.name}</div>
                                        <c:if test="${L.status == 0}">
                                            <a href="take-attendance?lid=${L.id}" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-danger">(Not yet)</div>
                                        </c:if>
                                        <c:if test="${L.status == 1}">
                                            <a href="view-attendance?lid=${L.id}&day=Thursday" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-success">(Attended)</div>
                                        </c:if>
                                    </td>
                                </c:if>
                            </c:forEach>


                            <c:forEach items="${lessionsFriday}" var="L">
                                <c:if test="${L.timeSlot.name eq 'Slot 1'}">
                                    <td>
                                        <span class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">${L.group.course.code}</span>
                                        
                                        <div class="font-size13"> at ${L.room.name}</div>
                                        <c:if test="${L.status == 0}">
                                            <a href="take-attendance?lid=${L.id}" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-danger">(Not yet)</div>
                                        </c:if>
                                        <c:if test="${L.status == 1}">
                                            <a href="view-attendance?lid=${L.id}&day=Friday" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-success">(Attended)</div>
                                        </c:if>
                                    </td>
                                </c:if>
                            </c:forEach>


                            <c:forEach items="${lessionsSaturday}" var="L">
                                <c:if test="${L.timeSlot.name eq 'Slot 1'}">
                                    <td>
                                        <span class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">${L.group.course.code}</span>
                                        
                                        <div class="font-size13"> at ${L.room.name}</div>
                                        <c:if test="${L.status == 0}">
                                            <a href="take-attendance?lid=${L.id}" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-danger">(Not yet)</div>
                                        </c:if>
                                        <c:if test="${L.status == 1}">
                                            <a href="view-attendance?lid=${L.id}&day=Saturday" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-success">(Attended)</div>
                                        </c:if>
                                    </td>
                                </c:if>
                            </c:forEach>
                        </tr>

                        <tr>
                            <td class="align-middle">Slot 2<br/>9:10-10:40</td>
                                <c:forEach items="${lessionsMonday}" var="L">
                                    <c:if test="${L.timeSlot.name eq 'Slot 2'}">
                                    <td>
                                        <span class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">${L.group.course.code}</span>
                                        
                                        <div class="font-size13"> at ${L.room.name}</div>
                                        <c:if test="${L.status == 0}">
                                            <a href="take-attendance?lid=${L.id}" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-danger">(Not yet)</div>
                                        </c:if>
                                        <c:if test="${L.status == 1}">
                                            <a href="view-attendance?lid=${L.id}&day=Monday" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-success">(Attended)</div>
                                        </c:if>
                                    </td>
                                </c:if>
                            </c:forEach>

                            <c:forEach items="${lessionsTuesday}" var="L">
                                <c:if test="${L.timeSlot.name eq 'Slot 2'}">
                                    <td>
                                        <span class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">${L.group.course.code}</span>
                                        
                                        <div class="font-size13"> at ${L.room.name}</div>
                                        <c:if test="${L.status == 0}">
                                            <a href="take-attendance?lid=${L.id}" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-danger">(Not yet)</div>
                                        </c:if>
                                        <c:if test="${L.status == 1}">
                                            <a href="view-attendance?lid=${L.id}&day=Tuesday" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-success">(Attended)</div>
                                        </c:if>
                                    </td>
                                </c:if>
                            </c:forEach>



                            <c:forEach items="${lessionsWednesday}" var="L">
                                <c:if test="${L.timeSlot.name eq 'Slot 2'}">
                                    <td>
                                        <span class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">${L.group.course.code}</span>
                                        
                                        <div class="font-size13"> at ${L.room.name}</div>
                                        <c:if test="${L.status == 0}">
                                            <a href="take-attendance?lid=${L.id}" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-danger">(Not yet)</div>
                                        </c:if>
                                        <c:if test="${L.status == 1}">
                                            <a href="view-attendance?lid=${L.id}&day=Wednesday" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-success">(Attended)</div>
                                        </c:if>
                                    </td>
                                </c:if>
                            </c:forEach>



                            <c:forEach items="${lessionsThursday}" var="L">
                                <c:if test="${L.timeSlot.name eq 'Slot 2'}">
                                    <td>
                                        <span class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">${L.group.course.code}</span>
                                        
                                        <div class="font-size13"> at ${L.room.name}</div>
                                        <c:if test="${L.status == 0}">
                                            <a href="take-attendance?lid=${L.id}" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-danger">(Not yet)</div>
                                        </c:if>
                                        <c:if test="${L.status == 1}">
                                            <a href="view-attendance?lid=${L.id}&day=Thursday" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-success">(Attended)</div>
                                        </c:if>
                                    </td>
                                </c:if>
                            </c:forEach>


                            <c:forEach items="${lessionsFriday}" var="L">
                                <c:if test="${L.timeSlot.name eq 'Slot 2'}">
                                    <td>
                                        <span class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">${L.group.course.code}</span>
                                        
                                        <div class="font-size13"> at ${L.room.name}</div>
                                        <c:if test="${L.status == 0}">
                                            <a href="take-attendance?lid=${L.id}" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-danger">(Not yet)</div>
                                        </c:if>
                                        <c:if test="${L.status == 1}">
                                            <a href="view-attendance?lid=${L.id}&day=Friday" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-success">(Attended)</div>
                                        </c:if>
                                    </td>
                                </c:if>
                            </c:forEach>


                            <c:forEach items="${lessionsSaturday}" var="L">
                                <c:if test="${L.timeSlot.name eq 'Slot 2'}">
                                    <td>
                                        <span class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">${L.group.course.code}</span>
                                        
                                        <div class="font-size13"> at ${L.room.name}</div>
                                        <c:if test="${L.status == 0}">
                                            <a href="take-attendance?lid=${L.id}" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-danger">(Not yet)</div>
                                        </c:if>
                                        <c:if test="${L.status == 1}">
                                            <a href="view-attendance?lid=${L.id}&day=Saturday" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-success">(Attended)</div>
                                        </c:if>
                                    </td>
                                </c:if>
                            </c:forEach>


                        </tr>

                        <tr>
                            <td class="align-middle">Slot 3<br/>10:50-12:20</td>
                                <c:forEach items="${lessionsMonday}" var="L">
                                    <c:if test="${L.timeSlot.name eq 'Slot 3'}">
                                    <td>
                                        <span class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">${L.group.course.code}</span>
                                         
                                       <div class="font-size13"> at ${L.room.name}</div>

                                        <c:if test="${L.status == 0}">
                                            <a href="take-attendance?lid=${L.id}" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-danger">(Not yet)</div>
                                        </c:if>
                                        <c:if test="${L.status == 1}">
                                            <a href="view-attendance?lid=${L.id}&day=Monday" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-success">(Attended)</div>
                                        </c:if>                                    </td>
                                </c:if>
                            </c:forEach>
                            <c:forEach items="${lessionsTuesday}" var="L">
                                <c:if test="${L.timeSlot.name eq 'Slot 3'}">
                                    <td>
                                        <span class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">${L.group.course.code}</span>
                                        
                                        <div class="font-size13"> at ${L.room.name}</div>
                                        <c:if test="${L.status == 0}">
                                            <a href="take-attendance?lid=${L.id}" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-danger">(Not yet)</div>
                                        </c:if>
                                        <c:if test="${L.status == 1}">
                                            <a href="view-attendance?lid=${L.id}&day=Tuesday" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-success">(Attended)</div>
                                        </c:if>
                                    </td>
                                </c:if>
                            </c:forEach>
                            <c:forEach items="${lessionsWednesday}" var="L">
                                <c:if test="${L.timeSlot.name eq 'Slot 3'}">
                                    <td>
                                        <span class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">${L.group.course.code}</span>
                                        
                                        <div class="font-size13"> at ${L.room.name}</div>
                                        <c:if test="${L.status == 0}">
                                            <a href="take-attendance?lid=${L.id}" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-danger">(Not yet)</div>
                                        </c:if>
                                        <c:if test="${L.status == 1}">
                                            <a href="view-attendance?lid=${L.id}&day=Wednesday" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-success">(Attended)</div>
                                        </c:if>
                                    </td>
                                </c:if>
                            </c:forEach>
                            <c:forEach items="${lessionsThursday}" var="L">
                                <c:if test="${L.timeSlot.name eq 'Slot 3'}">
                                    <td>
                                        <span class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">${L.group.course.code}</span>
                                        
                                        <div class="font-size13"> at ${L.room.name}</div>
                                        <c:if test="${L.status == 0}">
                                            <a href="take-attendance?lid=${L.id}" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-danger">(Not yet)</div>
                                        </c:if>
                                        <c:if test="${L.status == 1}">
                                            <a href="view-attendance?lid=${L.id}&day=Thursday" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-success">(Attended)</div>
                                        </c:if>
                                    </td>
                                </c:if>
                            </c:forEach>
                            <c:forEach items="${lessionsFriday}" var="L">
                                <c:if test="${L.timeSlot.name eq 'Slot 3'}">
                                    <td>
                                        <span class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">${L.group.course.code}</span>
                                        
                                        <div class="font-size13"> at ${L.room.name}</div>
                                        <c:if test="${L.status == 0}">
                                            <a href="take-attendance?lid=${L.id}" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-danger">(Not yet)</div>
                                        </c:if>
                                        <c:if test="${L.status == 1}">
                                            <a href="view-attendance?lid=${L.id}&day=Friday" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-success">(Attended)</div>
                                        </c:if>
                                    </td>
                                </c:if>
                            </c:forEach>
                            <c:forEach items="${lessionsSaturday}" var="L">
                                <c:if test="${L.timeSlot.name eq 'Slot 3'}">
                                    <td>
                                        <span class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">${L.group.course.code}</span>
                                        
                                        <div class="font-size13"> at ${L.room.name}</div>
                                        <c:if test="${L.status == 0}">
                                            <a href="take-attendance?lid=${L.id}" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-danger">(Not yet)</div>
                                        </c:if>
                                        <c:if test="${L.status == 1}">
                                            <a href="view-attendance?lid=${L.id}&day=Saturday" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-success">(Attended)</div>
                                        </c:if>
                                    </td>
                                </c:if>
                            </c:forEach>
                        </tr>

                        <tr>
                            <td class="align-middle">Slot 4<br/>12:50-14:20</td>
                                <c:forEach items="${lessionsMonday}" var="L">
                                    <c:if test="${L.timeSlot.name eq 'Slot 4'}">
                                    <td>
                                        <span class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">${L.group.course.code}</span>
                                        
                                        <div class="font-size13"> at ${L.room.name}</div>
                                        <c:if test="${L.status == 0}">
                                            <a href="take-attendance?lid=${L.id}" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-danger">(Not yet)</div>
                                        </c:if>
                                        <c:if test="${L.status == 1}">
                                            <a href="view-attendance?lid=${L.id}&day=Monday" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-success">(Attended)</div>
                                        </c:if>
                                    </td>
                                </c:if>
                            </c:forEach>
                            <c:forEach items="${lessionsTuesday}" var="L">
                                <c:if test="${L.timeSlot.name eq 'Slot 4'}">
                                    <td>
                                        <span class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">${L.group.course.code}</span>
                                        
                                        <div class="font-size13"> at ${L.room.name}</div>
                                        <c:if test="${L.status == 0}">
                                            <a href="take-attendance?lid=${L.id}" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-danger">(Not yet)</div>
                                        </c:if>
                                        <c:if test="${L.status == 1}">
                                            <a href="view-attendance?lid=${L.id}&day=Tuesday" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-success">(Attended)</div>
                                        </c:if>
                                    </td>
                                </c:if>
                            </c:forEach>
                            <c:forEach items="${lessionsWednesday}" var="L">
                                <c:if test="${L.timeSlot.name eq 'Slot 4'}">
                                    <td>
                                        <span class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">${L.group.course.code}</span>
                                        
                                        <div class="font-size13"> at ${L.room.name}</div>
                                        <c:if test="${L.status == 0}">
                                            <a href="take-attendance?lid=${L.id}" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-danger">(Not yet)</div>
                                        </c:if>
                                        <c:if test="${L.status == 1}">
                                            <a href="view-attendance?lid=${L.id}&day=Wednesday" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-success">(Attended)</div>
                                        </c:if>
                                    </td>
                                </c:if>
                            </c:forEach>
                            <c:forEach items="${lessionsThursday}" var="L">
                                <c:if test="${L.timeSlot.name eq 'Slot 4'}">
                                    <td>
                                        <span class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">${L.group.course.code}</span>
                                        
                                        <div class="font-size13"> at ${L.room.name}</div>
                                        <c:if test="${L.status == 0}">
                                            <a href="take-attendance?lid=${L.id}" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-danger">(Not yet)</div>
                                        </c:if>
                                        <c:if test="${L.status == 1}">
                                            <a href="view-attendance?lid=${L.id}&day=Thurday" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-success">(Attended)</div>
                                        </c:if>
                                    </td>
                                </c:if>
                            </c:forEach>
                            <c:forEach items="${lessionsFriday}" var="L">
                                <c:if test="${L.timeSlot.name eq 'Slot 4'}">
                                    <td>
                                        <span class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">${L.group.course.code}</span>
                                        
                                        <div class="font-size13"> at ${L.room.name}</div>
                                        <c:if test="${L.status == 0}">
                                            <a href="take-attendance?lid=${L.id}" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-danger">(Not yet)</div>
                                        </c:if>
                                        <c:if test="${L.status == 1}">
                                            <a href="view-attendance?lid=${L.id}&day=Friday" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-success">(Attended)</div>
                                        </c:if>
                                    </td>
                                </c:if>
                            </c:forEach>
                            <c:forEach items="${lessionsSaturday}" var="L">
                                <c:if test="${L.timeSlot.name eq 'Slot 4'}">
                                    <td>
                                        <span class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">${L.group.course.code}</span>
                                        
                                        <div class="font-size13"> at ${L.room.name}</div>
                                        <c:if test="${L.status == 0}">
                                            <a href="take-attendance?lid=${L.id}" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-danger">(Not yet)</div>
                                        </c:if>
                                        <c:if test="${L.status == 1}">
                                            <a href="view-attendance?lid=${L.id}&day=Saturday" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-success">(Attended)</div>
                                        </c:if>
                                    </td>
                                </c:if>
                            </c:forEach>
                        </tr>

                        <tr>
                            <td class="align-middle">Slot 5<br/>14:30-16:00</td>
                                <c:forEach items="${lessionsMonday}" var="L">
                                    <c:if test="${L.timeSlot.name eq 'Slot 5'}">
                                    <td>
                                        <span class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">${L.group.course.code}</span>
                                        
                                        <div class="font-size13"> at ${L.room.name}</div>
                                        <c:if test="${L.status == 0}">
                                            <a href="take-attendance?lid=${L.id}" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-danger">(Not yet)</div>
                                        </c:if>
                                        <c:if test="${L.status == 1}">
                                            <a href="view-attendance?lid=${L.id}&day=Monday" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-success">(Attended)</div>
                                        </c:if>
                                    </td>
                                </c:if>
                            </c:forEach>
                            <c:forEach items="${lessionsTuesday}" var="L">
                                <c:if test="${L.timeSlot.name eq 'Slot 5'}">
                                    <td>
                                        <span class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">${L.group.course.code}</span>
                                        
                                        <div class="font-size13"> at ${L.room.name}</div>
                                        <c:if test="${L.status == 0}">
                                            <a href="take-attendance?lid=${L.id}" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-danger">(Not yet)</div>
                                        </c:if>
                                        <c:if test="${L.status == 1}">
                                            <a href="view-attendance?lid=${L.id}&day=Tuesday" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-success">(Attended)</div>
                                        </c:if>
                                    </td>
                                </c:if>
                            </c:forEach>
                            <c:forEach items="${lessionsWednesday}" var="L">
                                <c:if test="${L.timeSlot.name eq 'Slot 5'}">
                                    <td>
                                        <span class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">${L.group.course.code}</span>
                                        
                                        <div class="font-size13"> at ${L.room.name}</div>
                                        <c:if test="${L.status == 0}">
                                            <a href="take-attendance?lid=${L.id}" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-danger">(Not yet)</div>
                                        </c:if>
                                        <c:if test="${L.status == 1}">
                                            <a href="view-attendance?lid=${L.id}&day=Wednesday" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-success">(Attended)</div>
                                        </c:if>
                                    </td>
                                </c:if>
                            </c:forEach>
                            <c:forEach items="${lessionsThursday}" var="L">
                                <c:if test="${L.timeSlot.name eq 'Slot 5'}">
                                    <td>
                                        <span class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">${L.group.course.code}</span>
                                        
                                        <div class="font-size13"> at ${L.room.name}</div>
                                        <c:if test="${L.status == 0}">
                                            <a href="take-attendance?lid=${L.id}" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-danger">(Not yet)</div>
                                        </c:if>
                                        <c:if test="${L.status == 1}">
                                            <a href="view-attendance?lid=${L.id}&day=Thursday" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-success">(Attended)</div>
                                        </c:if>
                                    </td>
                                </c:if>
                            </c:forEach>
                            <c:forEach items="${lessionsFriday}" var="L">
                                <c:if test="${L.timeSlot.name eq 'Slot 5'}">
                                    <td>
                                        <span class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">${L.group.course.code}</span>
                                        
                                        <div class="font-size13"> at ${L.room.name}</div>
                                        <c:if test="${L.status == 0}">
                                            <a href="take-attendance?lid=${L.id}" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-danger">(Not yet)</div>
                                        </c:if>
                                        <c:if test="${L.status == 1}">
                                            <a href="view-attendance?lid=${L.id}&day=Friday" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-success">(Attended)</div>
                                        </c:if>
                                    </td>
                                </c:if>
                            </c:forEach>
                            <c:forEach items="${lessionsSaturday}" var="L">
                                <c:if test="${L.timeSlot.name eq 'Slot 5'}">
                                    <td>
                                        <span class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">${L.group.course.code}</span>
                                        
                                        <div class="font-size13"> at ${L.room.name}</div>
                                        <c:if test="${L.status == 0}">
                                            <a href="take-attendance?lid=${L.id}" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-danger">(Not yet)</div>
                                        </c:if>
                                        <c:if test="${L.status == 1}">
                                            <a href="view-attendance?lid=${L.id}&day=Saturday" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-success">(Attended)</div>
                                        </c:if>
                                    </td>
                                </c:if>
                            </c:forEach>
                        </tr>
                        <tr>
                            <td class="align-middle">Slot 6<br/>16:10-17:40</td>
                                <c:forEach items="${lessionsMonday}" var="L">
                                    <c:if test="${L.timeSlot.name eq 'Slot 6'}">
                                    <td>
                                        <span class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">${L.group.course.code}</span>
                                        
                                        <div class="font-size13"> at ${L.room.name}</div>
                                        <c:if test="${L.status == 0}">
                                            <a href="take-attendance?lid=${L.id}" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-danger">(Not yet)</div>
                                        </c:if>
                                        <c:if test="${L.status == 1}">
                                            <a href="view-attendance?lid=${L.id}&day=Monday" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-success">(Attended)</div>
                                        </c:if>
                                    </td>
                                </c:if>
                            </c:forEach>
                            <c:forEach items="${lessionsTuesday}" var="L">
                                <c:if test="${L.timeSlot.name eq 'Slot 6'}">
                                    <td>
                                        <span class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">${L.group.course.code}</span>
                                        
                                        <div class="font-size13"> at ${L.room.name}</div>
                                        <c:if test="${L.status == 0}">
                                            <a href="take-attendance?lid=${L.id}" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-danger">(Not yet)</div>
                                        </c:if>
                                        <c:if test="${L.status == 1}">
                                            <a href="view-attendance?lid=${L.id}&day=Tuesday" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-success">(Attended)</div>
                                        </c:if>
                                    </td>
                                </c:if>
                            </c:forEach>
                            <c:forEach items="${lessionsWednesday}" var="L">
                                <c:if test="${L.timeSlot.name eq 'Slot 6'}">
                                    <td>
                                        <span class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">${L.group.course.code}</span>
                                        
                                        <div class="font-size13"> at ${L.room.name}</div>
                                        <c:if test="${L.status == 0}">
                                            <a href="take-attendance?lid=${L.id}" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-danger">(Not yet)</div>
                                        </c:if>
                                        <c:if test="${L.status == 1}">
                                            <a href="view-attendance?lid=${L.id}&day=Wednesday" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-success">(Attended)</div>
                                        </c:if>
                                    </td>
                                </c:if>
                            </c:forEach>
                            <c:forEach items="${lessionsThursday}" var="L">
                                <c:if test="${L.timeSlot.name eq 'Slot 6'}">
                                    <td>
                                        <span class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">${L.group.course.code}</span>
                                        
                                        <div class="font-size13"> at ${L.room.name}</div>
                                        <c:if test="${L.status == 0}">
                                            <a href="take-attendance?lid=${L.id}" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-danger">(Not yet)</div>
                                        </c:if>
                                        <c:if test="${L.status == 1}">
                                            <a href="view-attendance?lid=${L.id}&day=Thursday" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-success">(Attended)</div>
                                        </c:if>
                                    </td>
                                </c:if>
                            </c:forEach>
                            <c:forEach items="${lessionsFriday}" var="L">
                                <c:if test="${L.timeSlot.name eq 'Slot 6'}">
                                    <td>
                                        <span class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">${L.group.course.code}</span>
                                        
                                        <div class="font-size13"> at ${L.room.name}</div>
                                        <c:if test="${L.status == 0}">
                                            <a href="take-attendance?lid=${L.id}" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-danger">(Not yet)</div>
                                        </c:if>
                                        <c:if test="${L.status == 1}">
                                            <a href="view-attendance?lid=${L.id}&day=Friday" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-success">(Attended)</div>
                                        </c:if>
                                    </td>
                                </c:if>
                            </c:forEach>
                            <c:forEach items="${lessionsSaturday}" var="L">
                                <c:if test="${L.timeSlot.name eq 'Slot 6'}">
                                    <td>
                                        <span class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">${L.group.course.code}</span>
                                        
                                        <div class="font-size13"> at ${L.room.name}</div>
                                        <c:if test="${L.status == 0}">
                                            <a href="take-attendance?lid=${L.id}" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-danger">(Not yet)</div>
                                        </c:if>
                                        <c:if test="${L.status == 1}">
                                            <a href="view-attendance?lid=${L.id}&day=Saturday" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-success">(Attended)</div>
                                        </c:if>
                                    </td>
                                </c:if>
                            </c:forEach>
                        </tr>
                        <tr>
                            <td class="align-middle">Slot 7<br/>18:00-19:30</td>
                                <c:forEach items="${lessionsMonday}" var="L">
                                    <c:if test="${L.timeSlot.name eq 'Slot 7'}">
                                    <td>
                                        <span class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">${L.group.course.code}</span>
                                        
                                        <div class="font-size13"> at ${L.room.name}</div>
                                        <c:if test="${L.status == 0}">
                                            <a href="take-attendance?lid=${L.id}" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-danger">(Not yet)</div>
                                        </c:if>
                                        <c:if test="${L.status == 1}">
                                            <a href="view-attendance?lid=${L.id}&day=Monday" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-success">(Attended)</div>
                                        </c:if>
                                    </td>
                                </c:if>
                            </c:forEach>
                            <c:forEach items="${lessionsTuesday}" var="L">
                                <c:if test="${L.timeSlot.name eq 'Slot 7'}">
                                    <td>
                                        <span class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">${L.group.course.code}</span>
                                        
                                        <div class="font-size13"> at ${L.room.name}</div>
                                        <c:if test="${L.status == 0}">
                                            <a href="take-attendance?lid=${L.id}" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-danger">(Not yet)</div>
                                        </c:if>
                                        <c:if test="${L.status == 1}">
                                            <a href="view-attendance?lid=${L.id}&day=Tuesday" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-success">(Attended)</div>
                                        </c:if>
                                    </td>
                                </c:if>
                            </c:forEach>
                            <c:forEach items="${lessionsWednesday}" var="L">
                                <c:if test="${L.timeSlot.name eq 'Slot 7'}">
                                    <td>
                                        <span class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">${L.group.course.code}</span>
                                        
                                        <div class="font-size13"> at ${L.room.name}</div>
                                        <c:if test="${L.status == 0}">
                                            <a href="take-attendance?lid=${L.id}" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-danger">(Not yet)</div>
                                        </c:if>
                                        <c:if test="${L.status == 1}">
                                            <a href="view-attendance?lid=${L.id}&day=Wednesday" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-success">(Attended)</div>
                                        </c:if>
                                    </td>
                                </c:if>
                            </c:forEach>
                            <c:forEach items="${lessionsThursday}" var="L">
                                <c:if test="${L.timeSlot.name eq 'Slot 7'}">
                                    <td>
                                        <span class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">${L.group.course.code}</span>
                                        
                                        <div class="font-size13"> at ${L.room.name}</div>
                                        <c:if test="${L.status == 0}">
                                            <a href="take-attendance?lid=${L.id}" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-danger">(Not yet)</div>
                                        </c:if>
                                        <c:if test="${L.status == 1}">
                                            <a href="view-attendance?lid=${L.id}&day=Thursday" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-success">(Attended)</div>
                                        </c:if>
                                    </td>
                                </c:if>
                            </c:forEach>
                            <c:forEach items="${lessionsFriday}" var="L">
                                <c:if test="${L.timeSlot.name eq 'Slot 7'}">
                                    <td>
                                        <span class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">${L.group.course.code}</span>
                                        
                                        <div class="font-size13"> at ${L.room.name}</div>
                                        <c:if test="${L.status == 0}">
                                            <a href="take-attendance?lid=${L.id}" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-danger">(Not yet)</div>
                                        </c:if>
                                        <c:if test="${L.status == 1}">
                                            <a href="view-attendance?lid=${L.id}&day=Friday" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-success">(Attended)</div>
                                        </c:if>
                                    </td>
                                </c:if>
                            </c:forEach>
                            <c:forEach items="${lessionsSaturday}" var="L">
                                <c:if test="${L.timeSlot.name eq 'Slot 7'}">
                                    <td>
                                        <span class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">${L.group.course.code}</span>
                                        
                                        <div class="font-size13"> at ${L.room.name}</div>
                                        <c:if test="${L.status == 0}">
                                            <a href="take-attendance?lid=${L.id}" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-danger">(Not yet)</div>
                                        </c:if>
                                        <c:if test="${L.status == 1}">
                                            <a href="view-attendance?lid=${L.id}&day=Saturday" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-success">(Attended)</div>
                                        </c:if>
                                    </td>
                                </c:if>
                            </c:forEach>
                        </tr>

                        <tr>
                            <td class="align-middle">Slot 8<br/>18:00-19:30</td>
                                <c:forEach items="${lessionsMonday}" var="L">
                                    <c:if test="${L.timeSlot.name eq 'Slot 8'}">
                                    <td>
                                        <span class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">${L.group.course.code}</span>
                                        
                                        <div class="font-size13"> at ${L.room.name}</div>
                                        <c:if test="${L.status == 0}">
                                            <a href="take-attendance?lid=${L.id}" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-danger">(Not yet)</div>
                                        </c:if>
                                        <c:if test="${L.status == 1}">
                                            <a href="view-attendance?lid=${L.id}&day=Monday" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-success">(Attended)</div>
                                        </c:if>
                                    </td>
                                </c:if>
                            </c:forEach>
                            <c:forEach items="${lessionsTuesday}" var="L">
                                <c:if test="${L.timeSlot.name eq 'Slot 8'}">
                                    <td>
                                        <span class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">${L.group.course.code}</span>
                                        
                                        <div class="font-size13"> at ${L.room.name}</div>
                                        <c:if test="${L.status == 0}">
                                            <a href="take-attendance?lid=${L.id}" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-danger">(Not yet)</div>
                                        </c:if>
                                        <c:if test="${L.status == 1}">
                                            <a href="view-attendance?lid=${L.id}&day=Tuesday" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-success">(Attended)</div>
                                        </c:if>
                                    </td>
                                </c:if>
                            </c:forEach>
                            <c:forEach items="${lessionsWednesday}" var="L">
                                <c:if test="${L.timeSlot.name eq 'Slot 8'}">
                                    <td>
                                        <span class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">${L.group.course.code}</span>
                                        
                                        <div class="font-size13"> at ${L.room.name}</div>
                                        <c:if test="${L.status == 0}">
                                            <a href="take-attendance?lid=${L.id}" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-danger">(Not yet)</div>
                                        </c:if>
                                        <c:if test="${L.status == 1}">
                                            <a href="view-attendance?lid=${L.id}&day=Wednesday" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-success">(Attended)</div>
                                        </c:if>
                                    </td>
                                </c:if>
                            </c:forEach>
                            <c:forEach items="${lessionsThursday}" var="L">
                                <c:if test="${L.timeSlot.name eq 'Slot 8'}">
                                    <td>
                                        <span class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">${L.group.course.code}</span>
                                        
                                        <div class="font-size13"> at ${L.room.name}</div>
                                        <c:if test="${L.status == 0}">
                                            <a href="take-attendance?lid=${L.id}" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-danger">(Not yet)</div>
                                        </c:if>
                                        <c:if test="${L.status == 1}">
                                            <a href="view-attendance?lid=${L.id}&day=Thursday" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-success">(Attended)</div>
                                        </c:if>
                                    </td>
                                </c:if>
                            </c:forEach>
                            <c:forEach items="${lessionsFriday}" var="L">
                                <c:if test="${L.timeSlot.name eq 'Slot 8'}">
                                    <td>
                                        <span class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">${L.group.course.code}</span>
                                        
                                        <div class="font-size13"> at ${L.room.name}</div>
                                        <c:if test="${L.status == 0}">
                                            <a href="take-attendance?lid=${L.id}" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-danger">(Not yet)</div>
                                        </c:if>
                                        <c:if test="${L.status == 1}">
                                            <a href="view-attendance?lid=${L.id}&day=Friday" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-success">(Attended)</div>
                                        </c:if>
                                    </td>
                                </c:if>
                            </c:forEach>
                            <c:forEach items="${lessionsSaturday}" var="L">
                                <c:if test="${L.timeSlot.name eq 'Slot 8'}">
                                    <td>
                                        <span class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">${L.group.course.code}</span>
                                        
                                        <div class="font-size13"> at ${L.room.name}</div>
                                        <c:if test="${L.status == 0}">
                                            <a href="take-attendance?lid=${L.id}" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-danger">(Not yet)</div>
                                        </c:if>
                                        <c:if test="${L.status == 1}">
                                            <a href="view-attendance?lid=${L.id}&day=Saturday" class="margin-10px-top font-size14">${L.group.name}</a>
                                            <div class="font-size13 text-success">(Attended)</div>
                                        </c:if>
                                    </td>
                                </c:if>
                            </c:forEach>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
