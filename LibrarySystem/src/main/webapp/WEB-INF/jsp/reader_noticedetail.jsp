<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <title>Document</title>

    <script src="../js/axios-0.18.0.js"></script>
    <script src="../js/js.js"></script>
    <link rel="stylesheet" href="../css/F2.css">

    <style>
        .select {
            position: relative;
            bottom: 20px;
            left: 150px;
            line-height: 30px;
        }

        .selectInput {
            width: 450px;
            border: rgb(255, 106, 0) 2px solid;
        }

        .selectButton {
            width: 120px;
            background-color: rgb(255, 106, 0);
            color: white;
            border: white 0 solid;
        }

        #span1 {
            position: relative;
            bottom: 20px;
            left: 150px;
            line-height: 30px;
        }

        #span2 {
            position: relative;
            bottom: 20px;
            left: 150px;
            line-height: 30px;
        }

        #span3 {
            position: relative;
            bottom: 20px;
            left: 150px;
            line-height: 30px;
        }

        .a1 {
            margin-left: 60px;
            margin-right: 60px;
        }

        a {
            text-decoration: none;
            color: blue;
        }

        a:hover {
            cursor: pointer;
            color: red;
        }

        .notice {
            color: black;
            position: relative;
            bottom: 15px;
            left: 60px;
        }

        #noticeDetailBox {
            width: 1200px;
            height: 300px;
            position: relative;
            margin: 45px auto;

        }

        #noticeDetailName {
            color: red;
            position: relative;
            left: 30px;
            font-size: 24px;
        }

        #noticeDetailInner {
            position: relative;
            left: 60px;
            color: skyblue;
        }

        #noticeDetailDate {
            position: relative;
            left: 1000px;
        }
        #backButton{
            position: relative;
            left: 500px;
        }

    </style>
</head>

<body>
<div class="head1">
    <a href="../PublicPage/Home.html"><img src="../css/brand.jpg" class="brandH"></a>
    <span><a href="GG.html" class="notice">公告中心</a></span>
    <input type="text" class="selectInput select" placeholder="请输入关键词" id="like">
    <button onclick="selectGoods()" class="selectButton select">搜索</button>
    <span id="span1" style="display: none"><a class="a1" href="../login/login.html">登录</a><a class="a1"
                                                                                             href="../login/reg.html">免费注册</a></span>
    <span id="span2" style="display: none"><a href="../UserAction/menu.html">个人中心</a><span class="a1" id="Name"></span></span>
    <span id="span3" style="display: none"><a href="../AdminAction/menu.html">管理中心</a><span
            class="a1">admin</span></span>

</div>
<div id="noticeDetailBox">
    <span id="noticeDetailName">123</span>
    <hr>
    <span id="noticeDetailInner">123</span><br><br>
    <span id="noticeDetailDate">123</span><br><br>
    <button onclick="back()" id="backButton">返回</button>
</div>
<div class="tail"><img src="../css/brand.jpg" class="brandT"><span class="HY">欢迎来到倒霉三兄弟电商平台</span></div>
</body>
<script src="../js/axios-0.18.0.js"></script>
<script src="../js/js.js"></script>
<script>
    var userId = localStorage.getItem("id");
    var user;
    $(document).ready(function () {
        if (userId == null) {
            document.getElementById("span1").style.display = "inline-block";
            document.getElementById("span2").style.display = "none";
        } else {
            if (userId === "1") {
                document.getElementById("span1").style.display = "none";
                document.getElementById("span2").style.display = "none";
                document.getElementById("span3").style.display = "inline-block";
            } else {
                $.get("../UserServlet?action=getJsonById&id=" + userId, function (date) {
                    user = eval(date)
                    document.getElementById("Name").innerText = date["username"];
                }, "JSON");
                document.getElementById("span1").style.display = "none";
                document.getElementById("span2").style.display = "inline-block";
                document.getElementById("span3").style.display = "none";
            }
        }
        noticeDetail();
    })

    function noticeDetail() {
        $.get("../NoticeServlet?action=getById&id=" + localStorage.getItem("noticeId"), function (data) {
            document.getElementById("noticeDetailName").innerText = "公告:"+data["noticeName"]
            document.getElementById("noticeDetailInner").innerText = data["noticeDetail"]
            document.getElementById("noticeDetailDate").innerText = "发布日期:"+data["noticeDate"]
        }, "JSON");
    }

    function back() {
        localStorage.removeItem("noticeId");
        window.location = "GG.html";
    }

    function selectGoods() {
        var like = document.getElementById("like").value;
        localStorage.setItem("like",like);
        window.location="Select.html";
    }
</script>
</html>