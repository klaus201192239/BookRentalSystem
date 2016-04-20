<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SearchPersonInformation.aspx.cs" Inherits="SearchPersonInformation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <style type="text/css">
        .this_page_table {
            text-align:left;font-size:12px;
        }
         .this_page_table td{width:130px;line-height:25px;}
    </style>
    <div style="width:100%;height:100%">
        <div style="width:100%;height:130px;padding-top:30px;">
            <p>请输入所要查询的会员卡号：</p>
            <asp:TextBox ID="TextBox" runat="server"></asp:TextBox>
            &nbsp&nbsp&nbsp
            <asp:Button ID="bt1" runat="server" Text="检索该会员" OnClick="Search" />
            <p><asp:Label ID="label" runat="server" Text="该会员不存在" Visible="false"></asp:Label></p>
        </div>
        <div style="width:100%;height:400px;padding-top:20px;">
            <table class="this_page_table" style="font-size:14px;">
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
            <p>
                <asp:Button ID="btc" runat="server" Text="修改会员信息" OnClick="Change" />
                <asp:Button ID="btd" runat="server" Text="删除会员信息" OnClick="Dele" />
            </p>
        </div>
    </div>
</asp:Content>

