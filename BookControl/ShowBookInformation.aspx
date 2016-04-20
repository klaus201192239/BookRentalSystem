<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShowBookInformation.aspx.cs" Inherits="ShowBookInformation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
         body{ width:100%; margin:0px; padding:0px;}
        .container{ 
            width:84%; 
            margin-left:7%; margin-right:7%; margin-top:0px; padding:10px; 
            border:1px solid #333;
            height:880px;
        }

        .footer{ text-align:center; font-size:12px;}
        .footer p{ margin-top:10px;}
        
        .title{ font-size:80px; font-weight:bold; text-align:center; font-family:@楷体;}
        .welcome{ font-size:40px; text-align:center; font-weight:bolder;}
        .in_right{ float:right;
                    line-height:40px; font-size:20px; text-align:right; 
                    height:40px;
                    color:#333;
        }
        .in_right li{
            float:left;
            list-style:none;
            margin:0px 13px;
        }
            .in_right a{
                color:#333; text-decoration:none;
                font-weight:bolder;
            }
                .in_right a:hover {
                    color:#ffd800;
                    text-decoration:underline;
                }
        .side {
            list-style:none;
        }
        .side_frame { 
            height:30px;
            line-height:30px;  
            font-size:15px;
            text-align:left;
            margin:15px 0px;
        }
        .my_table {
            margin-left:100px;
        }
            .my_table td {
                padding:10px 0px;
                margin:10px 0px;
                
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <div style="width:100%;height:200px;background-image:url(images/1.jpg)">
           <div class="title">图书租赁管理系统</div><br />
           <div class="welcome">欢迎您的光临</div>
            <div class="in_right">
                
                
           <asp:LinkButton ID="linbt" runat="server" Text="管理员登录入口" OnClick="Entry"></asp:LinkButton>
            <asp:HyperLink ID="linf" runat="server" Text="返回主页面" NavigateUrl="~/Main.aspx"></asp:HyperLink>
            </div>
       </div>
        <div style="background-image:url(images/0659be0bed42a61db0351df3.png); font-weight:bolder;">
        <div style="width:100%;height:140px; margin-left:100px;">
            <div style="margin-left:-50px; padding-top:15px;">馆藏书目简单查询：</div>
            <p>请输入所查图书的书名或ISBN编号：</p>
            <asp:TextBox ID="SearchName" runat="server"></asp:TextBox>
            &nbsp&nbsp&nbsp
            <asp:Button ID="bt1" runat="server" Text="开始检索" OnClick="Rearch" />
            <br />
            <asp:Label ID="labe" runat="server" Text="未能查询到您所需要的图书" Visible="false"></asp:Label>
        </div>
        <div style="width:100%;height:500px">
            <p style="margin-left:50px;">查询图书详细信息：</p>
            <table class="my_table">
                <tr>
                    <td>图书名称：</td>
                    <td><asp:Label ID="bname" runat="server"></asp:Label></td>
                </tr>
                 <tr>
                    <td>ISBN号码：</td>
                    <td><asp:Label ID="isbnid" runat="server"></asp:Label></td>
                </tr>
                 <tr>
                    <td>所属类别：</td>
                    <td><asp:Label ID="classdrop" runat="server" ></asp:Label></td>
                </tr>               
                 <tr>
                    <td>出版社：</td>
                    <td><asp:Label ID="pub" runat="server"></asp:Label></td>
                </tr>
                 <tr>
                    <td>出租价格：</td>
                    <td><asp:Label ID="rprice" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>馆藏数量：</td>
                    <td><asp:Label ID="bnumber" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>库存数量：</td>
                    <td><asp:Label ID="lnum" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>借阅次数：</td>
                    <td><asp:Label ID="count" runat="server"></asp:Label></td>
                </tr>
            </table>
        </div>
            
    </div>
        </div>
    </form>
</body>
</html>
