<%@ Page Title="Administracija | Fajl" Language="C#" MasterPageFile="~/glavna.Master" AutoEventWireup="true" CodeBehind="fajl.aspx.cs" Inherits="auditorne.adminstrator.fajl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="centralniDeo" runat="server">
    <div class="post">
    <h2><a name="unos">Unos fajla</a></h2>
    <table style="width: 100%;">
        <tr>
            <th colspan="3">
               Formular za unos fajla
            </th>
            
        </tr>
        <tr>
            <td>
               <asp:Label ID="LabelNaziv" runat="server" Text="Naziv:" AssociatedControlID="TextBoxNaziv"></asp:Label>
            </td>
            <td>
            <asp:TextBox ID="TextBoxNaziv" runat="server" CssClass="text-box"></asp:TextBox>
            </td>
            <td class="error">
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorNaziv" runat="server" ErrorMessage="Polje za naziv je obavezno !!!" Text="*" ControlToValidate="TextBoxNaziv"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
               <asp:Label ID="Label1" runat="server" Text="Fajl:" AssociatedControlID="FileUploadFajl"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="FileUploadFajl" runat="server" />
            </td>
            <td class="error">
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorFajl" runat="server" ErrorMessage="Morate izabrati fajl !!!" Text="*" ControlToValidate="FileUploadFajl"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="LabelPublikovan" runat="server" Text="Objavljen:" AssociatedControlID="CheckBoxPublikovan"></asp:Label>
            </td>
            
            <td>
               <asp:CheckBox ID="CheckBoxPublikovan" runat="server" Checked="true" CssClass="drop-down-list" /> 
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="LabelAktuelno" runat="server" Text="Aktuelno:" AssociatedControlID="CheckBoxAktuelno"></asp:Label>
            </td>
            
            <td>
               <asp:CheckBox ID="CheckBoxAktuelno" runat="server" /> 
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="LabelTezina" runat="server" Text="Težina:" AssociatedControlID="DropDownListTezina"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DropDownListTezina" runat="server">
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
          <td colspan="3" align="center">
            <asp:Button ID="ButtonUnosFajla" runat="server" Text="Unesi" CssClass="button" 
                  onclick="ButtonUnosFajla_Click" />
          </td>
        </tr>
    </table>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="validacija-error" />
 </div>
 <div class="post">
   <h2><a name="razno">Lista/Edit/Brisanje</a></h2>
   <div class="entry">
       <asp:Label ID="LabelFajloviFilter" runat="server" Text="Filtriraj po tipu">
       </asp:Label>
       <asp:DropDownList ID="DropDownListTipoviFajlova" runat="server" 
           CssClass="drop-down-list" AppendDataBoundItems="True" AutoPostBack="True" 
           DataSourceID="SqlDataSourceTipoviFajlova" DataTextField="tip" 
           DataValueField="tip" 
           onselectedindexchanged="DropDownListTipoviFajlova_SelectedIndexChanged">
       <asp:ListItem Value="svi" Text="Svi tipovi"></asp:ListItem>
       </asp:DropDownList>
       <asp:SqlDataSource ID="SqlDataSourceTipoviFajlova" runat="server" 
           ConnectionString="<%$ ConnectionStrings:aspAuditorneConnectionString %>" 
           SelectCommand="SELECT DISTINCT tip FROM fajl"></asp:SqlDataSource>
   </div>
     <asp:GridView ID="GridViewPrikazFajlova" runat="server" AllowPaging="True" 
         AllowSorting="True" CssClass="grid-view" 
         EmptyDataText="Trenutno nema podataka !!!!" 
         DataSourceID="SqlDataSourcePrikazFajlova" DataKeyNames="idFajl" 
         AutoGenerateColumns="False" 
         onselectedindexchanged="GridViewPrikazFajlova_SelectedIndexChanged">
         <Columns>
             <asp:CommandField SelectText="Detaljnije" ShowSelectButton="True" />
             <asp:BoundField DataField="idFajl" ShowHeader="False" Visible="False" />
             <asp:BoundField DataField="naziv" HeaderText="Naziv" />
             <asp:BoundField DataField="putanja" HeaderText="Putanja" />
             <asp:BoundField DataField="tip" HeaderText="Tip" />
             <asp:CheckBoxField DataField="publikovan" HeaderText="Publikovan" />
             <asp:BoundField DataField="tezina" HeaderText="Pozicija" />
             <asp:CheckBoxField DataField="aktuelno" HeaderText="Aktuelno" />
             <asp:BoundField DataField="datumPostavljanja" DataFormatString="{0:d}" 
                 HeaderText="Datum postavljanja" />
         </Columns>
     </asp:GridView>
     <asp:SqlDataSource ID="SqlDataSourcePrikazFajlova" runat="server" 
         ConnectionString="<%$ ConnectionStrings:aspAuditorneConnectionString %>" 
         SelectCommand="SELECT * FROM [Fajl] WHERE ([tip] = @tip) OR (@tip=@Svi)">
         <SelectParameters>
             <asp:ControlParameter ControlID="DropDownListTipoviFajlova" Name="tip" 
                 PropertyName="SelectedValue" Type="String" />
                 <asp:Parameter Name="Svi" Type="String" DefaultValue="svi" /> 
         </SelectParameters>
     </asp:SqlDataSource>
     <asp:DetailsView ID="DetailsViewPodaciOfajlu" runat="server" Height="50px" 
         Width="125px" AutoGenerateRows="False" DataKeyNames="idFajl" 
         EmptyDataText="Detaljni podaci o fajlu ne postoje" 
         HeaderText="Podaci o izabranom fajlu" CssClass="detail-view" 
         DataSourceID="SqlDataSourcePodaciOfajlu" Visible="false" 
         ondatabound="DetailsViewPodaciOfajlu_DataBound" 
         onitemdeleted="DetailsViewPodaciOfajlu_ItemDeleted" 
         onitemdeleting="DetailsViewPodaciOfajlu_ItemDeleting">
         <Fields>
             <asp:BoundField DataField="idFajl" HeaderText="idFajl" InsertVisible="False" 
                 ReadOnly="True" SortExpression="idFajl" Visible="False" />
             <asp:BoundField DataField="naziv" HeaderText="Naziv" SortExpression="naziv" />
             <asp:BoundField DataField="putanja" HeaderText="Putanja" ReadOnly="True" 
                 SortExpression="putanja" />
             <asp:BoundField DataField="tip" HeaderText="Tip" ReadOnly="True" 
                 SortExpression="tip" />
             <asp:CheckBoxField DataField="publikovan" HeaderText="Publikovan" 
                 SortExpression="publikovan" />
             <asp:TemplateField HeaderText="Pozicija">
               <ItemTemplate>
                   <asp:Label ID="LabelDWTezina" runat="server" Text='<%# Bind("tezina") %>'></asp:Label>
               </ItemTemplate>
               <EditItemTemplate>
                   <asp:DropDownList ID="DropDownListDWTezina" runat="server" CssClass="drop-down-list">
                   </asp:DropDownList>
               </EditItemTemplate>
             </asp:TemplateField>
             <asp:CheckBoxField DataField="aktuelno" HeaderText="Aktuelno" 
                 SortExpression="aktuelno" />
             <asp:BoundField DataField="datumPostavljanja" HeaderText="Datum postavljanja" 
                 ReadOnly="True" SortExpression="datumPostavljanja" />
             <asp:BoundField DataField="velicina" HeaderText="Velicina" ReadOnly="True" 
                 SortExpression="velicina" />
             <asp:CommandField CancelText="Otkazi" DeleteText="Obrisi" EditText="Izmeni" 
                 InsertText="Unesi" ShowDeleteButton="True" ShowEditButton="True" 
                 UpdateText="Izmena" />
         </Fields>
     </asp:DetailsView>
     <asp:SqlDataSource ID="SqlDataSourcePodaciOfajlu" runat="server" 
         ConnectionString="<%$ ConnectionStrings:aspAuditorneConnectionString %>" 
         DeleteCommand="DELETE FROM [Fajl] WHERE [idFajl] = @idFajl" 
         InsertCommand="INSERT INTO [Fajl] ([naziv], [putanja], [tip], [publikovan], [tezina], [aktuelno], [datumPostavljanja], [velicina]) VALUES (@naziv, @putanja, @tip, @publikovan, @tezina, @aktuelno, @datumPostavljanja, @velicina)" 
         SelectCommand="SELECT * FROM [Fajl] WHERE ([idFajl] = @idFajl)" 
         
         UpdateCommand="UPDATE [Fajl] SET [naziv] = @naziv, [putanja] = @putanja, [tip] = @tip, [publikovan] = @publikovan, [tezina] = @tezina, [aktuelno] = @aktuelno, [datumPostavljanja] = @datumPostavljanja, [velicina] = @velicina WHERE [idFajl] = @idFajl" 
         ondeleted="SqlDataSourcePodaciOfajlu_Deleted" 
         onupdated="SqlDataSourcePodaciOfajlu_Updated" 
         onupdating="SqlDataSourcePodaciOfajlu_Updating">
         <DeleteParameters>
             <asp:Parameter Name="idFajl" Type="Int32" />
         </DeleteParameters>
         <InsertParameters>
             <asp:Parameter Name="naziv" Type="String" />
             <asp:Parameter Name="putanja" Type="String" />
             <asp:Parameter Name="tip" Type="String" />
             <asp:Parameter Name="publikovan" Type="Boolean" />
             <asp:Parameter Name="tezina" Type="Int32" />
             <asp:Parameter Name="aktuelno" Type="Boolean" />
             <asp:Parameter Name="datumPostavljanja" Type="DateTime" />
             <asp:Parameter Name="velicina" Type="Int32" />
         </InsertParameters>
         <SelectParameters>
             <asp:ControlParameter ControlID="GridViewPrikazFajlova" Name="idFajl" 
                 PropertyName="SelectedValue" Type="Int32" />
         </SelectParameters>
         <UpdateParameters>
             <asp:Parameter Name="naziv" Type="String" />
             <asp:Parameter Name="putanja" Type="String" />
             <asp:Parameter Name="tip" Type="String" />
             <asp:Parameter Name="publikovan" Type="Boolean" />
             <asp:Parameter Name="tezina" Type="Int32" />
             <asp:Parameter Name="aktuelno" Type="Boolean" />
             <asp:Parameter Name="datumPostavljanja" Type="DateTime" />
             <asp:Parameter Name="velicina" Type="Int32" />
             <asp:Parameter Name="idFajl" Type="Int32" />
         </UpdateParameters>
     </asp:SqlDataSource>
 </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="levaStrana" runat="server">
</asp:Content>
