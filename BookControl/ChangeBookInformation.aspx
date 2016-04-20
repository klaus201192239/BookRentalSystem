<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ChangeBookInformation.aspx.cs" Inherits="ChangeBookInformation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
        .this_page_table{ text-align:right;}
            .this_page_table tr {
                height:30px;
            }
            .this_page_table td {
                width:130px;
            }
    </style>
    <div style="width:100%;height:100%">
        
        <div style="width:100%;height:80%">
            <br /><br /><br /><br />
            <table class="this_page_table">
                <tr>
                    <td>图书名称：</td>
                    <td><asp:TextBox ID="bname" runat="server"></asp:TextBox></td>
                    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="bname" ErrorMessage="不能为空"></asp:RequiredFieldValidator></td>
                </tr>
                 <tr>
                    <td>ISBN号码：</td>
                    <td><asp:TextBox ID="isbnid" runat="server"></asp:TextBox></td>
                     <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="isbnid" ErrorMessage="不能为空"></asp:RequiredFieldValidator></td>
                </tr>
                 <tr>
                    <td>所属类别：</td>
                    <td><asp:DropDownList ID="classdrop" runat="server" Height="20px" Width="148px"></asp:DropDownList></td>
                     <td></td>
                </tr>
                 <tr>
                    <td>馆藏数量：</td>
                    <td><asp:TextBox ID="bnumber" runat="server"></asp:TextBox></td>
                     <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="bnumber" ErrorMessage="不能为空"></asp:RequiredFieldValidator></td>
                </tr>
                 <tr>
                    <td>出版社：</td>
                    <td><asp:TextBox ID="pub" runat="server"></asp:TextBox></td>
                     <td><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="pub" ErrorMessage="不能为空"></asp:RequiredFieldValidator></td>
                </tr>
                 <tr>
                    <td>购买价格：</td>
                    <td><asp:TextBox ID="bprice" runat="server"></asp:TextBox></td>
                     <td><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="bprice" ErrorMessage="不能为空"></asp:RequiredFieldValidator></td>
                </tr>
                 <tr>
                    <td>出租价格：</td>
                    <td><asp:TextBox ID="rprice" runat="server"></asp:TextBox></td>
                     <td><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="rprice" ErrorMessage="不能为空"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="chang" runat="server" Text="确认修改该图书信息" OnClick="ChangeBook" />
                    </td>
                </tr>
            </table>
            
        </div>
    </div>
</asp:Content>

