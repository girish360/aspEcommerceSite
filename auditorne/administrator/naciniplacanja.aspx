<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/administrator.Master" AutoEventWireup="true" CodeBehind="naciniplacanja.aspx.cs" Inherits="aspsajt.Administrator.nacinplacanja" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderCenter" runat="server">

    
    <div style="float:left;margin:20px;">

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="IdNacinPlacanja" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." AllowPaging="True" AllowSorting="True" Caption="Nacini Placanja">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="IdNacinPlacanja" HeaderText="IdNacinPlacanja" ReadOnly="True" SortExpression="IdNacinPlacanja" Visible="False" />
            <asp:BoundField DataField="Naziv" HeaderText="Naziv" SortExpression="Naziv" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:VezaSaBazom %>" 
        DeleteCommand="DELETE FROM [NaciniPlacanja] WHERE [IdNacinPlacanja] = @IdNacinPlacanja" 
        InsertCommand="INSERT INTO [NaciniPlacanja] ([Naziv]) VALUES (@Naziv)" 
        
        SelectCommand="SELECT [IdNacinPlacanja], [Naziv] FROM [NaciniPlacanja]" 
        UpdateCommand="UPDATE [NaciniPlacanja] SET [Naziv] = @Naziv WHERE [IdNacinPlacanja] = @IdNacinPlacanja" 
        OnInserting="SqlDataSource1_Inserting">
        <DeleteParameters>
            <asp:Parameter Name="IdNacinPlacanja" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Naziv" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Naziv" Type="String" />
            <asp:Parameter Name="IdNacinPlacanja" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    </div>

    <div style="float:left;margin-left:50px;margin-top:50px;">

    <asp:DetailsView ID="DetailsViewNacinPlacanja" runat="server" Height="50px" Width="125px" DataSourceID="SqlDataSource1" DefaultMode="Insert" AutoGenerateRows="False" Caption="Dodaj nacin placanja">
        <Fields>
            <asp:TemplateField HeaderText="Naziv">
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBoxNaziv" runat="server"></asp:TextBox>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowInsertButton="True" CancelText="Odustani" InsertText="Dodaj" />
            
        </Fields>
    </asp:DetailsView>

    </div>


</asp:Content>
