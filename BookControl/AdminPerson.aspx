<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminPerson.aspx.cs" Inherits="AdminPerson" %>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="border:solid 1px green;width:100%">
	            <tr>
		            <td style="background-color:Green" colspan="2">
                        <span style="font-size: 14pt; color: #ffffff"><strong>图书借阅排行榜:</strong></span></td>
                </tr>
                <tr>
                    <td colspan="2">
                       <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" OnPageIndexChanged="GridView1_PageIndexChanged" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" HorizontalAlign="Center" >
                            <Columns>
                                <asp:HyperLinkField  HeaderText="图书ISBN编号" DataTextField = "ISBN" DataNavigateUrlFields = "ID" 
                                    DataNavigateUrlFormatString = "BookInformation.aspx?BookId={0}" />
                                 <asp:HyperLinkField  HeaderText="图书名称" DataTextField = "vname" DataNavigateUrlFields = "ID" 
                                    DataNavigateUrlFormatString = "BookInformation.aspx?BookId={0}" />
                                <asp:BoundField DataField="Classname" HeaderText="所属类别" />
                                <asp:BoundField DataField="Pbulish" HeaderText="出版社" />
                                <asp:BoundField DataField="Rprice" HeaderText="出租价格" />
                                <asp:BoundField DataField="LeftNum" HeaderText="库存数量" />
                                <asp:BoundField DataField="CountBorrow" HeaderText="借阅次数" />
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

