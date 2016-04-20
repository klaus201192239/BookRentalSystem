<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ChangePersonInformation.aspx.cs" Inherits="ChangePersonInformation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
        .this_page_table{ text-align:center; border:0px; padding:10px;}
        .this_page_table tr{height:30px;}
    </style>
    <div style="width:100%;height:100%">
        
        <div style="width:100%;height:500px;padding-top:100px;">
            <table  class="this_page_table" >
                <tr>
                    <td>会员姓名：</td>
                    <td><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox> </td>
                    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox1" ErrorMessage="不能为空"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td>卡号：</td>
                    <td><asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
                    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="不能为空"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td>联系电话：</td>
                    <td><asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
                    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox3" ErrorMessage="不能为空"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td>联系地址：</td>
                    <td><asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></td>
                    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="不能为空"></asp:RequiredFieldValidator></td>
                </tr>
                 <tr>
                    <td>当前租借数量：</td>
                    <td><asp:Label ID="Label1" runat="server"></asp:Label></td>
                     <td></td>
                </tr>
                 <tr>
                    <td>总计租借次数：</td>
                    <td><asp:Label ID="Label2" runat="server"></asp:Label></td>
                     <td></td>
                </tr>
                <tr>
                    <td>当前帐户余额：</td>
                    <td><asp:TextBox ID="TextBox7" runat="server"></asp:TextBox></td>
                    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox7" ErrorMessage="不能为空"></asp:RequiredFieldValidator></td>
                </tr>
                
            </table>
             <div style="text-align:right; width:290px; margin-left:auto; margin-right:auto; border:0px;"><asp:Button ID="bt2" runat="server" Text="确认修改该会员信息" OnClick="ChangOk" /></div>
        </div>
    </div>
</asp:Content>


