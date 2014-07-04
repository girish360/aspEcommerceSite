<%@ Page Title="Početna" Language="C#" MasterPageFile="~/glavna.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="auditorne.index" %>
<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="ContentCentralniDeo" ContentPlaceHolderID="centralniDeo" runat="server">
<div class="post">
	<h1 class="title"><a href="#" id="linkNaslov" runat="server"></a></h1>
				<p class="meta">Objavio <a href="#">Neko</a><span id="datum" runat="server"></span>
					&nbsp;&bull;&nbsp; <a href="#" class="comments">Komentari(10)</a> &nbsp;&bull;&nbsp; <a href="#" class="permalink">Pročitaj više</a></p>
				<div class="entry">
					<p>This is <strong>Hot Air Balloons</strong>, a free, fully standards-compliant CSS template designed by <a href="http://www.freecsstemplates.org">FCT</a>. The photo used in this design is from <a href="http://www.pdphoto.org/">PDPhoto.rog</a>. This free template is released under a <a href="http://creativecommons.org/licenses/by/2.5/">Creative Commons Attributions 2.5</a> license, so you’re pretty much free to do whatever you want with it (even use it commercially) provided you keep the links in the footer intact. Aside from that, have fun with it :)</p>
					<p>Sed lacus. Donec lectus. Nullam pretium nibh ut turpis. Nam bibendum. In nulla tortor, elementum ipsum. Proin imperdiet est. Phasellus dapibus semper urna. Pellentesque ornare, orci in felis. Donec ut ante. In id eros. Suspendisse lacus turpis, cursus egestas at sem.</p>
				</div>
			</div><!-- jedan post -->
</asp:Content>
<asp:Content ID="ContentLevaStrana" ContentPlaceHolderID="levaStrana" runat="server">
<ul>
   <li><h2>Kategorije</h2></li>
   <li id="listaKategorija" runat="server"></li>
</ul>
<div id="reklame">
  <h2>Reklame</h2>
    <asp:AdRotator ID="AdRotatorReklame" runat="server" DataSourceID="XmlDataSourceReklame" />
    <asp:XmlDataSource ID="XmlDataSourceReklame" runat="server" DataFile="~/reklame.xml"></asp:XmlDataSource>
</div>
</asp:Content>
