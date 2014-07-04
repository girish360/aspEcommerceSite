<%@ Page Title="Slike" Language="C#" MasterPageFile="~/glavna.Master" AutoEventWireup="true" CodeBehind="slike.aspx.cs" Inherits="auditorne.slike" %>
<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="ContentCentralniDeo" ContentPlaceHolderID="centralniDeo" runat="server">
    <asp:MultiView ID="MultiViewGalerije" runat="server">
      <asp:View ID="ViewGalerija1" runat="server">
        <div class="grupa-slika">
           <div class="slika">
               <asp:Image ID="Slika1" runat="server" ImageUrl="~/slike/destinacija_bec.jpeg" />
               <div class="desc">
                   <asp:Label ID="LabelSlika1" runat="server" Text="Slika 1"></asp:Label>
               </div>
           </div>
           <div class="slika">
               <asp:Image ID="Slika2" runat="server" ImageUrl="~/slike/destinacija_berlin.jpg" />
               <div class="desc">
                   <asp:Label ID="LabelSlika2" runat="server" Text="Slika 2"></asp:Label>
               </div>
           </div>
           <div class="stranicenje">
               <asp:LinkButton ID="LinkButtonNapred1" runat="server" OnClick="SledecaSlika">Napred</asp:LinkButton>
           </div>
        </div>
      </asp:View>
      <asp:View ID="ViewGalerija2" runat="server">
        <div class="grupa-slika">
           <div class="slika">
               <asp:Image ID="Slika3" runat="server" ImageUrl="~/slike/destinacija_zakintos.jpeg" />
               <div class="desc">
                   <asp:Label ID="LabelSlika3" runat="server" Text="Slika 3"></asp:Label>
               </div>
           </div>
           <div class="slika">
               <asp:Image ID="Slika4" runat="server" ImageUrl="~/slike/destinacija_egipat.jpeg" />
               <div class="desc">
                   <asp:Label ID="LabelSlika4" runat="server" Text="Slika 4"></asp:Label>
               </div>
           </div>
           <div class="stranicenje">
               <asp:LinkButton ID="LinkButtonNazad2" runat="server" OnClick="PrethodnaSlika">Nazad</asp:LinkButton>
               <asp:LinkButton ID="LinkButtonNapred2" runat="server" OnClick="SledecaSlika">Napred</asp:LinkButton>
           </div>
        </div>
      </asp:View>
      <asp:View ID="ViewGalerija3" runat="server">
        <div class="grupa-slika">
           <div class="slika">
               <asp:Image ID="Slika5" runat="server" ImageUrl="~/slike/destinacija_istanbul.jpeg" />
               <div class="desc">
                   <asp:Label ID="LabelSlika5" runat="server" Text="Slika 5"></asp:Label>
               </div>
           </div>
           <div class="slika">
               <asp:Image ID="Slika6" runat="server" ImageUrl="~/slike/destinacija_mauricijus.jpeg" />
               <div class="desc">
                   <asp:Label ID="LabelSlika6" runat="server" Text="Slika 6"></asp:Label>
               </div>
           </div>
           <div class="stranicenje">
               <asp:LinkButton ID="LinkButtonNazad3" runat="server" OnClick="PrethodnaSlika">Nazad</asp:LinkButton>
           </div>
        </div>
      </asp:View>
    </asp:MultiView>
</asp:Content>
<asp:Content ID="ContentLevaStrana" ContentPlaceHolderID="levaStrana" runat="server">
Slike strana levi deo
</asp:Content>
