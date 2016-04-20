<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddBookInformation.aspx.cs" Inherits="AddBookInformation" %>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="width:100%;height:100%">
         
        <div style="width:100%;height:400px">
            <br />
            
            <table style="margin-left:20%; margin-top:30px; border:0px; text-align:right;">
                <tr style="text-align:center; height:60px; font-size:22px;">
                    <td colspan="2">
                        添加图书信息：
                    </td>
                </tr>
                <tr>
                    <td>图书名称：</td>
                    <td><asp:TextBox ID="bname" runat="server"></asp:TextBox></td><td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="bname" ErrorMessage="不能为空"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                 <tr>
                    <td>ISBN号码：</td>
                    <td><asp:TextBox ID="isbnid" runat="server"></asp:TextBox></td><td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="isbnid" ErrorMessage="不能为空"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                 <tr>
                    <td>所属类别：</td>
                    <td><asp:DropDownList ID="classdrop" runat="server" Height="20px" Width="148px" ></asp:DropDownList></td>
                     <td></td>
                </tr>
                 <tr>
                    <td>馆藏数量：</td>
                    <td><asp:TextBox ID="bnumber" runat="server"></asp:TextBox></td><td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="bnumber" ErrorMessage="不能为空"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                 <tr>
                    <td>出版社：</td>
                    <td><asp:TextBox ID="pub" runat="server"></asp:TextBox></td><td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="pub" ErrorMessage="不能为空"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                 <tr>
                    <td>购买价格：</td>
                    <td><asp:TextBox ID="bprice" runat="server"></asp:TextBox></td><td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="bprice" ErrorMessage="不能为空"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                 <tr>
                    <td>出租价格：</td>
                    <td><asp:TextBox ID="rprice" runat="server"></asp:TextBox></td><td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="rprice" ErrorMessage="不能为空"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr style=" height:45px;">
                    <td colspan="2">
                        <asp:Button ID="bt2" runat="server" Text="确认添加图书信息" OnClick="AddOne" CssClass="font-size:20px;" />
                    </td>
                </tr>
            </table>
            <p></p>
        </div>
    </div>
</asp:Content>


