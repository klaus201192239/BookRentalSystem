<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="LendBookaspx.aspx.cs" Inherits="LendBookaspx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
        td {
            width:130px;
        }
    </style>
    <div style="width:100%;height:100%">
        <div style="width:100%;height:300px">
            请选择所要出租的图书：<br />
            图书类别：<asp:DropDownList ID="Clas" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ClassChanged"></asp:DropDownList>&nbsp&nbsp
            ISBN号码：<asp:DropDownList ID="isbn" runat="server"></asp:DropDownList>&nbsp&nbsp
            <asp:Button ID="dele" runat="server" Text="查找图书信息" OnClick="SearchBook" />
            <br />
            <table style="font-weight:bold; font-size:14px;">
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
        </div>
        <div style="width:100%;height:300px">
            <p>
                请输入租借图书的会员卡号：
                <asp:TextBox ID="car" runat="server"></asp:TextBox>
                &nbsp&nbsp
                <asp:Button ID="person" runat="server" Text="查询会员信息" OnClick="SearchPerson" />
            </p>
            <table>
                <tr>
                    <td>会员姓名：</td>
                    <td><asp:Label ID="Label1" runat="server"></asp:Label> </td>
                    
                </tr>
                <tr>
                    <td>卡号：</td>
                    <td><asp:Label ID="Label2" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>联系电话：</td>
                    <td><asp:Label ID="Label3" runat="server"></asp:Label></td>
                     
                </tr>
                <tr>
                    <td>联系地址：</td>
                    <td><asp:Label ID="Label4" runat="server"></asp:Label></td>
                </tr>
                 <tr>
                    <td>当前租借数量：</td>
                    <td><asp:Label ID="Label5" runat="server"></asp:Label></td>
                     
                </tr>
                <tr>
                     <td>总计租借次数：</td>
                    <td><asp:Label ID="Label6" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>当前帐户余额：</td>
                    <td><asp:Label ID="Label7" runat="server"></asp:Label></td>
                </tr>
            </table>
            <br />
            <asp:Button ID="lend" runat="server" Text="确认租借该图书" OnClick="LendOk"  Enabled="true"/>
        </div>
    </div>
</asp:Content>

