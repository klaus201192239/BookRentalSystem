<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Main.aspx.cs" Inherits="Main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        body{ width:100%; margin:0px; padding:0px;}
        .container{ width:84%; margin-left:7%; margin-right:7%; margin-top:0px; padding:10px; border:1px solid #333;}

        .footer{ text-align:center; font-size:12px;}
        .footer p{ margin-top:10px;}
        
        .title{ font-size:80px; font-weight:bold; text-align:center; font-family:@楷体;}
        .welcome{ font-size:40px; text-align:left; font-weight:bolder; float:left; color:#46ff06;}
        .in_right{ width:200px; float:right; line-height:40px; font-size:20px;}
        .in_right li{
            float:left;
            list-style:none;
            margin:0px 13px;
        }
            .in_right a{
                color:#333; text-decoration:none;
            }
                .in_right a:hover {
                    color:#ffd800;
                    text-decoration:underline;
                }
        
        .side_frame{ margin-left:0px; margin-top:20px; list-style:none; width:100%; text-align:center; font-size:30px; font-weight:bolder; font-family:@华文楷体; color:#333;}
        
        .side_frame li{ height:80px; width:100%; vertical-align:middle; line-height:70px; text-align:center; background-image:url(images/按钮背景图片素材-黄211-78.png); background-repeat:no-repeat;}

        
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
       <div style="width:100%; height:170px;background-image:url(images/1.jpg)">
           <div class="title">图书租赁管理系统</div>
           <div class="welcome">欢迎您的光临</div>
           <br />
           <br />
           <div class="in_right">
                <asp:LinkButton ID="linbt" runat="server" Text="管理员登录入口" OnClick="Entry"></asp:LinkButton>
           </div>
       </div>
        <hr />
       
        <div style="width:100%;height:200px; text-align:center; background-image:url(images/Desert.jpg)">
            <br />
            <p style="font-weight:bold; font-size:20px;">馆藏书目简单查询：</p>
            <p>请输入所查图书的书名或ISBN编号：
                <asp:TextBox ID="SearchName" runat="server"></asp:TextBox>
                &nbsp&nbsp&nbsp
                <asp:Button ID="bt1" runat="server" Text="开始检索" OnClick="Rearch" />
            </p>
        </div>
        <div style=" background-image:url(images/0659be0bed42a61db0351df3.png);">
        <div style="width:100%;height:500px;">
            <table style="border:solid 1px green;width:100%">
	            <tr>
		            <td style="background-color:Green" colspan="2">
                        <span style="font-size: 14pt; color: #ffffff"><strong>图书借阅排行榜:</strong></span></td>
                </tr>
                <tr>
                    <td colspan="2">
                       <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" OnPageIndexChanged="GridView1_PageIndexChanged" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" HorizontalAlign="Center" >
                            <Columns>
                                <asp:HyperLinkField  HeaderText="图书ISBN编号" DataTextField = "ISBN" DataNavigateUrlFields = "ID" 
                                    DataNavigateUrlFormatString = "ShowBookInformation.aspx?BookId={0}" />
                                 <asp:HyperLinkField  HeaderText="图书名称" DataTextField = "vname" DataNavigateUrlFields = "ID" 
                                    DataNavigateUrlFormatString = "ShowBookInformation.aspx?BookId={0}" />
                                <asp:BoundField DataField="Classname" HeaderText="所属类别" />
                                <asp:BoundField DataField="Pbulish" HeaderText="出版社" />
                                <asp:BoundField DataField="Rprice" HeaderText="出租价格" />
                                <asp:BoundField DataField="LeftNum" HeaderText="库存数量" />
                                <asp:BoundField DataField="CountBorrow" HeaderText="借阅次数" />
                             </Columns>
                             <PagerSettings FirstPageText="首页" LastPageText="最后一页" Mode="NextPreviousFirstLast"
                                NextPageText="下一页" PreviousPageText="上一页" />
                             <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                             <RowStyle BackColor="White" ForeColor="#330099" />
                             <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                             <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" Wrap="True" />
                             <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                       </asp:GridView>
                    </td>
                </tr>
                <tr>
                   <td style="text-align: left">
                       每页显示
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                             <asp:ListItem>10</asp:ListItem>
                             <asp:ListItem>20</asp:ListItem>
                             <asp:ListItem>30</asp:ListItem>
                             <asp:ListItem>40</asp:ListItem>
                             <asp:ListItem>50</asp:ListItem>
                        </asp:DropDownList>条记录</td>
                    <td style="text-align: right">
                    <asp:Label ID="lcurr" runat="server"></asp:Label></td>
                </tr>
            </table>

        </div>
        <div style="width:100%;height:100px" class="footer">
            <p>图书租赁系统版权归本人所有</p>
            <p>使用IE浏览器使用本系统效果更佳</p>
        </div>
            </div>


          </div>
        
      
    </form>
</body>
</html>
