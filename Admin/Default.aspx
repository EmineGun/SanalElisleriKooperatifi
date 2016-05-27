<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1
        {
            width: 102px;
        }
        .auto-style2
        {
            width: 221px;
        }
    </style>



</head>
<body>
    <form id="form1" runat="server">
    
        <table style="width:100%;">
            <tr>
                <td class="auto-style1">Yönetici Adı:</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtYoneticiAd" runat="server" Width="241px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtYoneticiAd" ErrorMessage="Boş Geçmeyiniz." ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Şifre:</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtSifre" runat="server" TextMode="Password" Width="240px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtSifre" ErrorMessage="Boş Geçmeyiniz." ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style2">
                    <asp:Button ID="btngiris" runat="server" OnClick="btngiris_Click" Text="GİRİŞ" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style2">
                    <asp:Label ID="lblDurum" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    
  <%--      <a class="hlink" href="javascript:onClick=windows.print()"> YAZDIR</a>
    --%>
     

    
    </form>
</body>
</html>
