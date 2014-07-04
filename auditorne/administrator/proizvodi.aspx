<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/administrator.Master" AutoEventWireup="true" CodeBehind="proizvodi.aspx.cs" Inherits="aspsajt.Administrator.proizvodi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderCenter" runat="server">

    <asp:GridView ID="GridViewProizvodi" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." Caption="Lista proizvoda" AllowPaging="True" AllowSorting="True">
        <Columns>
            <asp:BoundField DataField="IdProizvod" HeaderText="IdProizvod" ReadOnly="True" SortExpression="IdProizvod" Visible="false"/>
            <asp:BoundField DataField="Naziv1" HeaderText="Kategorija" SortExpression="Naziv1" />
            <asp:BoundField DataField="Naziv2" HeaderText="Brend" SortExpression="Naziv2" />
            <asp:BoundField DataField="Naziv" HeaderText="Naziv" SortExpression="Naziv" />
            <asp:BoundField DataField="Opis" HeaderText="Opis" SortExpression="Opis" />
            <asp:BoundField DataField="Cena" HeaderText="Cena" SortExpression="Cena" />
            <asp:BoundField DataField="DatumDodavanja" HeaderText="DatumDodavanja" SortExpression="DatumDodavanja" />
            <asp:BoundField DataField="DatumIzmene" HeaderText="DatumIzmene" SortExpression="DatumIzmene" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:VezaSaBazom %>"
         
        SelectCommand="SELECT * FROM Proizvodi p LEFT OUTER JOIN Kategorije k ON p.IdKategorija = k.IdKategorija LEFT OUTER JOIN Brendovi b ON p.IdBrend = b.IdBrend"
        InsertCommand="INSERT INTO [Proizvodi] ([IdKategorija], [IdBrend], [Naziv], [Opis], [Cena], [DatumDodavanja], [DatumIzmene]) VALUES (@IdKategorija, @IdBrend, @Naziv, @Opis, @Cena, @DatumDodavanja, @DatumIzmene)" 
        UpdateCommand="UPDATE [Proizvodi] SET [IdKategorija] = @IdKategorija, [IdBrend] = @IdBrend, [Naziv] = @Naziv, [Opis] = @Opis, [Cena] = @Cena, [DatumIzmene] = @DatumIzmene WHERE [IdProizvod] = @IdProizvod" 
        DeleteCommand="DELETE FROM [Proizvodi] WHERE [IdProizvod] = @IdProizvod"
        OnInserting="SqlDataSource1_Inserting">

        <DeleteParameters>
            <asp:Parameter Name="IdProizvod" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="IdKategorija" Type="Int32" />
            <asp:Parameter Name="IdBrend" Type="Int32" />
            <asp:Parameter Name="Naziv" Type="String" />
            <asp:Parameter Name="Opis" Type="String" />
            <asp:Parameter Name="Cena" Type="Int32" />
            <asp:Parameter Name="DatumDodavanja" Type="DateTime" />
            <asp:Parameter Name="DatumIzmene" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="IdProizvod" Type="Int32" />
            <asp:Parameter Name="IdKategorija" Type="Int32" />
            <asp:Parameter Name="IdBrend" Type="Int32" />
            <asp:Parameter Name="Naziv" Type="String" />
            <asp:Parameter Name="Opis" Type="String" />
            <asp:Parameter Name="Cena" Type="Int32" />
            <asp:Parameter Name="DatumDodavanja" Type="DateTime" />
            <asp:Parameter Name="DatumIzmene" Type="DateTime" />
        </UpdateParameters>

    </asp:SqlDataSource>

    <asp:DetailsView ID="DetailsViewProizvodi" runat="server" Height="200px" Width="650px" DataSourceID="SqlDataSource1" DefaultMode="Insert" AutoGenerateRows="False" Caption="Dodaj novi proizvod">
        <Fields>
            <asp:TemplateField HeaderText="Naziv">
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBoxNaziv" runat="server"></asp:TextBox>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Kategorija">
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownListKategorija" runat="server" DataSourceID="SqlDataSourceKategorije" DataTextField="Naziv" DataValueField="IdKategorija"></asp:DropDownList>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Brend">
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownListBrend" runat="server" DataSourceID="SqlDataSourceBrendovi" DataTextField="Naziv" DataValueField="IdBrend"></asp:DropDownList>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Opis">
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBoxOpis" runat="server" TextMode="MultiLine" Width="580px" Height="100px"></asp:TextBox>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Cena">
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBoxCena" runat="server"></asp:TextBox>din
                </InsertItemTemplate>
            </asp:TemplateField>

            <asp:CommandField ShowInsertButton="True" CancelText="Odustani" InsertText="Dodaj" />
        </Fields>
    </asp:DetailsView>

    <asp:SqlDataSource ID="SqlDataSourceKategorije" runat="server" ConnectionString="<%$ ConnectionStrings:aspAuditorneConnectionString %>" SelectCommand="SELECT * FROM [Kategorije] WHERE IdRoditelj IS NOT NULL"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceBrendovi" runat="server" ConnectionString="<%$ ConnectionStrings:aspAuditorneConnectionString %>" SelectCommand="SELECT * FROM [Brendovi]"></asp:SqlDataSource>

</asp:Content>
