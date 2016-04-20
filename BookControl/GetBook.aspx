<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="GetBook.aspx.cs" Inherits="GetBook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
        .this_page_table{margin:0px;padding:0px;}
            .this_page_table tr {
                margin:0px; padding:0px;
            }
            .this_page_table td{
                margin:0px; padding:0px;
            }
    </style>
    <div style="width:100%;height:100%">
        <div style="margin-left:150px; text-align:left; border:0px;">请选择归还图书信息：</div><br />
        <div style="margin-left:200px; text-align:left; border:0px; line-height:25px;" >
            图书类别：<asp:DropDownList ID="Clas" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ClassChanged"></asp:DropDownList>&nbsp&nbsp
            ISBN号码：<asp:DropDownList ID="isbn" runat="server"></asp:DropDownList>&nbsp&nbsp
        <br />
        请输入借书会员的卡号：<asp:TextBox ID="textbox" runat="server"></asp:TextBox>
        &nbsp&nbsp
        <asp:Button ID="bt1" runat="server" Text="查找借书信息" OnClick="Research" />
        </div>
        <br />
        <table style="border:0;">
            <tr>
                <td style="width:55px;">姓名</td>
                <td style="width:72px;">证件号码</td>
                 <td style="width:90px;">电话</td>
                <td style="width:33px;">IDBN</td>
                 <td style="width:90px;">书名</td>
                <td style="width:90px;">出版社</td>
                 <td style="width:70px;">租借时间</td>
                <td style="width:35px;">操作</td>
            </tr>
        </table>
        <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal" RepeatColumns="1" OnItemCommand="dLGoodsList_ItemCommand">
                 <ItemTemplate>
                    <table>
                        <tr>
                            <td style="width:55px;"><asp:Label ID="Label1" runat="server" Text='<%# Eval("username") %>'></asp:Label></td>
                            <td style="width:72px;"><asp:Label ID="Label2" runat="server" Text='<%# Eval("CardNum") %>'></asp:Label></td>
                            <td style="width:94px;"><asp:Label ID="Label3" runat="server" Text='<%# Eval("tel") %>'></asp:Label></td>
                            <td style="width:38px;"><asp:Label ID="Label4" runat="server" Text='<%# Eval("ISBN") %>'></asp:Label></td>
                            <td style="width:94px;"><asp:Label ID="Label5" runat="server" Text='<%# Eval("vname") %>'></asp:Label></td>
                            <td style="width:94px;"><asp:Label ID="Label6" runat="server" Text='<%# Eval("Pbulish") %>'></asp:Label></td>
                            <td style="width:70px;"><asp:Label ID="Label7" runat="server" Text='<%# Eval("Renttime") %>'></asp:Label></td>
                            <td style="width:35px;"><asp:LinkButton ID="con" runat="server" Text="归还" CommandArgument='<%# Eval("ID") %>'></asp:LinkButton></td>
                        </tr>
                   </table>  
                </ItemTemplate>
        </asp:DataList>
        <table style="border:0px;">
                <tr>
                    <td style="width: 100px">
                        <asp:Label ID="Label7" runat="server" Text="当前页码为：" Font-Size="9pt" Font-Bold="True" ForeColor="SteelBlue" Height="16px" Width="148px"></asp:Label>
                    </td>
                    <td style="width: 100px">
                        [<asp:Label ID="lblPage" runat="server" Font-Size="Small" Text="1"></asp:Label>]
                    </td>
                    <td style="width: 100px">
                        <asp:Label ID="Label6" runat="server" Font-Size="9pt" Text="总页码为：" Font-Bold="True" ForeColor="SteelBlue" Width="105px"></asp:Label>
                    </td>
                    <td style="width: 100px">
                        <asp:Label ID="lblBackPage" runat="server" Font-Size="9pt" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px">
                        <asp:LinkButton ID="lnkbtnOne" runat="server" Font-Size="9pt" ForeColor="Red" OnClick="lnkbtnOne_Click" Width="112px" CausesValidation="False">第一页</asp:LinkButton>
                    </td>
                    <td style="width: 100px">
                        <asp:LinkButton ID="lnkbtnUp" runat="server" Font-Size="9pt" ForeColor="Red" OnClick="lnkbtnUp_Click" Width="66px" CausesValidation="False">上一页</asp:LinkButton>
                    </td>    
                    <td style="width: 100px">
                        <asp:LinkButton ID="lnkbtnNext" runat="server" Font-Size="9pt" ForeColor="Red" OnClick="lnkbtnNext_Click" Width="66px" CausesValidation="False">下一页</asp:LinkButton>
                    </td>
                    <td style="width: 100px">
                        <asp:LinkButton ID="lnkbtnLast" runat="server" Font-Size="9pt" ForeColor="Red" OnClick="lnkbtnLast_Click" Width="99px" CausesValidation="False">最后一页</asp:LinkButton>
                    </td>
                </tr>
            </table>
    </div>
</asp:Content>

