<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>用户列表</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f0f2f5; padding: 30px; }
        .container { max-width: 700px; margin: auto; background: white; padding: 30px; border-radius: 8px; box-shadow: 0 2px 8px rgba(0,0,0,0.15); }
        h2 { color: #333; margin-bottom: 4px; }
        .info { color: #888; font-size: 13px; margin-bottom: 20px; }
        table { width: 100%; border-collapse: collapse; margin-top: 16px; }
        th, td { padding: 12px 16px; text-align: left; border-bottom: 1px solid #f0f0f0; }
        th { background: #fafafa; color: #666; font-weight: normal; }
        tr:hover { background: #fafafa; }
        .btn-del { background: #ff4d4f; color: white; border: none; padding: 5px 12px; border-radius: 4px; cursor: pointer; font-size: 13px; }
        .btn-del:hover { background: #ff7875; }
        .header { display: flex; justify-content: space-between; align-items: center; }
        .logout { color: #999; text-decoration: none; font-size: 13px; }
        .logout:hover { color: #ff4d4f; }
        .welcome { font-size: 13px; color: #52c41a; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <div>
                <h2>用户列表</h2>
                <p class="info">作者：杨婷 &nbsp;|&nbsp; 学号：2315302314</p>
            </div>
            <div>
                <span class="welcome">欢迎，${sessionScope.loginUser.username}</span>
                &nbsp;&nbsp;
                <a href="/logout" class="logout">退出登录</a>
            </div>
        </div>

        <c:if test="${not empty error}">
            <p style="color:red">${error}</p>
        </c:if>

        <table>
            <tr>
                <th>ID</th>
                <th>用户名</th>
                <th>密码</th>
                <th>操作</th>
            </tr>
            <c:forEach var="user" items="${users}">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.username}</td>
                    <td>${user.password}</td>
                    <td>
                        <form action="/delete" method="post" style="display:inline"
                              onsubmit="return confirm('确认删除用户【${user.username}】吗？')">
                            <input type="hidden" name="username" value="${user.username}" />
                            <button class="btn-del" type="submit">删除</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            <c:if test="${empty users}">
                <tr><td colspan="4" style="text-align:center;color:#999">暂无用户数据</td></tr>
            </c:if>
        </table>

        <p style="margin-top:20px">
            <a href="/register" style="color:#1890ff;text-decoration:none">+ 注册新用户</a>
        </p>
    </div>
</body>
</html>
