<%@ Page Title="Galerija" Language="C#" MasterPageFile="~/glavna.Master" AutoEventWireup="true" CodeBehind="galerija.aspx.cs" Inherits="auditorne.administrator.galerija" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
    function brojSlika(obj) {
        var id = obj.value;
        auditorne.MojWebServis.brojSlikaUGaleriji(id, onComplete, onError);
    }
    function onComplete(arg) {
        document.getElementById("brojSlika").innerHTML = "Broj slika je: "+arg;
    }
    function onError(arg) {
        alert("Doslo je do greske u AJAX zahtevu !!!");
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="centralniDeo" runat="server">
<div class="post">
   <h2>Unos/Edit/Brisanje galerije</h2>
   <div class="entry">
       <asp:DetailsView ID="DetailsViewGalerija" runat="server" Height="50px" 
           Width="125px" CssClass="detail-view" DataSourceID="SqlDataSourceGalerije" 
           DefaultMode="Insert" AutoGenerateRows="False" 
           HeaderText="Forma za unos galerije" 
           oniteminserted="DetailsViewGalerija_ItemInserted">
           <CommandRowStyle HorizontalAlign="Center" />
           <Fields>
               <asp:BoundField HeaderText="Naziv" DataField="naziv" />
               <asp:CommandField ButtonType="Button" CancelText="Otkaži" DeleteText="Obriši" 
                   EditText="Ažuriraj" InsertText="Unesi" NewText="Dodaj novu" 
                   ShowInsertButton="True" />
           </Fields>
           <HeaderStyle HorizontalAlign="Center" />
       </asp:DetailsView>
   </div>
   <div class="entry">
       <asp:GridView ID="GridViewGalerije" runat="server" AllowPaging="True" 
           AllowSorting="True" AutoGenerateColumns="False" CssClass="grid-view" 
           DataKeyNames="idGalerija" DataSourceID="SqlDataSourceGalerije" 
           EmptyDataText="Trenutno nema ni jedne galerije" 
           onrowdeleted="GridViewGalerije_RowDeleted" 
           onrowupdated="GridViewGalerije_RowUpdated">
           <Columns>
               <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                   ShowSelectButton="True" CancelText="Otkaži" DeleteText="Obriši" 
                   EditText="Izmeni" InsertText="Unesi" NewText="Dodaj novo" SelectText="Odaberi" 
                   UpdateText="Ažuriraj" />
               <asp:BoundField DataField="idGalerija" HeaderText="idGalerija" 
                   InsertVisible="False" ReadOnly="True" SortExpression="idGalerija" 
                   Visible="False" />
               <asp:BoundField DataField="naziv" HeaderText="Naziv" SortExpression="naziv" />
           </Columns>
       </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceGalerije" runat="server" 
           ConnectionString="<%$ ConnectionStrings:VezaSaBazom %>" 
           DeleteCommand="DELETE FROM [Galerija] WHERE [idGalerija] = @idGalerija" 
           InsertCommand="INSERT INTO [Galerija] ([naziv]) VALUES (@naziv)" 
           SelectCommand="SELECT * FROM [Galerija]" 
           UpdateCommand="UPDATE [Galerija] SET [naziv] = @naziv WHERE [idGalerija] = @idGalerija">
        <DeleteParameters>
            <asp:Parameter Name="idGalerija" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="naziv" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="naziv" Type="String" />
            <asp:Parameter Name="idGalerija" Type="Int32" />
        </UpdateParameters>
       </asp:SqlDataSource>
   </div>
</div>
<div class="entry">
  <p>Odaberite galeriju za koju želite da saznate broj slika:
      <asp:DropDownList ID="DropDownListGalerije" runat="server" 
          AppendDataBoundItems="True" DataSourceID="SqlDataSourceListaGalerija" 
          DataTextField="naziv" DataValueField="idGalerija" onChange="brojSlika(this);">
          <asp:ListItem Value="0">Izaberi....</asp:ListItem>
      </asp:DropDownList>
      <asp:SqlDataSource ID="SqlDataSourceListaGalerija" runat="server" 
          ConnectionString="<%$ ConnectionStrings:VezaSaBazom %>" 
          SelectCommand="SELECT [idGalerija], [naziv] FROM [Galerija]"></asp:SqlDataSource>
  </p>
  <div id="brojSlika"></div>
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="levaStrana" runat="server">
</asp:Content>
