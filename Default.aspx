<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register src="bloklar/ust.ascx" tagname="ust" tagprefix="uc1" %>
<%@ Register src="bloklar/sag.ascx" tagname="sag" tagprefix="uc2" %>
<%@ Register src="bloklar/sol.ascx" tagname="sol" tagprefix="uc3" %>

<%@ Register src="bloklar/alt.ascx" tagname="alt" tagprefix="uc4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>E-Ticaret</title>
    <link href="temalar/style.css" type="text/css" rel="stylesheet" />
<script src="http://www.paygol.com/micropayment/js/paygol.js" type="text/javascript"></script>

</head>
<body>
    <form id="form1" runat="server">

        <table style="width: 100%; height: 315px;">
            <tr>
                <td colspan="3" style="text-align: center">
                    <uc1:ust ID="ust1" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="width: 20%; vertical-align: top;">
                    <uc3:sol ID="sol1" runat="server" />
                </td>
                <td style="width: 60%; text-align: center; vertical-align:top">
                    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                    <asp:Label ID="lblDurum" runat="server" Visible="False"></asp:Label>
                </td>
                <td style="width: 20%; vertical-align: top;">
                    <uc2:sag ID="sag1" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="vertical-align: top; text-align: center;" colspan="3">
                    <uc4:alt ID="alt1" runat="server" />
                </td>
            </tr>
            </table>
       
        
        <br />
    

    </form>
</body>
</html>
