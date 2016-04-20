<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="NShowNoGet.aspx.cs" Inherits="NShowNoGet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="border:solid 1px green;width:100%">
	            <tr>
		            <td style="background-color:Green" colspan="2">
                        <span style="font-size: 14pt; color: #ffffff"><strong>非会员借书未还情况:</strong></span></td>
                </tr>
                <tr>
                    <td colspan="2">
                       <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" OnPageIndexChanged="GridView1_PageIndexChanged" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" HorizontalAlign="Center" >
                            <Columns>
                                <asp:BoundField  HeaderText="租借人姓名" DataField = "RentName" />
                                <asp:BoundField  HeaderText="证件号码" DataField = "Idcard" />
                                <asp:BoundField  HeaderText="联系电话" DataField = "Phone" />
                                 <asp:BoundField  HeaderText="图书名称" DataField = "vname" />
                                <asp:BoundField DataField="ISBN" HeaderText="ISBN号" />
                                <asp:BoundField DataField="Rprice" HeaderText="出租价格" />
                                <asp:BoundField DataField="LeftNum" HeaderText="库存数量" />
                                <asp:BoundField DataField="Renttime" HeaderText="借阅时间" />
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
</asp:Content>

