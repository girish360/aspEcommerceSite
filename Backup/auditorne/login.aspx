<%@ Page Title="Login" Language="C#" MasterPageFile="~/glavna.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="auditorne.login" %>
<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="ContentCentralniDeo" ContentPlaceHolderID="centralniDeo" runat="server">
<asp:Login ID="LoginForma" runat="server" CssClass="table-center" 
    FailureText="Neuspešan pokušaj logovanja. Pokušajte ponovo." 
    PasswordLabelText="Lozinka:" RememberMeText="Zapamti me." TitleText="Pristup" 
    UserNameLabelText="Korisnicko ime:" VisibleWhenLoggedIn="False" 
    MembershipProvider="MojProvajder">
        <TextBoxStyle CssClass="text-box" />
        <TitleTextStyle HorizontalAlign="Center" />
    </asp:Login>
</asp:Content>
<asp:Content ID="ContentLevaStrana" ContentPlaceHolderID="levaStrana" runat="server">
Login strana levi deo
</asp:Content>
