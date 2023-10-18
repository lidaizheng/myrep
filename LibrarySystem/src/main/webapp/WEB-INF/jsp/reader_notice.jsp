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

        #notice {
            position: relative;
            left: 120px;
            margin-top: 30px;
            width: 1250px;
        }

        .GGLB {
            font-size: 20px;
        }

        .noticeButton {
            border: white 0 solid;
            background-color: white;
            cursor: pointer;
        }

        .noticeButton:hover {
            color: #3498DB;
        }

        .GGBT {
            margin-top: 30px;
            background-color: rgb(244, 244, 244);
            height: 45px;
            line-height: 45px;
            text-indent: 45px;
            font-size: 26px;
        }

        .noticespan1 {
            height: 30px;
            line-height: 30px;
            position: relative;
            left: 50px;
        }

        .noticespan2 {
            height: 30px;
            line-height: 30px;
            position: absolute;
            left: 900px;
        }

        #noticespan {
            height: 600px;
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

<div id="notice">
    <div class="GGLB">公告列表</div>
    <hr>
    <span><input class="noticeButton" type="button" onclick="getList(0);" value="全部公告"></span>
    <span><input class="noticeButton" type="button" onclick="getList(1);" value="系统公告"></span>
    <span><input class="noticeButton" type="button" onclick="getList(2);" value="折扣公告"></span>
    <div class="GGBT">公告标题</div>
    <div id="noticespan"></div>
</div>
<div class="tail"><img src="../css/brand.jpg" class="brandT"><span class="HY">欢迎来到倒霉三兄弟电商平台</span></div>
</body>
<script src="../js/axios-0.18.0.js"></script>
<script src="../js/js.js"></script>
<script>
    var userId = localStorage.getItem("id");
    var user;
    $(document).ready(function () {
        getList(0);
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
    })


    function getList(noticeType) {
        $.get("../NoticeServlet?action=getByType&noticeType=" + noticeType, function (data) {
            WriteList(eval(data));
        }, "JSON");
    }

    function WriteList(notice) {
        var str = "";
        for (var i = 0; i < notice.length; i++) {
            if (notice[i]["noticeType"] === 1) notice[i]["noticeType"] = " [系统公告] ";
            else notice[i]["noticeType"] = " [折扣公告] ";
            str += "<span class='noticespan1'>" + "<a href='JavaScript:noticeDetail(" + notice[i]["noticeId"] + ")'>" + notice[i]["noticeType"] + notice[i]["noticeName"] + "</a></span>";
            str += "<span class='noticespan2'>发布时间:" + notice[i]["noticeDate"] + "</span><br><br>";
        }
        document.getElementById("noticespan").innerHTML = str;
    }

    function noticeDetail(noticeId) {
        localStorage.setItem("noticeId", noticeId);
        window.location = "GGDetailDisplay.html"
    }

    function selectGoods() {
        var like = document.getElementById("like").value;
        localStorage.setItem("like",like);
        window.location="Select.html";
    }
</script>
</html>