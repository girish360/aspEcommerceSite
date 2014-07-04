<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/administrator.Master" AutoEventWireup="true" CodeBehind="kategorije.aspx.cs" Inherits="aspsajt.Administrator.kategorije" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderCenter" runat="server">


    <div style="float:left;margin:20px;">

    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="IdKategorija" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." AllowPaging="True" AllowSorting="True" Caption="Kategorije proizvoda">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="IdKategorija" HeaderText="IdKategorija" ReadOnly="True" SortExpression="IdKategorija" Visible="False" />
            <asp:BoundField DataField="Naziv" HeaderText="Naziv" SortExpression="Naziv" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:VezaSaBazom %>" 
        DeleteCommand="DELETE FROM [Kategorije] WHERE [IdKategorija] = @IdKategorija" 
        InsertCommand="INSERT INTO [Kategorije] ([Naziv], [IdRoditelj]) VALUES (@Naziv, @IdRoditelj)" 
        
        SelectCommand="SELECT * FROM [Kategorije]" 
        UpdateCommand="UPDATE [Kategorije] SET [Naziv] = @Naziv WHERE [IdKategorija] = @IdKategorija" OnInserting="SqlDataSource1_Inserting">
        <DeleteParameters>
            <asp:Parameter Name="IdKategorija" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Naziv" Type="String" />
            <asp:Parameter Name="IdRoditelj" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Naziv" Type="String" />
            <asp:Parameter Name="IdKategorija" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    </div>

    <div style="float:left;margin-left:50px;margin-top:50px;">

    <asp:DetailsView ID="DetailsViewKategorije" runat="server" Height="50px" Width="125px" DataSourceID="SqlDataSource1" DefaultMode="Insert" AutoGenerateRows="False" Caption="Dodaj novu kategoriju">
        <Fields>
            <asp:TemplateField HeaderText="Naziv">
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBoxNaziv" runat="server"></asp:TextBox>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Roditelj">
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownListRoditelj" runat="server" DataSourceID="SqlDataSource1" DataTextField="Naziv" DataValueField="IdKategorija">
                        <asp:ListItem Text="Nema" Value="Nema">Nema</asp:ListItem>
                    </asp:DropDownList>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowInsertButton="True" CancelText="Odustani" InsertText="Dodaj" />
            
        </Fields>
    </asp:DetailsView>
        
    </div>
</asp:Content>
