<%@ Page Title="" Language="C#" MasterPageFile="~/Glavna.Master" AutoEventWireup="true" CodeBehind="promenilozinku.aspx.cs" Inherits="auditorne.promenilozinku" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderCenterRight" runat="server">
    <asp:ChangePassword ID="ChangePassword" runat="server" 
    CancelButtonText="Otkaži" ChangePasswordButtonText="Promeni" 
    ChangePasswordTitleText="Promeni lozinku" 
    ConfirmNewPasswordLabelText="Potvrdi novu lozinku:" 
    ContinueButtonText="Nastavi" NewPasswordLabelText="Nova lozinka:" 
    PasswordLabelText="Trenutna lozinka:" 
    SuccessText="Vaša lozinka je uspešno promenjena." 
    SuccessTitleText="Postupak promene lozinke je završen." 
    UserNameLabelText="Korisnicko ime:" 
        ConfirmPasswordCompareErrorMessage="Polje Potvrdi lozinku mora da ima istu vrednost kao i polje Nova lozinka." 
        ConfirmPasswordRequiredErrorMessage="Polje Potvrdi lozinku je obavezno." 
        NewPasswordRegularExpressionErrorMessage="Potrebno je da unesete drugu lozinku" 
        NewPasswordRequiredErrorMessage="Polja Nova lozinka je obavezno." 
        PasswordRequiredErrorMessage="Polje lozinka je obavezno." 
        UserNameRequiredErrorMessage="Polje Korisnicko ime je obavezno.">
    </asp:ChangePassword>
</asp:Content>
