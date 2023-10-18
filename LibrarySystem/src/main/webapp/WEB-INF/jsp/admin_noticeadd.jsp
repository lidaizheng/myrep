<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>公告添加</title>
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
            margin-bottom: 30px;
        }


        .err {
            color: red;
        }

        .sub {
            position: absolute;
            left: 450px;
        }
        .bc{
            position: absolute;
            left: 450px;
        }

        #box {
            display: inline-block;
            text-align: center;
            margin:0 auto;
        }
    </style>
</head>
<body>
<div id="box">
    <div class="head1" id="head1">公告添加</div>
    <div class="head3"></div>
    <div class="head2">公告名称：</div>
    <input id="noticename" type="text"><br><br>
    <span class="err" id="noticename_err" style="display: none">公告名称输入错误</span>
    <span>公告类型：</span><br>
    <select id="noticetype" name="noticetype" size="1">
        <option value="1">系统公告</option>
        <option value="2">折扣公告</option>
    </select><br>
    <br>
    <span>公告内容：</span><br>
    <textarea cols="30" id="noticedetail" name="noticedetail" rows="10"></textarea><br><br>
    <span class="err" id="noticedetail_err" style="display: none">公告内容输入错误</span>
    <input onclick="check()" type="submit" class="sub" id="sub">
    <input type="button" id="back" onclick="back()" value="返回" class="bc" style="display: none">
</div>
</body>
<script src="../js/axios-0.18.0.js"></script>
<script src="../js/js.js"></script>

<script>
    $(document).ready(function (){
        var noticeId = localStorage.getItem("noticeId");
        localStorage.removeItem("noticeId");
        if (noticeId!==null){
            $.get("../NoticeServlet?action=getById&id=" + noticeId, function (data) {
                Show(eval(data))
            }, "JSON")
        }
    })
    function Show(notice){
        document.getElementById("sub").style.display="none";
        document.getElementById("back").style.display="block";
        $("#noticename").val(notice["noticeName"])
        $("#noticetype").val(notice["noticeType"])
        $("#noticedetail").val(notice["noticeDetail"])
        document.getElementById("noticename").readOnly=true;
        document.getElementById("noticetype").readOnly=true;
        document.getElementById("noticedetail").readOnly=true;
        document.getElementById("head1").innerText="公告查看";
    }

    function back(){
        window.location="GGGL.html";
    }
    var noticenameInput = document.getElementById("noticename");
    noticenameInput.onblur = checknoticename;

    function checknoticename() {
        var noticename = noticenameInput.value.trim();
        var reg = /^\S{1,20}$/;
        var flag = reg.test(noticename);
        if (flag) {
            document.getElementById("noticename_err").style.display = "none";
        } else {
            document.getElementById("noticename_err").style.display = "block";
        }
        return flag;
    }

    var noticedetailInput = document.getElementById("noticedetail");
    noticedetailInput.onblur = checknoticedetail;

    function checknoticedetail() {
        var noticedetail = noticedetailInput.value.trim();
        var reg = /^\S{1,9999}$/;
        var flag = reg.test(noticedetail);
        if (flag) {
            document.getElementById("noticedetail_err").style.display = "none";
        } else {
            document.getElementById("noticedetail_err").style.display = "block";
        }
        return flag;
    }

    function check() {
        checknoticename();
        checknoticedetail();
        if (checknoticename() && checknoticedetail()) {
            var Data = {
                noticename: document.getElementById("noticename").value,
                noticetype: document.getElementById("noticetype").value,
                noticedetail: document.getElementById("noticedetail").value,
            };
            console.log(Data);
            axios({
                method: "post",
                url: "../NoticeServlet?action=insert",
                data: Data,
            }).then(function (response) {
                if (response.data == 1) {
                    alert("公告发布成功");
                    window.location = "GGGL.html";
                } else {
                    alert("发布失败")
                }
            })
        } else {
            alert("请规范输入数据")
        }
    }
</script>
</html>