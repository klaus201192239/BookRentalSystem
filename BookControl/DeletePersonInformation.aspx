<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DeletePersonInformation.aspx.cs" Inherits="DeletePersonInformation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="width:100%;height:100%">
        <div style="width:100%;height:200px">
            <p>请输入所要删除的会员卡号：</p>
            <asp:TextBox ID="TextBox" runat="server"></asp:TextBox>
            &nbsp&nbsp&nbsp
            <asp:Button ID="bt1" runat="server" Text="检索该会员" OnClick="Search" />
            <p><asp:Label ID="label" runat="server" Text="该会员不存在" Visible="false"></asp:Label></p>
        </div>
        <div style="width:100%;height:400px">
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
            <p><asp:Button ID="bt2" runat="server" Text="确认删除该会员信息" OnClick="DeleteOk" /> </p>
        </div>
    </div>
</asp:Content>

