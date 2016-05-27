<%@ Control Language="C#" AutoEventWireup="true" CodeFile="sag.ascx.cs" Inherits="bloklar_sag" %>
<%@ Register Src="~/bloklar/uyegiris.ascx" TagPrefix="uc1" TagName="uyegiris" %>

<%@ Register src="sepetim.ascx" tagname="sepetim" tagprefix="uc2" %>

<uc1:uyegiris runat="server" ID="uyegiris" />
<br />
<uc2:sepetim ID="sepetim1" runat="server" />




<asp:Label ID="Label1" runat="server"></asp:Label>





