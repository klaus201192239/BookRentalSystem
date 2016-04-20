<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ClassManage.aspx.cs" Inherits="ClassManage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="width:100%;height:100%">
        <div style="width:100%;height:150px">
            <br /><br /><br />
            <p>增加图书类别：</p>
            <p>
                图书类别名称： &nbsp&nbsp
                <asp:TextBox ID="text" runat="server" ></asp:TextBox>
                &nbsp&nbsp
                <asp:Button ID="bt1" runat="server" Text="确定添加该图书类别" OnClick="AddClass"/>
            </p>
        </div>
        <div style="width:100%;height:400px">
            <table style="border:solid 1px green;width:100%">
	            <tr>
		            <td style="background-color:Green" colspan="2">
                        <span style="font-size: 14pt; color: #ffffff"><strong>图书借阅排行榜:</strong></span></td>
                </tr>
                <tr>
                    <td colspan="2">
                       <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False"
                            AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" 
                           OnPageIndexChanged="GridView1_PageIndexChanged" BackColor="White"
                            BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                           HorizontalAlign="Center" OnRowEditing="RowEditing" OnRowUpdating="RowUpdating" 
                            OnRowCancelingEdit="GCancel" DataKeyNames="ID">
                            <Columns>
                                <asp:BoundField DataField="ID" HeaderText="编号" ReadOnly="true"/>
                                <asp:TemplateField HeaderText="类别名称">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="clname" runat="server" Text='<%#Bind("ClassName") %>'></asp:TextBox> 
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                         <asp:Label ID="labelname" runat="server" Text='<%#Bind("ClassName") %>'></asp:Label> 
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField HeaderText="修改类别名称" ShowEditButton="true" />
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
    </div>
</asp:Content>

