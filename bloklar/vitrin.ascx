<%@ Control Language="C#" AutoEventWireup="true" CodeFile="vitrin.ascx.cs" Inherits="bloklar_vitrin" %>

<script type="text/javascript" src="jquery.min.js"></script>
<script type="text/javascript" src="stepcarousel.js"></script>
<link rel="stylesheet" type="text/css" href="slide.css" />
<script type="text/javascript">

    stepcarousel.setup({
        galleryid: 'mygallery', //id of carousel DIV
        beltclass: 'belt', //class of inner "belt" DIV containing all the panel DIVs
        panelclass: 'panel', //class of panel DIVs each holding content
        autostep: { enable: true, moveby: 1, pause: 3000 },
        panelbehavior: { speed: 500, wraparound: false, wrapbehavior: 'slide', persist: true },
        defaultbuttons: { enable: true, moveby: 1, leftnav: ['left.gif', 20, 125], rightnav: ['right.gif', -40, 125] },
        statusvars: ['statusA', 'statusB', 'statusC'], //register 3 variables that contain current panel (start), current panel (last), and total panels
        contenttype: ['inline'] //content setting ['inline'] or ['ajax', 'path_to_external_file']
    })

</script>


<div id="mygallery" class="stepcarousel">
<table>
    <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
            <div class="belt">
        <div class="panel">
            <a href="<%#Eval("VitrinURL") %>"><img src='vitrinurunleri/<%#Eval("VitrinResim") %>' /></a>

        </div>
    </div>

        </ItemTemplate>
    </asp:Repeater>
    
</table>
    </div>
