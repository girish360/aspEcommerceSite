<%@ Page Title="" Language="C#" MasterPageFile="~/Glavna.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="aspsajt.register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderCenterRight" runat="server">
    
    <asp:CreateUserWizard ID="FormaUnesikorisnika" runat="server" 
          AnswerLabelText="Odgovor:" AnswerRequiredErrorMessage="Odgovor je obavezan." 
          CancelButtonText="Otkaži:" CompleteSuccessText="Uspešno ste kreirali korsnika." 
          ConfirmPasswordCompareErrorMessage="Polja za lozinke moraju da imaju istu vrednost." 
          ConfirmPasswordLabelText="Potvrdi lozinku:" 
          ConfirmPasswordRequiredErrorMessage="Polje Potvrdi lozinku je obavezno." 
          ContinueButtonText="Nastavi" CreateUserButtonText="Kreiraj korisnika" 
          CssClass="table-center" 
          DuplicateEmailErrorMessage="Email adresa koju ste naveli trenutno postoji u bazi. Upotrebite drugu." 
          DuplicateUserNameErrorMessage="Unesite drugo korisnicko ime." 
          EmailRegularExpressionErrorMessage="Mail adresa nije u dobrom formatu." 
          EmailRequiredErrorMessage="E-mail je obavezan." 
          FinishCompleteButtonText="Završi" FinishPreviousButtonText="Prethodno" 
          HeaderText="REGISTRACIJA KORISNIKA" 
          InvalidAnswerErrorMessage="Unesite drugi odgovor." 
          InvalidEmailErrorMessage="Email adresa nije u dobrom formatu." 
          InvalidPasswordErrorMessage="Minimalna duzina lozinke je  {0}. Morate uneti barem {1}  specijalni znak" 
          InvalidQuestionErrorMessage="Unesite drugo pitanje." 
          PasswordLabelText="Lozinka:" 
          PasswordRegularExpressionErrorMessage="Unesite drugu lozinku." 
          PasswordRequiredErrorMessage="Lozinka je obavezna." 
          QuestionLabelText="Pitanje:" 
          QuestionRequiredErrorMessage="Pitanje je obavezno." 
          StartNextButtonText="Sledeci" StepNextButtonText="Sledeci" 
          StepPreviousButtonText="Prethodni" 
          UnknownErrorMessage="Vaš nalog nije kreiran.Pokušajte ponovo." 
          UserNameLabelText="Korisnicko ime:" 
          UserNameRequiredErrorMessage="Korisnicko ime je obavezno." 
          oncreateduser="FormaUnesikorisnika_CreatedUser" ContinueDestinationPageUrl="~/login.aspx">
          <TextBoxStyle CssClass="text-box" />
          <WizardSteps>
              <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                  <ContentTemplate>
                      <table style="font-size:100%;">
                          <tr>
                              <td align="center" colspan="2">
                                  &nbsp;</td>
                          </tr>
                          <tr>
                              <td align="right">
                                  <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Korisnicko ime:</asp:Label>
                              </td>
                              <td>
                                  <asp:TextBox ID="UserName" runat="server" CssClass="text-box"></asp:TextBox>
                                  <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                      ControlToValidate="UserName" ErrorMessage="Korisnicko ime je obavezno." 
                                      ToolTip="Korisnicko ime je obavezno." ValidationGroup="FormaUnesikorisnika">*</asp:RequiredFieldValidator>
                              </td>
                          </tr>
                          <tr>
                              <td align="right">
                                  <asp:Label ID="LabelIme" runat="server" AssociatedControlID="TextBoxIme">Ime:</asp:Label>
                              </td>
                              <td>
                                  <asp:TextBox ID="TextBoxIme" runat="server" CssClass="text-box"></asp:TextBox>
                                  <asp:RequiredFieldValidator ID="ImeRequired" runat="server" 
                                      ControlToValidate="TextBoxIme" ErrorMessage="Ime je obavezno." 
                                      ToolTip="Ime je obavezno." ValidationGroup="FormaUnesikorisnika">*</asp:RequiredFieldValidator>
                              </td>
                          </tr>
                          <tr>
                              <td align="right">
                                  <asp:Label ID="LabelPrezime" runat="server" AssociatedControlID="TextBoxPrezime">Prezime:</asp:Label>
                              </td>
                              <td>
                                  <asp:TextBox ID="TextBoxPrezime" runat="server" CssClass="text-box"></asp:TextBox>
                                  <asp:RequiredFieldValidator ID="PrezimeRequired" runat="server" 
                                      ControlToValidate="TextBoxPrezime" ErrorMessage="Prezime je obavezno." 
                                      ToolTip="Prezime je obavezno." ValidationGroup="FormaUnesikorisnika">*</asp:RequiredFieldValidator>
                              </td>
                          </tr>
                          <tr>
                              <td align="right">
                                  <asp:Label ID="LabelTelefon" runat="server" AssociatedControlID="TextBoxTelefon">Telefon:</asp:Label>
                              </td>
                              <td>
                                  <asp:TextBox ID="TextBoxTelefon" runat="server" CssClass="text-box"></asp:TextBox>
                                  <asp:RequiredFieldValidator ID="TelefonRequired" runat="server" 
                                      ControlToValidate="TextBoxTelefon" ErrorMessage="Telefon je obavezan." 
                                      ToolTip="Telefon je obavezan." ValidationGroup="FormaUnesikorisnika">*</asp:RequiredFieldValidator>
                              </td>
                          </tr>
                          <tr>
                              <td align="right">
                                  <asp:Label ID="LabelAdresa" runat="server" AssociatedControlID="TextBoxAdresa">Adresa:</asp:Label>
                              </td>
                              <td>
                                  <asp:TextBox ID="TextBoxAdresa" runat="server" CssClass="text-box"></asp:TextBox>
                                  <asp:RequiredFieldValidator ID="AdresaRequired" runat="server" 
                                      ControlToValidate="TextBoxAdresa" ErrorMessage="Adresa je obavezna." 
                                      ToolTip="Adresa je obavezna." ValidationGroup="FormaUnesikorisnika">*</asp:RequiredFieldValidator>
                              </td>
                          </tr>
                          <tr>
                              <td align="right">
                                  <asp:Label ID="LabelGrad" runat="server" AssociatedControlID="TextBoxGrad">Grad:</asp:Label>
                              </td>
                              <td>
                                  <asp:TextBox ID="TextBoxGrad" runat="server" CssClass="text-box"></asp:TextBox>
                                  <asp:RequiredFieldValidator ID="GradRequired" runat="server" 
                                      ControlToValidate="TextBoxGrad" ErrorMessage="Grad je obavezan." 
                                      ToolTip="Grad je obavezan." ValidationGroup="FormaUnesikorisnika">*</asp:RequiredFieldValidator>
                              </td>
                          </tr>
                          <tr>
                              <td align="right">
                                  <asp:Label ID="LabelPol" runat="server" AssociatedControlID="RadioButtonListPol">Pol:</asp:Label>
                              </td>
                              <td>
                                  <asp:RadioButtonList ID="RadioButtonListPol" runat="server">
                                      <asp:ListItem Value="M">Muški</asp:ListItem>
                                      <asp:ListItem Value="F">Ženski</asp:ListItem>
                                  </asp:RadioButtonList>
                                  <asp:RequiredFieldValidator ID="PolRequired" runat="server" 
                                      ControlToValidate="RadioButtonListPol" ErrorMessage="Morate izabrati pol." 
                                      ToolTip="Morate izabrati pol." ValidationGroup="FormaUnesikorisnika">*</asp:RequiredFieldValidator>
                              </td>
                          </tr>
                          <tr>
                              <td align="right">
                                  <asp:Label ID="LabelDatumRodjenja" runat="server" AssociatedControlID="CalendarDatumRodjenja">Datum rodjenja:</asp:Label>
                              </td>
                              <td>
                                  <asp:Calendar ID="CalendarDatumRodjenja" runat="server"></asp:Calendar>
                                  
                                  
                              </td>
                          </tr>
                          <tr>
                              <td align="right">
                                  <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Lozinka:</asp:Label>
                              </td>
                              <td>
                                  <asp:TextBox ID="Password" runat="server" CssClass="text-box" 
                                      TextMode="Password"></asp:TextBox>
                                  <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                      ControlToValidate="Password" ErrorMessage="Lozinka je obavezna." 
                                      ToolTip="Lozinka je obavezna." ValidationGroup="FormaUnesikorisnika">*</asp:RequiredFieldValidator>
                              </td>
                          </tr>
                          <tr>
                              <td align="right">
                                  <asp:Label ID="ConfirmPasswordLabel" runat="server" 
                                      AssociatedControlID="ConfirmPassword">Potvrdi lozinku:</asp:Label>
                              </td>
                              <td>
                                  <asp:TextBox ID="ConfirmPassword" runat="server" CssClass="text-box" 
                                      TextMode="Password"></asp:TextBox>
                                  <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" 
                                      ControlToValidate="ConfirmPassword" 
                                      ErrorMessage="Polje Potvrdi lozinku je obavezno." 
                                      ToolTip="Polje Potvrdi lozinku je obavezno." 
                                      ValidationGroup="FormaUnesikorisnika">*</asp:RequiredFieldValidator>
                              </td>
                          </tr>
                          <tr>
                              <td align="right">
                                  <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label>
                              </td>
                              <td>
                                  <asp:TextBox ID="Email" runat="server" CssClass="text-box"></asp:TextBox>
                                  <asp:RequiredFieldValidator ID="EmailRequired" runat="server" 
                                      ControlToValidate="Email" ErrorMessage="E-mail je obavezan." 
                                      ToolTip="E-mail je obavezan." ValidationGroup="FormaUnesikorisnika">*</asp:RequiredFieldValidator>
                              </td>
                          </tr>
                          <tr>
                              <td align="right">
                                  <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">Pitanje:</asp:Label>
                              </td>
                              <td>
                                  <asp:TextBox ID="Question" runat="server" CssClass="text-box"></asp:TextBox>
                                  <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" 
                                      ControlToValidate="Question" ErrorMessage="Pitanje je obavezno." 
                                      ToolTip="Pitanje je obavezno." ValidationGroup="FormaUnesikorisnika">*</asp:RequiredFieldValidator>
                              </td>
                          </tr>
                          <tr>
                              <td align="right">
                                  <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">Odgovor:</asp:Label>
                              </td>
                              <td>
                                  <asp:TextBox ID="Answer" runat="server" CssClass="text-box"></asp:TextBox>
                                  <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" 
                                      ControlToValidate="Answer" ErrorMessage="Odgovor je obavezan." 
                                      ToolTip="Odgovor je obavezan." ValidationGroup="FormaUnesikorisnika">*</asp:RequiredFieldValidator>
                              </td>
                          </tr>
                          <tr>
                              <td align="center" colspan="2">
                                  <asp:CompareValidator ID="PasswordCompare" runat="server" 
                                      ControlToCompare="Password" ControlToValidate="ConfirmPassword" 
                                      Display="Dynamic" 
                                      ErrorMessage="Polja za lozinke moraju da imaju istu vrednost." 
                                      ValidationGroup="FormaUnesikorisnika"></asp:CompareValidator>
                              </td>
                          </tr>
                          <tr>
                              <td align="center" colspan="2" style="color:Red;">
                                  <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                              </td>
                          </tr>
                      </table>
                  </ContentTemplate>
              </asp:CreateUserWizardStep>
              <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
              </asp:CompleteWizardStep>
          </WizardSteps>
          <HeaderStyle HorizontalAlign="Center" />
      </asp:CreateUserWizard>


</asp:Content>
