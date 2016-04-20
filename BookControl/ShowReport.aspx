<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ShowReport.aspx.cs" Inherits="ShowReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
        .btn_color {
            background-color:#17e8a1;
            margin:0px;
            padding:0px;
        }

    </style>
    <div style="width:100%;height:100%">
        <div style="text-align:right;">
            <asp:Button ID="bt1" runat="server" Text="年利润统计" OnClick="Year"  CssClass="btn_color"/>
            <asp:Button ID="bt2" runat="server" Text="月利润统计" OnClick="Month"  CssClass="btn_color" />
            <asp:Button ID="bt3" runat="server" Text="日利润统计" OnClick="Day"   CssClass="btn_color"/>
        </div>
        <table style="border:solid 1px green;width:100%">
	            <tr>
		            <td style="background-color:Green" colspan="2">
                        <span style="font-size: 14pt; color: #ffffff"><strong><asp:Label ID="Class" runat="server"></asp:Label></strong></span></td>
                </tr>
                <tr>
                    <td colspan="2">
                       <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" OnPageIndexChanged="GridView1_PageIndexChanged" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" HorizontalAlign="Center" >
                            <Columns>
                                <asp:BoundField DataField="tim" HeaderText="日期" />
                                <asp:BoundField DataField="SP" HeaderText="总收入(元)" />
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
</asp:Content>

