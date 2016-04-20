<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script type="text/javascript">
        function getFocus()
        {
            document.getElementById("txtName").focus;
        }
    </script>
    <style type="text/css">
        .login_body{ margin-top:200px; margin-left:auto; margin-right:auto; padding-top:20px;
                      width:500px; height:200px;
                      font-size:20px;
                      background-image:url(images/1.jpg);
        }
        .title{width:100%;
               text-align:center;
               font-size:40px;
               font-weight:bold;
               background-color:#0094ff;
        }
            .login_body table {
               width:74%; margin-left:auto; margin-right:auto; margin-top:auto;margin-bottom:auto;
            }
            .login_body tr {
                border:1px solid #333;
            }
            .login_body td{ width:100px;}
    </style>
</head>
<body bgcolor="#e5e5e5" onload="getFocus()">
    
    <div class="login_body">
         <form id="form1" runat="server">
             <div class="title">登录</div>
             <br />
             <table>
                 <tr>
                     <td>管理员名称:</td>
                     <td><asp:TextBox ID="txtName" runat="server" Width="127px"></asp:TextBox></td>
                 </tr>
                 <tr>
                     <td>管理员密码:</td>
                     <td>
                         <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" Width="129px">
                         </asp:TextBox>
                     </td>
                 </tr>
                 <tr>
                     <td>&nbsp;</td>
                     <td>
                         &nbsp;
                         <asp:Button ID="btnEntry" runat="server"  Text="确定" Width="46px" OnClick="btnEntry_Click" />
                         <input id="Button2" class="btn_grey" name="Submit2" onclick="window.close();" type="button"value="关闭" />
                        </td>
                     </tr>
             </table>
         </form>
    </div>
    
</body>
</html>

