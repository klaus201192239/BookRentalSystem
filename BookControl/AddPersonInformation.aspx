<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddPersonInformation.aspx.cs" Inherits="AddPersonInformation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="width:100%;height:100%; padding-top:8%;">
        <p>请认真填写新会员的个人信息：</p>
        <table>
            <tr>
                <td>会员姓名：</td>
                <td><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox> </td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="不能为空"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>卡号：</td>
                <td><asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="不能为空"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>联系电话：</td>
                <td><asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="不能为空"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>联系地址：</td>
                <td><asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="不能为空"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>押金：</td>
                <td><asp:TextBox ID="TextBox5" runat="server"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox5" ErrorMessage="不能为空"></asp:RequiredFieldValidator></td>
            </tr>
        </table>
        <p><asp:Button ID="bt1" runat="server" Text="确认添加新会员" OnClick="AddOne" /></p>
    </div>
</asp:Content>


