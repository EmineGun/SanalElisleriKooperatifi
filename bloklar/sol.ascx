<%@ Control Language="C#" AutoEventWireup="true" CodeFile="sol.ascx.cs" Inherits="bloklar_sol" %>
<%@ Register Src="~/bloklar/kategoriler.ascx" TagPrefix="uc1" TagName="kategoriler" %>

<%@ Register src="kampanya.ascx" tagname="kampanya" tagprefix="uc2" %>

<uc1:kategoriler runat="server" ID="kategoriler" />
<p>
    <br />
    <asp:Label ID="Label1" runat="server"></asp:Label>
</p>
<uc2:kampanya ID="kampanya1" runat="server" />

