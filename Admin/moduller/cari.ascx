<%@ Control Language="C#" AutoEventWireup="true" CodeFile="cari.ascx.cs" Inherits="Admin_moduller_cari" %>

<table style="width:100%;">
    <tr>
        <td colspan="3" style="text-align: center; font-weight: 700; color: #FFFFFF; background-color: #0033CC">CARİ HAREKET </td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="ID" DataSourceID="LinqDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="100%">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="ReferansNo" HeaderText="ReferansNo" SortExpression="ReferansNo" />
                    <asp:BoundField DataField="EvrakNo" HeaderText="EvrakNo" SortExpression="EvrakNo" />
                    <asp:BoundField DataField="AdSoyad" HeaderText="AdSoyad" SortExpression="AdSoyad" />
                    <asp:BoundField DataField="Tutar" HeaderText="Tutar" SortExpression="Tutar" />
                    <asp:BoundField DataField="Tarih" HeaderText="Tarih" SortExpression="Tarih" />
                    <asp:BoundField DataField="Aciklama" HeaderText="Aciklama" SortExpression="Aciklama" />
                    <asp:ButtonField ButtonType="Button" CommandName="Select" HeaderText="Cari Tablo" ShowHeader="True" Text="CARİ EKLE" />
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
            <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="eticaretDataContext" EntityTypeName="" TableName="CariHarekets">
            </asp:LinqDataSource>
        </td>
    </tr>
    <tr>
        <td colspan="3" style="text-align: center; color: #FFFFFF; font-weight: 700; background-color: #0033CC">CARİ HESAP</td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="BAYİ CARİ EKLE" Width="100%" />
        </td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="ID" DataSourceID="LinqDataSource2" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" Width="100%">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="UyeID" HeaderText="UyeID" SortExpression="UyeID" />
                    <asp:BoundField DataField="AdSoyad" HeaderText="AdSoyad" SortExpression="AdSoyad" />
                    <asp:BoundField DataField="Eposta" HeaderText="Eposta" SortExpression="Eposta" />
                    <asp:BoundField DataField="Adres" HeaderText="Adres" SortExpression="Adres" />
                    <asp:BoundField DataField="GSM" HeaderText="GSM" SortExpression="GSM" />
                    <asp:BoundField DataField="Sehir" HeaderText="Sehir" SortExpression="Sehir" />
                    <asp:BoundField DataField="ilce" HeaderText="ilce" SortExpression="ilce" />
                    <asp:BoundField DataField="RiskLimiti" HeaderText="RiskLimiti" SortExpression="RiskLimiti" />
                    <asp:BoundField DataField="BorcuBakiye" HeaderText="BorcuBakiye" SortExpression="BorcuBakiye" />
                    <asp:BoundField DataField="AlacakBakiye" HeaderText="AlacakBakiye" SortExpression="AlacakBakiye" />
                    <asp:BoundField DataField="OdemeSekli" HeaderText="OdemeSekli" SortExpression="OdemeSekli" />
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
            <asp:LinqDataSource ID="LinqDataSource2" runat="server" ContextTypeName="eticaretDataContext" EnableDelete="True" EnableUpdate="True" EntityTypeName="" TableName="Caris">
            </asp:LinqDataSource>
        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:Panel ID="Panel1" runat="server" Visible="False">
                <table style="width:100%;">
                    <tr>
                        <td>UyeID:</td>
                        <td>
                            <asp:Label ID="Label1" runat="server"></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>Ad Soyad:</td>
                        <td>
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="BOŞ GEÇMEYİNİZ" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Eposta:</td>
                        <td>
                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="BOŞ GEÇMEYİNİZ" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Adres:</td>
                        <td>
                            <asp:TextBox ID="TextBox3" runat="server" Height="77px" TextMode="MultiLine" Width="186px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="BOŞ GEÇMEYİNİZ" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>GSM:</td>
                        <td>
                            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="BOŞ GEÇMEYİNİZ" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>İl:</td>
                        <td>
                            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox5" ErrorMessage="BOŞ GEÇMEYİNİZ" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>İlçe:</td>
                        <td>
                            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox6" ErrorMessage="BOŞ GEÇMEYİNİZ" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Risk Limiti:</td>
                        <td>
                            <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox7" ErrorMessage="BOŞ GEÇMEYİNİZ" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Ödeme Şekli:</td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server">
                                <asp:ListItem>Halave/EFT</asp:ListItem>
                                <asp:ListItem>Kredi Kartı</asp:ListItem>
                                <asp:ListItem>Nakit</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>Borç Bakiyesi:</td>
                        <td>
                            <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox8" ErrorMessage="BOŞ GEÇMEYİNİZ" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Alacak Bakiyesi:</td>
                        <td>
                            <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBox9" ErrorMessage="BOŞ GEÇMEYİNİZ" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Button ID="Button1" runat="server" Text="CARİ EKLE" Visible="False" OnClick="Button1_Click" />
                            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="GÜNCELLE" Visible="False" />
                            <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="BAYi EKLE" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </asp:Panel>
        </td>
    </tr>
</table>

