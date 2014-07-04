<%@ Page Title="Administracija | Pocetna" Language="C#" MasterPageFile="~/glavna.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="auditorne.adminstrator.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="centralniDeo" runat="server">
  <div class="post">
    <h2>Deo za administraciju</h2>
    <div class="entry">
       <p>Tekst.</p>
    </div>
  </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="levaStrana" runat="server">
  <ul>
    <li><h2>Linkovi</h2></li>
    <li>
      <ul>
        <li><a href="fajl.aspx">Fajlovi</a></li>
        <li><a href="galerija.aspx">Galerija</a></li>
       <li><a href="kategorija.aspx">Kategorija</a></li>
       <li><a href="link.aspx">Linkovi</a></li>
       <li><a href="meni.aspx">Meni</a></li>
       <li><a href="slika.aspx">Slika</a></li>
       <li><a href="strana.aspx">Strana</a></li>
       <li><a href="tipstrane.aspx">TipStrane</a></li>
      </ul>
    </li>
  </ul>
</asp:Content>
