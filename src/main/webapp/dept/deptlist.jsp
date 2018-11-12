<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; Utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>emplist</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="../css/style.css" />
</head>
<body>
<div id="wrap">
    <div id="top_content">
        <div id="header">
            <div id="rightheader">
                <p>
                    <fmt:formatDate value="${requestScope.date}" pattern="yyyy-MM-dd"/>
                    <br />
                </p>
            </div>
            <div id="topheader">
                <h1 id="title">
                    <a href="#">main</a>
                </h1>
            </div>
            <div id="navigation">
            </div>
        </div>
        <div id="content">
            <p id="whereami">
            </p>
            <h1>
                Welcome!
            </h1>
            <table class="table">
                <tr class="table_header">
                    <td>
                        ID
                    </td>
                    <td>
                        Name
                    </td>
                    <td>
                        Operation(删除部门员工一并删除)
                    </td>
                </tr>
                <c:forEach items="${sessionScope.depts}" var="dept">
                <tr class="row1">
                    <td>
                        ${dept.id}
                    </td>
                    <td>
                        ${dept.name}
                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath}/dept/delete?id=${dept.id}">delete emp</a>&nbsp;<a href="${pageContext.request.contextPath}/dept/updateDept.jsp?id=${dept.id}&name=${dept.name}">update emp</a>&nbsp;<a href="${pageContext.request.contextPath}/emp/showEmp">show emps</a>
                    </td>
                </tr>
                </c:forEach>
               <%-- <tr class="row2">
                    <td>
                        2
                    </td>
                    <td>
                        教学部
                    </td>
                    <td>
                        <a href="deptlist.html">delete emp</a>&nbsp;<a href="updateDept.html">update emp</a>&nbsp;<a href="../emp/emplist.html">show emps</a>
                    </td>
                </tr>--%>
            </table>
            <p>
                <input type="button" class="button" value="Add Dept" onclick="location='${pageContext.request.contextPath}/dept/addDept.jsp'"/>
            </p>
        </div>
    </div>
    <div id="footer">
        <div id="footer_bg">
            ABC@126.com
        </div>
    </div>
</div>
</body>
</html>
