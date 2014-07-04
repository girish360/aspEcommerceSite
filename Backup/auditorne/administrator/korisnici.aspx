<%@ Page Title="Administracija korisnika" Language="C#" MasterPageFile="~/glavna.Master" AutoEventWireup="true" CodeBehind="korisnici.aspx.cs" Inherits="auditorne.administrator.korisnici" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
    $(document).ready(function () {
        $('a.korisnik-detaljno').click(function (e) {
            e.preventDefault();
            var userId = $(this).attr("href");
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "korisnici.aspx/korisnikDodatniPodaci",
                data: "{userId:'" + userId + "'}",
                dataType: 'json',
                success: function (msg) {
                    var osoba = $.parseJSON(msg.d);
                    if (osoba.ImePrezime != null) {
                        $("#tbImePrezime").val(osoba.ImePrezime);
                        $("input[name=rbPol][value='" + osoba.Pol + "']").attr('checked', 'checked');
                        $("[id$=_ddlGodine]").val(osoba.GodinaRodjenja);
                        $("#HiddenUserID").val(osoba.ID);
                        $("#detaljiKorisnika").show();
                    } else {
                        alert("Izabrani korisnik ne poseduje dodatne podatke !!!");
                    }
                }

            });
        });

        $("#btnReset").click(function () { $("#detaljiKorisnika").hide(); });
        $("#btnSubmit").click(function () {
            var imePrezime = $("#tbImePrezime").val();
            var pol = $("input[name=rbPol]:checked").val();
            var godinaRodjenja = $("[id$=_ddlGodine]").val();
            var userId = $("#HiddenUserID").val();
            var korisnik = {
                ID: userId,
                ImePrezime: imePrezime,
                Pol: pol,
                GodinaRodjenja: godinaRodjenja
            };

            var transferData = { 'korisnik': korisnik };

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/MojWebServis.asmx/izmenaPodataka",
                data: JSON.stringify(transferData),
                dataType: 'json',
                success: function (msg) {
                    alert(msg.d);
                    $("#detaljiKorisnika").hide();
                }
            });

        });
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="centralniDeo" runat="server">
    <div class="post">
  <h2>Registracija/Pregled/Ažuriranje/Brisanje korsnika</h2>
  <div class="entry">
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
          oncreateduser="FormaUnesikorisnika_CreatedUser" >
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
                                  <asp:Label ID="LabelImePrezime" runat="server" AssociatedControlID="TextBoxImePrezime">Ime i prezime:</asp:Label>
                              </td>
                              <td>
                                  <asp:TextBox ID="TextBoxImePrezime" runat="server" CssClass="text-box"></asp:TextBox>
                                  <asp:RequiredFieldValidator ID="ImePrezimeRequired" runat="server" 
                                      ControlToValidate="TextBoxImePrezime" ErrorMessage="Ime i prezime je obavezno." 
                                      ToolTip="Ime i prezime je obavezno." ValidationGroup="FormaUnesikorisnika">*</asp:RequiredFieldValidator>
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
                                  <asp:Label ID="LabelGodinaRodjenja" runat="server" AssociatedControlID="DropDownListGodRodjenja">Godina rodjenja:</asp:Label>
                              </td>
                              <td>
                                  <asp:DropDownList ID="DropDownListGodRodjenja" runat="server">
                                  </asp:DropDownList>
                                  <asp:CustomValidator ID="CustomValidatorGodinaRodjenja" runat="server" 
                                      ErrorMessage="Morate izabrati godinu rodjenja." 
                                      ControlToValidate="DropDownListGodRodjenja" 
                                      ToolTip="Morate izabrati godinu rodjenja." 
                                      ValidationGroup="FormaUnesikorisnika"  onservervalidate="ProveraListe_ServerValidate"></asp:CustomValidator>
                                  
                              </td>
                          </tr>
                          <tr>
                              <td align="right">
                                  <asp:Label ID="LabelUloga" runat="server" AssociatedControlID="DropDownListUloge">Uloga:</asp:Label>
                              </td>
                              <td>
                                  <asp:DropDownList ID="DropDownListUloge" runat="server" 
                                      AppendDataBoundItems="True" CssClass="drop-down-list" 
                                      DataSourceID="SqlDataSourceUloge" DataTextField="RoleName" 
                                      DataValueField="RoleId">
                                  <asp:ListItem Text="Izaberi..." Value="0" Selected="True"></asp:ListItem>
                                  </asp:DropDownList>
                                  <asp:CustomValidator ID="CustomValidatorUloga" runat="server" 
                                      ErrorMessage="Morate izabrati ulogu korisnka" 
                                      ControlToValidate="DropDownListUloge" 
                                      ToolTip="Morate izabrati ulogu korisnka" 
                                      ValidationGroup="FormaUnesikorisnika" 
                                      onservervalidate="ProveraListe_ServerValidate"></asp:CustomValidator>
                                  <asp:SqlDataSource ID="SqlDataSourceUloge" runat="server" 
                                      ConnectionString="<%$ ConnectionStrings:VezaSaBazom %>" 
                                      SelectCommand="SELECT [RoleId], [RoleName] FROM [vw_aspnet_Roles]"></asp:SqlDataSource>
                                  
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
  </div>
  <div class="entry">
      <asp:GridView ID="GridViewListaKorisnika" runat="server" 
          AutoGenerateColumns="False" CssClass="table-center" 
          DataSourceID="SqlDataSourceListaKorisnika" onrowcommand="GridViewListaKorisnika_RowCommand" 
          >
          <Columns>
              <asp:TemplateField ShowHeader="False">
                  <ItemTemplate>
                      <asp:HyperLink ID="HyperLinkDetaljnije" runat="server" CssClass="korisnik-detaljno" NavigateUrl='<%# Bind("UserId") %>'>Detaljnije</asp:HyperLink>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Obriši">
                  <ItemTemplate>
                      <asp:LinkButton ID="LinkButtonDelete" runat="server" 
                          CommandArgument='<%# Bind("UserName") %>' CommandName="DeleteKorisnik">Obriši</asp:LinkButton>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" 
                  Visible="False" />
              <asp:BoundField DataField="UserName" HeaderText="Korisnicko ime" 
                  SortExpression="UserName" />
              <asp:CheckBoxField DataField="IsAnonymous" HeaderText="Anoniman korisnik" 
                  SortExpression="IsAnonymous" />
              <asp:BoundField DataField="LastActivityDate" DataFormatString="{0:d}" 
                  HeaderText="Datum poslednje aktivnosti" SortExpression="LastActivityDate" />
          </Columns>
      </asp:GridView>
      <asp:SqlDataSource ID="SqlDataSourceListaKorisnika" runat="server" 
          ConnectionString="<%$ ConnectionStrings:VezaSaBazom %>" 
          SelectCommand="SELECT [UserId], [UserName], [IsAnonymous], [LastActivityDate] FROM [vw_aspnet_Users]"></asp:SqlDataSource>
          
  </div>
  <div class="entry">
      <table id="detaljiKorisnika" class="table-center sakri">
          <tr>
              <th colspan="3">
                 Dodatni podaci o korisniku
              </th>
             
          </tr>
          <tr>
              <td>
                  <label for="tbImePrezime">Ime i prezime</label>
              </td>
              <td>
                  <input id="tbImePrezime" type="text" name="tbImePrezime" class="text-box" />
              </td>
              <td class="error"></td>
          </tr>
          <tr>
              <td>
                  <label for="rbPol">Pol</label>
              </td>
              <td>
                  <input type="radio" name="rbPol" value="M" /> Muski<br />
                  <input type="radio" name="rbPol" value="Z" /> Zenski<br />
              </td>
              <td class="error">
                  &nbsp;
              </td>
          </tr>
          <tr>
              <td>
                  <label for="ddlGodine">Godina rodjenja:</label>
              </td>
              <td>
                  <asp:DropDownList ID="ddlGodine" name="ddlGodine" runat="server" CssClass="drop-down-list">
                  </asp:DropDownList>
              </td>
              <td class="error">
                  &nbsp;
              </td>
          </tr>
           <tr>
              <td colspan="3" align="center">
                  <input id="HiddenUserID" type="hidden" />
                  <input id="btnSubmit" type="button" value="Izmeni" />
                  <input id="btnReset" type="reset" value="Odustani" />
              </td>
             
          </tr>
      </table>
  </div>
  </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="levaStrana" runat="server">
</asp:Content>
