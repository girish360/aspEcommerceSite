<%@ Page Title="" Language="C#" MasterPageFile="~/Glavna.Master" AutoEventWireup="true" CodeBehind="proizvod.aspx.cs" Inherits="aspsajt.proizvodi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderCenterRight" runat="server">
    <asp:ListView ID="ListViewKategorije" runat="server" DataSourceID="SqlDataSourceKategorije">
        <LayoutTemplate>

            <div id="itemPlaceHolder" runat="server">

            </div>

        </LayoutTemplate>
        <ItemTemplate>
                <div id="itemPlaceHolder">
		            <p><%#Eval("Naziv") %> <%#Eval("Naziv2") %></p>
                    <p>Kategorija: <%#Eval("Naziv1") %></p>
                    <a class="fancybox" href='<%#Eval("VelikaUrl") %>'><img src='<%#Eval("MalaUrl") %>' alt="" /></a>
                    <p>Opis: <%#Eval("Opis") %></p>
                    <p>Cena: <%#Eval("Cena") %>din</p>
                </div>
        </ItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSourceKategorije" runat="server" ConnectionString="<%$ ConnectionStrings:aspAuditorneConnectionString %>"
         SelectCommand="SELECT * FROM Proizvodi p LEFT OUTER JOIN Kategorije k ON p.IdKategorija = k.IdKategorija LEFT OUTER JOIN Brendovi b ON p.IdBrend = b.IdBrend LEFT OUTER JOIN Slike s ON p.IdProizvod = s.IdProizvod WHERE p.IdProizvod = @IdProizvod AND s.Glavna = 1">
        <SelectParameters>

            <asp:QueryStringParameter Name="IdProizvod" QueryStringField="proizvod" />

        </SelectParameters>

        
    </asp:SqlDataSource>







    <asp:ListView ID="ListViewSlike" runat="server" DataSourceID="SqlDataSourceSlike">
        <LayoutTemplate>
            
            <div id="itemPlaceHolder" runat="server">

            </div>

        </LayoutTemplate>
        <ItemTemplate>
                <div id="itemPlaceHolder">
		            <div class="prikazSlikaProizvoda">
                        <a class="fancybox" rel="group" href='<%#Eval("VelikaUrl") %>'><img src='<%#Eval("MalaUrl") %>' alt="" /></a>
                    </div>
                </div>
        </ItemTemplate>
    </asp:ListView>

    <asp:SqlDataSource ID="SqlDataSourceSlike" runat="server" ConnectionString="<%$ ConnectionStrings:aspAuditorneConnectionString %>"
         SelectCommand="SELECT * FROM Slike WHERE IdProizvod = @IdProizvod AND Glavna = 0">
        <SelectParameters>

            <asp:QueryStringParameter Name="IdProizvod" QueryStringField="proizvod" />

        </SelectParameters>
    </asp:SqlDataSource>

    <div style="clear:both"></div>

    

    <asp:DetailsView ID="DetailsViewDodajKomentar" runat="server" Height="200px" Width="650px" DataSourceID="SqlDataSourceKomentari" DefaultMode="Insert" AutoGenerateRows="False" Caption="Dodaj komentar" Visible="True" DataKeyNames="IdKomentar">
        <Fields>
            <asp:TemplateField HeaderText="Tekst komentara: ">
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBoxDodajKomentar" runat="server" TextMode="MultiLine" Width="400px" Height="100px"></asp:TextBox>
                </InsertItemTemplate>
            </asp:TemplateField>
            
    

            <asp:CommandField ShowInsertButton="True" CancelText="Odustani" InsertText="Dodaj" />
        </Fields>
    </asp:DetailsView>
   
    
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceKomentari" EmptyDataText="There are no data records to display.">
        <Columns>
            <asp:BoundField DataField="IdKomentar" HeaderText="IdKomentar" ReadOnly="True" SortExpression="IdKomentar" />
            <asp:BoundField DataField="IdProizvod" HeaderText="IdProizvod" SortExpression="IdProizvod" />
            <asp:BoundField DataField="IdAutor" HeaderText="IdAutor" SortExpression="IdAutor" />
            <asp:BoundField DataField="Tekst" HeaderText="Tekst" SortExpression="Tekst" />
            <asp:BoundField DataField="DatumDodavanja" HeaderText="DatumDodavanja" SortExpression="DatumDodavanja" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceKomentari" runat="server" 
        ConnectionString="<%$ ConnectionStrings:VezaSaBazom %>"
        SelectCommand="SELECT * FROM [Komentari] WHERE IdProizvod = @IdProizvod AND Odobren=1" 
        InsertCommand="INSERT INTO Komentari (IdProizvod, IdAutor, Tekst, DatumDodavanja, Odobren) VALUES(@IdProizvod, @IdAutor, @Tekst, @DatumDodavanja, @Odobren)"
        OnInserting="SqlDataSourceKomentari_Inserting">
        <SelectParameters>

            <asp:QueryStringParameter Name="IdProizvod" QueryStringField="proizvod" />

        </SelectParameters>
        <InsertParameters>

            <asp:QueryStringParameter Name="IdProizvod" QueryStringField="proizvod" />
            <asp:Parameter Name="IdAutor" Type="Int32" />
            <asp:Parameter Name="Tekst" Type="String" />
            <asp:Parameter Name="DatumDodavanja" Type="DateTime" />
            <asp:Parameter Name="Odobren" Type="Boolean" />

        </InsertParameters>
    </asp:SqlDataSource>



    
</asp:Content>
