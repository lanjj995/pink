<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; Utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>emplist</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="../css/style.css" />
    <link href="../css/common.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
    <script type="text/javascript">
        $(function(){
            $("delete").click(function(){
                alert("你确定要删除吗");
            });

            $("#submit").click(function(){
                var s = $(this).prev("input").val();
                var max = "${requestScope.data.page.pageTotal}";
                alert(max);
                if (s>max){
                    s=max;
                }
                if (s<1){
                    s=1;
                }
                location.href = "${pageContext.request.contextPath}/emp/showEmp?pageNumber="+s;
            });
        });
    </script>
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
                Welcome (${sessionScope.user.realname})!
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
                        Salary
                    </td>
                    <td>
                        Age
                    </td>
                    <td>
                        Bir
                    </td>
                    <td>
                        Dept
                    </td>
                    <td>
                        Operation(处理删除的友情提醒)
                    </td>
                </tr>
                <%--
                    varStatus是显示循环状态的变量
                    varStatus.index  是从0开始的下标
                    varStatus.count  是从1开始的下标
                    varStatus.first  显示当前的这轮循环是否为第一次
                    varStatus.last   显示当前的这轮循环是否为最后一次

                --%>
                <c:forEach items="${requestScope.data.emps}" var="emp" varStatus="status">
                    <c:if test="${status.count%2!=0}">
                        <tr class="row1">
                            <td>
                                ${emp.id}
                            </td>
                            <td>
                                ${emp.name}
                            </td>
                            <td>
                                ${emp.salary}
                            </td>
                            <td>
                                ${emp.age}
                            </td>
                            <td>
                                <fmt:formatDate value="${emp.bir}" pattern="yyyy-MM-dd"/>
                            </td>
                            <td>
                                ${emp.dept.name}
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath}/emp/delete?id=${emp.id}" name="delete">delete emp</a>&nbsp;<a href="${pageContext.request.contextPath}/emp/updateEmp.jsp?id=${emp.id}&name=${emp.name}&salary=${emp.salary}&age=${emp.age}&bir=<fmt:formatDate value="${emp.bir}" pattern="yyyy-MM-dd"/>&dept_id=${emp.dept.id}">update emp</a>
                            </td>
                        </tr>
                    </c:if>
                    <c:if test="${status.count%2==0}">
                        <tr class="row2">
                            <td>
                                    ${emp.id}
                            </td>
                            <td>
                                    ${emp.name}
                            </td>
                            <td>
                                    ${emp.salary}
                            </td>
                            <td>
                                    ${emp.age}
                            </td>
                            <td>
                                <fmt:formatDate value="${emp.bir}" pattern="yyyy-MM-dd"/>
                            </td>
                            <td>
                                    ${emp.dept.name}
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath}/emp/delete?id=${emp.id}" name="delete">delete emp</a>&nbsp;<a href="${pageContext.request.contextPath}/emp/updateEmp.jsp?id=${emp.id}&name=${emp.name}&salary=${emp.salary}&age=${emp.age}&bir=<fmt:formatDate value="${emp.bir}" pattern="yyyy-MM-dd"/>&dept_id=${emp.dept.id}">update emp</a>
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
                <%--<tr class="row2">
                    <td>
                        2
                    </td>
                    <td>
                        lishi
                    </td>
                    <td>
                        20000
                    </td>
                    <td>
                        20
                    </td>
                    <td>
                        2012-12-12
                    </td>
                    <td>
                        教学部
                    </td>
                    <td>
                        <a href="emplist.html">delete emp</a>&nbsp;<a href="updateEmp.html">update emp</a>
                    </td>
                </tr>--%>
            </table>
            <div class="pagination">
                <c:if test="${requestScope.data.page.pageNumber==1}">
                <span class="firstPage">&nbsp;</span> <span class="previousPage">&nbsp;</span>
                </c:if>
                <c:if test="${requestScope.data.page.pageNumber!=1}">
                    <a class="firstPage" href="${pageContext.request.contextPath}/emp/showEmp?pageNumber=1"></a>
                    <a class="previousPage" href="${pageContext.request.contextPath}/emp/showEmp?pageNumber=${requestScope.data.page.pageNumber-1}"></a>
                </c:if>

                <c:if test="${requestScope.data.page.pageNumber==1}">
                    <span class="currentPage">${requestScope.data.page.pageNumber}</span>
                    <a href="${pageContext.request.contextPath}/emp/showEmp?pageNumber=2">2</a>
                    <a href="${pageContext.request.contextPath}/emp/showEmp?pageNumber=3">3</a>
                    <span class="pageBreak">...</span>
                </c:if>
                <c:if test="${requestScope.data.page.pageNumber==2}">
                    <a href="${pageContext.request.contextPath}/emp/showEmp?pageNumber=${requestScope.data.page.pageNumber-1}">${requestScope.data.page.pageNumber-1}</a>
                    <span class="currentPage">${requestScope.data.page.pageNumber}</span>
                    <a href="${pageContext.request.contextPath}/emp/showEmp?pageNumber=${requestScope.data.page.pageNumber+1}">${requestScope.data.page.pageNumber+1}</a>
                    <span class="pageBreak">...</span>
                </c:if>



                <c:if test="${requestScope.data.page.pageNumber>2&&requestScope.data.page.pageNumber<=requestScope.data.page.pageTotal-2}">
                    <span class="pageBreak">...</span>
                    <a href="${pageContext.request.contextPath}/emp/showEmp?pageNumber=${requestScope.data.page.pageNumber-1}">${requestScope.data.page.pageNumber-1}</a>
                    <span class="currentPage">${requestScope.data.page.pageNumber}</span>
                    <a href="${pageContext.request.contextPath}/emp/showEmp?pageNumber=${requestScope.data.page.pageNumber+1}">${requestScope.data.page.pageNumber+1}</a>
                    <span class="pageBreak">...</span>

                </c:if>




                <c:if test="${requestScope.data.page.pageNumber==requestScope.data.page.pageTotal-1}">
                    <span class="pageBreak">...</span>
                    <a href="${pageContext.request.contextPath}/emp/showEmp?pageNumber=${requestScope.data.page.pageNumber-1}">${requestScope.data.page.pageNumber-1}</a>
                    <span class="currentPage">${requestScope.data.page.pageNumber}</span>
                    <a href="${pageContext.request.contextPath}/emp/showEmp?pageNumber=${requestScope.data.page.pageNumber+1}">${requestScope.data.page.pageNumber+1}</a>
                </c:if>
                <c:if test="${requestScope.data.page.pageNumber==requestScope.data.page.pageTotal}">
                    <span class="pageBreak">...</span>
                    <a href="${pageContext.request.contextPath}/emp/showEmp?pageNumber=${requestScope.data.page.pageNumber-2}">${requestScope.data.page.pageNumber-2}</a>
                    <a href="${pageContext.request.contextPath}/emp/showEmp?pageNumber=${requestScope.data.page.pageNumber-1}">${requestScope.data.page.pageNumber-1}</a>
                    <span class="currentPage">${requestScope.data.page.pageNumber}</span>
                    <span class="nextPage"></span>
                    <span class="lastPage"></span>
                </c:if>
                <c:if test="${requestScope.data.page.pageNumber!=requestScope.data.page.pageTotal}">
                    <a class="nextPage" href="${pageContext.request.contextPath}/emp/showEmp?pageNumber=${requestScope.data.page.pageNumber+1}">&nbsp;</a>
                    <a class="lastPage" href="${pageContext.request.contextPath}/emp/showEmp?pageNumber=${requestScope.data.page.pageTotal}">&nbsp;</a>
                </c:if>

                <span class="pageSkip"> 共${requestScope.data.page.pageTotal}页 到第<input id="pageNumber"
                                                     name="pageNumber" value="${requestScope.data.page.pageNumber}" maxlength="9"
                                                     onpaste="return false;">页
								<button type="submit" id="submit">&nbsp;</button>
						</span>
            </div>
            <p>
                <input type="button" class="button" value="Add Employee" onclick="location='${pageContext.request.contextPath}/emp/addEmp.jsp'"/>
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
