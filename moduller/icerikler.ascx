<%@ Control Language="C#" AutoEventWireup="true" CodeFile="icerikler.ascx.cs" Inherits="moduller_icerikler" %>
<%@ Register assembly="CollectionPager" namespace="SiteUtils" tagprefix="cc1" %>
<style type="text/css">




    .auto-style1
    {
        height: 34px;
    }
    .auto-style2
    {
        width: 100%;
        height: 34px;
    }
    </style>
<table cellpadding="0" cellspacing="0" style="width: 100%;">
        <tr>
        <td class="auto-style1">
            <img alt="" src="/temalar/resim/dmt_left.png" /></td>
        <td class="auto-style2" style="background-image: url('/temalar/resim/dmt_bg.gif'); background-repeat: repeat-x; vertical-align: middle; text-align: center"> 
            <asp:Label ID="Label2" runat="server"></asp:Label>
            </td>
        <td class="auto-style1">
            <img alt="" src="/temalar/resim/dmt_right.png" style="height: 34px" /></td>
    </tr>
    <tr>
        <td colspan="3" style="background-color: #CCFFFF; vertical-align: top;">

<asp:FormView ID="FormView1" runat="server">
    <ItemTemplate>
        <%#Eval("Icerik") %>
    </ItemTemplate>

</asp:FormView>

            <asp:Label ID="Label1" runat="server"></asp:Label>
        </td>
    </tr>
</table>











