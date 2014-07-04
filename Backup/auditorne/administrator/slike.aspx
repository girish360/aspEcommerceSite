<%@ Page Title="Administracija | Fajl | Slike" Language="C#" MasterPageFile="~/glavna.Master" AutoEventWireup="true" CodeBehind="slike.aspx.cs" Inherits="auditorne.administrator.slike" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="centralniDeo" runat="server">
<div class="post">
  <h2>Unos/Edit/Brisanje</h2>
  <div class="entry">
      <asp:DetailsView ID="DetailsViewUnosSlike" runat="server" Height="50px" 
          Width="125px" CssClass="detail-view" DefaultMode="Insert" 
          AutoGenerateRows="False" DataKeyNames="idSlika" 
          DataSourceID="SqlDataSourceUnosSlike" >
          <Fields>
              <asp:BoundField DataField="idSlika" HeaderText="idSlika" InsertVisible="False" 
                  ReadOnly="True" SortExpression="idSlika" Visible="false" />
              <asp:BoundField DataField="naziv" HeaderText="Naziv" SortExpression="naziv" />
              <asp:TemplateField HeaderText="Fajl">
               <InsertItemTemplate>
                   <asp:FileUpload ID="FileUploadSlika" runat="server" />
               </InsertItemTemplate>
              </asp:TemplateField>
              <asp:CheckBoxField DataField="glavna" HeaderText="glavna" 
                  SortExpression="glavna" />
             <asp:TemplateField HeaderText="Galerija">
               <InsertItemTemplate>
                   <asp:DropDownList ID="DropDownListGalerije" runat="server" 
                       AppendDataBoundItems="True" DataSourceID="SqlDataSourceListaGalerija" 
                       DataTextField="naziv" DataValueField="idGalerija">
                   <asp:ListItem Value="0" Text="Izaberite..."></asp:ListItem>
                   </asp:DropDownList>
                   <asp:SqlDataSource ID="SqlDataSourceListaGalerija" runat="server" 
                       ConnectionString="<%$ ConnectionStrings:aspAuditorneConnectionString %>" 
                       SelectCommand="SELECT * FROM [Galerija]"></asp:SqlDataSource>
               </InsertItemTemplate>
             </asp:TemplateField>
          </Fields>

      </asp:DetailsView>
      <asp:SqlDataSource ID="SqlDataSourceUnosSlike" runat="server" 
          ConnectionString="<%$ ConnectionStrings:aspAuditorneConnectionString %>" 
          DeleteCommand="DELETE FROM [Slika] WHERE [idSlika] = @idSlika" 
          InsertCommand="INSERT INTO [Slika] ([naziv], [putanja], [velicina], [glavna], [idGalerija]) VALUES (@naziv, @putanja, @velicina, @glavna, @idGalerija)" 
          SelectCommand="SELECT * FROM [Slika]" 
          UpdateCommand="UPDATE [Slika] SET [naziv] = @naziv, [putanja] = @putanja, [velicina] = @velicina, [glavna] = @glavna, [idGalerija] = @idGalerija WHERE [idSlika] = @idSlika">
          <DeleteParameters>
              <asp:Parameter Name="idSlika" Type="Int32" />
          </DeleteParameters>
          <InsertParameters>
              <asp:Parameter Name="naziv" Type="String" />
              <asp:Parameter Name="putanja" Type="String" />
              <asp:Parameter Name="velicina" Type="Int32" />
              <asp:Parameter Name="glavna" Type="Boolean" />
              <asp:Parameter Name="idGalerija" Type="Int32" />
          </InsertParameters>
          <UpdateParameters>
              <asp:Parameter Name="naziv" Type="String" />
              <asp:Parameter Name="putanja" Type="String" />
              <asp:Parameter Name="velicina" Type="Int32" />
              <asp:Parameter Name="glavna" Type="Boolean" />
              <asp:Parameter Name="idGalerija" Type="Int32" />
              <asp:Parameter Name="idSlika" Type="Int32" />
          </UpdateParameters>
      </asp:SqlDataSource>
  </div>
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="levaStrana" runat="server">
</asp:Content>
