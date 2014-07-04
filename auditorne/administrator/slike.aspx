<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/administrator.Master" AutoEventWireup="true" CodeBehind="slike.aspx.cs" Inherits="aspsajt.Administrator.slike" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderCenter" runat="server">

   <asp:GridView ID="GridViewProizvodi" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." Caption="Lista proizvoda" AllowPaging="True" AllowSorting="True" OnSelectedIndexChanged="GridViewProizvodi_SelectedIndexChanged" DataKeyNames="IdProizvod">
        <Columns>
            <asp:CommandField SelectText="Izmeni slike" ShowSelectButton="True" />
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
        InsertCommand="INSERT INTO Slike (IdProizvod, Naziv, MalaUrl, VelikaUrl, Glavna) VALUES(@IdProizvod, @Naziv, @MalaUrl, @VelikaUrl, @Glavna)" 
        DeleteCommand=""
        OnInserting="SqlDataSource1_Inserting" OnInserted="SqlDataSource1_Inserted">

        
        <DeleteParameters>
            <asp:Parameter Name="IdProizvod" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="GridViewProizvodi" Name="IdProizvod" 
                 PropertyName="SelectedValue" Type="Int32" />
            <asp:Parameter Name="Naziv" Type="String" />
            <asp:Parameter Name="MalaUrl" Type="String" />
            <asp:Parameter Name="VelikaUrl" Type="String" />
            <asp:Parameter Name="Glavna" Type="Boolean" />
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




    <asp:GridView ID="GridViewPrikazSlika" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" EmptyDataText="There are no data records to display." DataKeyNames="IdProizvod">
        <Columns>
            
            <asp:CommandField ShowDeleteButton="True" />
            
            <asp:BoundField DataField="IdSlika" HeaderText="IdSlika" ReadOnly="True" SortExpression="IdSlika" Visible="false" />
            <asp:BoundField DataField="IdProizvod" HeaderText="IdProizvod" SortExpression="IdProizvod" Visible="false"/>
            <asp:BoundField DataField="Naziv" HeaderText="Naziv" SortExpression="Naziv" />
            <asp:ImageField DataImageUrlField="MalaUrl" DataImageUrlFormatString="..{0}" ControlStyle-Height="100" ControlStyle-Width="100">
            </asp:ImageField>
            <asp:CheckBoxField DataField="Glavna" HeaderText="Glavna" SortExpression="Glavna" />
        </Columns>
    </asp:GridView>


    <asp:DetailsView ID="DetailsViewDodajSlike" runat="server" Height="200px" Width="650px" DataSourceID="SqlDataSource1" DefaultMode="Insert" AutoGenerateRows="False" Caption="Dodaj novu sliku" Visible="False" DataKeyNames="IdSlika">
        <Fields>
            <asp:TemplateField HeaderText="Naziv">
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBoxNaziv" runat="server"></asp:TextBox>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Slika">
                <InsertItemTemplate>
                    <asp:FileUpload ID="FileUploadSlika" runat="server" />
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Glavna">
                <InsertItemTemplate>
                    <asp:CheckBox ID="CheckBoxGlavna" runat="server" />
                    <asp:HiddenField ID="HiddenFieldIdProizvoda" Value=' <%#Eval("IdProizvoda") %>' runat="server" />
                </InsertItemTemplate>
            </asp:TemplateField>

            

            <asp:CommandField ShowInsertButton="True" CancelText="Odustani" InsertText="Dodaj" />
        </Fields>
    </asp:DetailsView>


    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:VezaSaBazom %>"

        SelectCommand="SELECT * FROM [Slike] WHERE IdProizvod = @IdProizvod"
        InsertCommand="INSERT INTO Slike (IdProizvod, Naziv, MalaUrl, VelikaUrl, Glavna) VALUES(@IdProizvod, @Naziv, @MalaUrl, @VelikaUrl, @Glavna)"
        DeleteCommand="DELETE FROM Slike WHERE IdSlika = @IdSlika"
        OnInserting="SqlDataSource2_Inserting">

        <SelectParameters>
             <asp:ControlParameter ControlID="GridViewProizvodi" Name="IdProizvod" 
                 PropertyName="SelectedValue" Type="Int32" />
         </SelectParameters>
        
        <DeleteParameters>
            <asp:Parameter Name="IdSlika" Type="Int32" />
        </DeleteParameters>
    </asp:SqlDataSource>














    

</asp:Content>
