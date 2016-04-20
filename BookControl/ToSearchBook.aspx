<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ToSearchBook.aspx.cs" Inherits="ToSearchBook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
        .this_page_table {
            
        }
            .this_page_table td {
                width:150px;
                height:20px;
               
            }
    </style>
    <div style="width:100%;height:100%">
        <div style="width:100%;height:20%">
            <br />
            <p>请输入所要查找的图书ISBN或图书名称:</p>
            <asp:TextBox ID="researchname" runat="server"></asp:TextBox>
            &nbsp&nbsp
            <asp:Button ID="bt1" runat="server" Text="开始检索" OnClick="Research" />
            <br />
            <asp:Label ID="LABEL" runat="server" Text="对不起，未能查询到您所要求的图书信息" Visible="false"></asp:Label>
        </div>
        <div style="width:100%;height:80%">
            <br />
            <br />
            <table class="this_page_table">
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
                    <td>馆藏数量：</td>
                    <td><asp:Label ID="bnumber" runat="server"></asp:Label></td>
                </tr>
                 <tr>
                    <td>出版社：</td>
                    <td><asp:Label ID="pub" runat="server"></asp:Label></td>
                </tr>
                 <tr>
                    <td>上架时间：</td>
                    <td><asp:Label ID="time" runat="server"></asp:Label></td>
                </tr>
                 <tr>
                    <td>购买价格：</td>
                    <td><asp:Label ID="bprice" runat="server"></asp:Label></td>
                </tr>
                 <tr>
                    <td>出租价格：</td>
                    <td><asp:Label ID="rprice" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>出租数量：</td>
                    <td><asp:Label ID="rnum" runat="server"></asp:Label></td>
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
            <asp:Button ID="dele" runat="server" Text="删除该图书信息" OnClick="DeleBook" Enabled="true"/>&nbsp&nbsp
            <asp:Button ID="Button1" runat="server" Text="修改该图书信息" OnClick="ChangeBook" Enabled="true"/>
        </div>
    </div>
</asp:Content>

