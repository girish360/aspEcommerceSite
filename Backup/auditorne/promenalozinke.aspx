<%@ Page Title="" Language="C#" MasterPageFile="~/glavna.Master" AutoEventWireup="true" CodeBehind="promenalozinke.aspx.cs" Inherits="auditorne.promenalozinke" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="centralniDeo" runat="server">
<asp:ChangePassword ID="ChangePassword" runat="server" 
    CancelButtonText="Otkaži" ChangePasswordButtonText="Promeni" 
    ChangePasswordTitleText="Promeni lozinku" 
    ConfirmNewPasswordLabelText="Potvrdi novu lozinku:" 
    ContinueButtonText="Nastavi" CssClass="table-center" 
    NewPasswordLabelText="Nova lozinka:" PasswordLabelText="Trenutna lozinka:" 
    SuccessText="Vaša lozinka je uspešno promenjena." 
    SuccessTitleText="Postupak promene lozinke je završen." 
    UserNameLabelText="Korisnicko ime:" 
        ConfirmPasswordCompareErrorMessage="Polje Potvrdi lozinku mora da ima istu vrednost kao i polje Nova lozinka." 
        ConfirmPasswordRequiredErrorMessage="Polje Potvrdi lozinku je obavezno." 
        NewPasswordRegularExpressionErrorMessage="Potrebno je da unesete drugu lozinku" 
        NewPasswordRequiredErrorMessage="Polja Nova lozinka je obavezno." 
        PasswordRequiredErrorMessage="Polje lozinka je obavezno." 
        UserNameRequiredErrorMessage="Polje Korisnicko ime je obavezno.">
        <TextBoxStyle CssClass="text-box" />
    </asp:ChangePassword>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="levaStrana" runat="server">
</asp:Content>
