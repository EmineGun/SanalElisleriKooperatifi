<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Vitrin.ascx.cs" Inherits="Admin_moduller_Vitrin" %>
<style type="text/css">
    .auto-style1
    {
        color: #FFFFFF;
        font-weight: bold;
    }
    .auto-style2
    {
        width: 116px;
    }
</style>

<table style="width:100%;">
    <tr>
        <td class="auto-style1" colspan="3" style="background-color: #0033CC">VİTRİN EKLE/SİL</td>
    </tr>
    <tr>
        <td class="auto-style2">Vitrin Resmi:</td>
        <td>
            <asp:FileUpload ID="FileUpload1" runat="server" />
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style2">Vitrin URL:</td>
        <td>
            <asp:TextBox ID="txtURL" runat="server" Width="213px"></asp:TextBox>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style2">&nbsp;</td>
        <td>
            <asp:Button ID="btnEkle" runat="server" OnClick="btnEkle_Click" Text="Vitrin Ekle" />
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:Label ID="lblDurum" runat="server"></asp:Label>
        </td>
    </tr>
</table>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
    <Columns>
        <asp:TemplateField HeaderText="ID">
            <ItemTemplate>
                <asp:Label ID="LblID" runat="server" Text='<%#Eval("VitrinID") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Resim">
            <ItemTemplate>
                <%--<asp:Image ID="Image1" runat="server" src='../vitrinurunleri/<%#Eval("VitrinResim") %>' Width="70px" Height="50px" />--%>
                <img src='../vitrinurunleri/<%#Eval("VitrinResim") %>' Width="70px" Height="50px" />

            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="URL">
            <ItemTemplate>
                <asp:Label ID="lblURL" runat="server" Text='<%#Eval("VitrinURL") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Sil">
            <ItemTemplate>
                <asp:ImageButton ID="btnsil" ImageUrl="~/Admin/images/icon_delete.png" runat="server"  CommandArgument='<%#Eval("VitrinID") %>' OnClick="VitrinSil" OnClientClick="return confirm('Silmek istiyor musunuz?')"/>
             </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
    <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
    <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
    <RowStyle BackColor="White" ForeColor="#003399" />
    <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
    <SortedAscendingCellStyle BackColor="#EDF6F6" />
    <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
    <SortedDescendingCellStyle BackColor="#D6DFDF" />
    <SortedDescendingHeaderStyle BackColor="#002876" />
</asp:GridView>

