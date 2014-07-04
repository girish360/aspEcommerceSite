<%@ Page Title="Kontakt" Language="C#" MasterPageFile="~/Glavna.Master" AutoEventWireup="true" CodeBehind="kontakt.aspx.cs" Inherits="aspsajt.Kontakt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function ValidacijaOsoba(objSource, objArgs) {
            if (objArgs.Value != "0") {
                objArgs.IsValid = true;
            } else {
                objArgs.IsValid = false;
            }
        }

        function ValidacijaPoruka(objSource, objArgs) {
            if (objArgs.Value.length > 20) {
                objArgs.IsValid = true;
            } else {
                objArgs.IsValid = false;
            }
        }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderCenterRight" runat="server">
    <table style="width: 100%;">
        <tr>
            <td>Ime i prezime: </td>
            <td>
                <asp:TextBox ID="TextBoxImePrezime" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxImePrezime" ErrorMessage="Morate uneti ime i prezime!">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxImePrezime" ErrorMessage="Pogresno uneto ime i prezime!" ValidationExpression="^[A-Z][a-z]{2,}\s[A-Z][a-z]{2,}$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>Tema: </td>
            <td>
                <asp:TextBox ID="TextBoxTema" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBoxTema" ErrorMessage="Pogresan format teme!" ValidationExpression="^[A-Z][a-z]{2,}$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>Email:</td>
            <td>
                <asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxEmail" ErrorMessage="Morate uneti email!">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBoxEmail" ErrorMessage="Format emaila nije dobar!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>Razlog: </td>
            <td>
                <asp:DropDownList ID="DropDownListRazlog" runat="server">
                    <asp:ListItem>Izaberi...</asp:ListItem>
                    <asp:ListItem>Predlog</asp:ListItem>
                    <asp:ListItem>Saradnja</asp:ListItem>
                    <asp:ListItem>Osalo</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DropDownListRazlog" ErrorMessage="Morate izabrati razlog!" InitialValue="Izaberi...">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Vasa poruka: </td>
            <td>
                <asp:TextBox ID="TextBoxPoruka" runat="server" TextMode="MultiLine"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBoxPoruka" ErrorMessage="Morate uneti tekst poruke!">*</asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator1" runat="server" 
                    ErrorMessage="Morate uneti najmanje 20 karaktera !!!" Text="*" 
                    ControlToValidate="TextBoxPoruka" 
                    onservervalidate="CustomValidator1_ServerValidate" ClientValidationFunction="ValidacijaPoruka"></asp:CustomValidator> 
            </td>
        </tr>
        <tr>
            <td>Da li zelite kopiju na email: </td>
            <td>
                <asp:DropDownList ID="DropDownListPosaljiKopiju" runat="server">
                    <asp:ListItem>Da</asp:ListItem>
                    <asp:ListItem>Ne</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="3" align="center">
                <asp:Button ID="ButtonKontaktPosalji" runat="server" Text="Posalji" OnClick="ButtonKontaktPosalji_Click" />
                <asp:Button ID="ButtonKontaktObrisi" runat="server" Text="Obrisi" CausesValidation="False" OnClick="ButtonKontaktObrisi_Click" />

            </td>
            
        </tr>
        <tr>
            <td colspan="3" align="center">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" />

            </td>
            
        </tr>
    </table>
</asp:Content>
