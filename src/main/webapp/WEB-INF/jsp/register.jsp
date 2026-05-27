<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>注册</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; margin-top: 80px; background:#f0f2f5; }
        .box { background: white; width: 320px; margin: auto; padding: 40px; border-radius: 8px; box-shadow: 0 2px 8px rgba(0,0,0,0.15); }
        h2 { color: #333; margin-bottom: 24px; }
        input { width: 100%; padding: 10px; margin: 8px 0; box-sizing: border-box; border: 1px solid #d9d9d9; border-radius: 4px; font-size: 14px; }
        button { width: 100%; padding: 10px; background: #52c41a; color: white; border: none; border-radius: 4px; font-size: 16px; cursor: pointer; margin-top: 8px; }
        button:hover { background: #73d13d; }
        .error { color: red; font-size: 13px; margin: 6px 0; }
        a { color: #1890ff; text-decoration: none; font-size: 13px; }
    </style>
</head>
<body>
    <div class="box">
        <h2>用户注册</h2>
        <% if (request.getAttribute("error") != null) { %>
            <p class="error">${error}</p>
        <% } %>
        <form action="/register" method="post">
            <input type="text" name="username" placeholder="请输入用户名" required />
            <input type="password" name="password" placeholder="请输入密码" required />
            <button type="submit">注 册</button>
        </form>
        <p style="margin-top:16px">已有账号？<a href="/login">去登录</a></p>
        <p style="margin-top:8px"><a href="/">返回首页</a></p>
    </div>
</body>
</html>
