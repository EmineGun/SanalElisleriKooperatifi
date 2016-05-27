<%@ Control Language="C#" AutoEventWireup="true" CodeFile="orta.ascx.cs" Inherits="bloklar_orta" %>
<%@ Register src="sonurunler.ascx" tagname="sonurunler" tagprefix="uc1" %>


<%@ Register src="vitrin.ascx" tagname="vitrin" tagprefix="uc2" %>
<uc2:vitrin ID="vitrin1" runat="server" />


<uc1:sonurunler ID="sonurunler1" runat="server" />

<asp:Label ID="Label1" runat="server"></asp:Label>


