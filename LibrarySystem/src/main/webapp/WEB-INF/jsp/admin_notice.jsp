<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>公告管理</title>
    <style>
        div.head1 {
            margin: 20px 0px 40px 20px;
            font-size: 16px;
            font-weight: bold;
            color: #333333;
        }

        div.head2 {
            color: rgba(217, 0, 27, 0.874509803921569);
        }

        div.head3 {
            width: 840px;
            height: 30px;
            background-color: rgb(215, 215, 215);
            border: 1px rgb(51, 51, 51) solid;
            color: rgb(51, 51, 51);
            font-size: 14px;
            line-height: 30px;
        }

        .spanlx {
            position: absolute;
            left: 60px;
        }

        .spanmc {
            position: absolute;
            left: 400px;
        }

        .spansj {
            position: absolute;
            left: 600px;
        }

        .spancz {
            position: absolute;
            left: 770px;
        }

        .span1 {
            margin-left: 40px;
            margin-right: 300px;
        }

        a.TJ {
            background-color: white;
        }

        a {
            cursor: pointer;
            color: blue;
        }

        a:hover {
            color: red;
        }

    </style>
</head>
<body>
<div class="head1">公告管理</div>
<div class="head2">
    <span class="span1">全部公告:</span><span class="span2"></span>
</div>
<a href="GGTJ.html" class="TJ"><input type="button" value="添加公告"></a>
<div class="head3">
    <span class="spanlx">公告类型</span>
    <span class="spanmc">公告名称</span>
    <span class="spansj">发布时间</span>
    <span class="spancz">操作</span>
</div>
<div id="noticespan"></div>
</body>
</html>
<script src="../js/axios-0.18.0.js"></script>
<script src="../js/js.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        getList(0);
    });

    function getList(noticeType) {
        $.get("../NoticeServlet?action=getByType&noticeType=" + noticeType, function (data) {
            WriteList(eval(data))
        }, "JSON")
    }

    function WriteList(data) {
        var notices = data;
        var html = "";
        for (var i = 0; i < notices.length; i++) {
            html += "<span><a onclick='SetNoticeId(" + notices[i]["noticeId"] + ")' class='spanlx'>" + (notices[i]["noticeType"] == 1 ? "[系统公告]" : "[折扣公告]")+"</a></span>";
            html += "<span class='spanmc'>" + notices[i]["noticeName"] + "</span>";
            html += "<span class='spansj'>" + notices[i]["noticeDate"] + "</span>";
            html += "<span><a onclick='del(" + notices[i]["noticeId"] + ")' class='spancz'>删除</a></span><br><br>"
        }
        document.getElementById("noticespan").innerHTML = html;

    }

    function SetNoticeId(noticeId) {
        localStorage.setItem("noticeId", noticeId);
        window.location = "GGTJ.html";
    }

    function del(noticeId) {
        if (confirm("确定删除该公告？")) {
            axios({
                method: "POST",
                url: "../NoticeServlet?action=del&id=" + noticeId,
            }).then(function (response) {
                if (response.data === 1) {
                    alert("删除成功")
                    window.location = "GGGL.html"
                } else {
                    alert("删除失败")
                }
            })
        }
    }
</script>