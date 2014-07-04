<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/administrator.Master" AutoEventWireup="true" CodeBehind="komentari.aspx.cs" Inherits="aspsajt.Administrator.komentari" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderCenter" runat="server">

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Caption="Lista komentara" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." AllowPaging="True" AllowSorting="True">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="IdKomentar" HeaderText="IdKomentar" ReadOnly="True" SortExpression="IdKomentar" Visible="false"/>
            <asp:BoundField DataField="IdProizvod" HeaderText="IdProizvod" SortExpression="IdProizvod" />
            <asp:BoundField DataField="IdAutor" HeaderText="IdAutor" SortExpression="IdAutor" />
            <asp:BoundField DataField="Tekst" HeaderText="Tekst" SortExpression="Tekst" />
            <asp:BoundField DataField="DatumDodavanja" HeaderText="DatumDodavanja" SortExpression="DatumDodavanja" />
            <asp:CheckBoxField DataField="Odobren" HeaderText="Odobren" SortExpression="Odobren" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:VezaSaBazom %>"

        SelectCommand="SELECT * FROM Komentari k INNER JOIN Proizvodi p ON k.IdProizvod = p.IdProizvod ORDER BY k.DatumDodavanja DESC"
        UpdateCommand="UPDATE [Proizvodi] SET [IdProizvod] = @IdProizvod, [IdAutor] = @IdAutor, [Tekst] = @Tekst, [DatumDodavanja] = @DatumDodavanja, [Odobren] = @Odobren WHERE [IdKomentar] = @IdKomentar" 
        DeleteCommand="DELETE FROM [Komentari] WHERE [IdKomentar] = @IdKomentar">

        <DeleteParameters>
            <asp:Parameter Name="IdProizvod" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="IdProizvod" Type="Int32" />
            <asp:Parameter Name="IdAutor" Type="Int32" />
            <asp:Parameter Name="Tekst" Type="String" />
            <asp:Parameter Name="DatumDodavanja" Type="DateTime" />
            <asp:Parameter Name="Odobren" Type="Boolean" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="IdKomentar" Type="Int32" />
            <asp:Parameter Name="IdProizvod" Type="Int32" />
            <asp:Parameter Name="IdAutor" Type="Int32" />
            <asp:Parameter Name="Tekst" Type="String" />
            <asp:Parameter Name="DatumDodavanja" Type="DateTime" />
            <asp:Parameter Name="Odobren" Type="Boolean" />
        </UpdateParameters>

    </asp:SqlDataSource>

</asp:Content>
