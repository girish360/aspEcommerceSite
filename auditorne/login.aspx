<%@ Page Title="" Language="C#" MasterPageFile="~/Glavna.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="aspsajt.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderCenterRight" runat="server">
    <asp:Login ID="Login1" runat="server" CreateUserText="Registruj se!" CreateUserUrl="~/register.aspx"
        FailureText="Neuspešan pokušaj logovanja. Pokušajte ponovo." 
        PasswordLabelText="Lozinka:" RememberMeText="Zapamti me."
        UserNameLabelText="Korisnicko ime:" VisibleWhenLoggedIn="False" 
        MembershipProvider="MojProvajder" LoginButtonText="Uloguj se" TitleText="Logovanje">
    </asp:Login>
    
</asp:Content>
