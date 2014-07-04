<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/administrator.Master" AutoEventWireup="true" CodeBehind="brendovi.aspx.cs" Inherits="aspsajt.Administrator.brendovi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderCenter" runat="server">

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="IdBrend" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." AllowPaging="True" AllowSorting="True" Caption="Lista Brendova">
        <Columns>
            <asp:BoundField DataField="IdBrend" HeaderText="IdBrend" ReadOnly="True" SortExpression="IdBrend" Visible="False" />
            <asp:BoundField DataField="Naziv" HeaderText="Naziv" SortExpression="Naziv" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:VezaSaBazom %>" 
        SelectCommand="SELECT [IdBrend], [Naziv] FROM [Brendovi]"
        DeleteCommand="DELETE FROM [Brendovi] WHERE [IdBrend] = @IdBrend"
        InsertCommand="INSERT INTO [Brendovi] ([Naziv]) VALUES (@Naziv)"
        UpdateCommand="UPDATE [Brendovi] SET [Naziv] = @Naziv WHERE [IdBrend] = @IdBrend" OnInserting="SqlDataSource1_Inserting">
        <DeleteParameters>
            <asp:Parameter Name="IdBrend" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Naziv" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Naziv" Type="String" />
            <asp:Parameter Name="IdBrend" Type="Int32" />
        </UpdateParameters>

    </asp:SqlDataSource>

    <asp:DetailsView ID="DetailsViewBrendovi" runat="server" Height="50px" Width="125px" DataSourceID="SqlDataSource1" DefaultMode="Insert" AutoGenerateRows="False" Caption="Dodaj brend">
        <Fields>
            <asp:TemplateField HeaderText="Naziv">
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBoxNaziv" runat="server"></asp:TextBox>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowInsertButton="True" CancelText="Odustani" InsertText="Dodaj" />
            
        </Fields>
    </asp:DetailsView>



</asp:Content>
