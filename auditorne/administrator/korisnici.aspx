<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/administrator.Master" AutoEventWireup="true" CodeBehind="korisnici.aspx.cs" Inherits="aspsajt.Administrator.korisnici" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderCenter" runat="server">

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="UserId" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." Width="646px">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" />
            <asp:BoundField DataField="UserId" HeaderText="UserId" ReadOnly="True" SortExpression="UserId" Visible="False" />
            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
            <asp:BoundField DataField="LastActivityDate" HeaderText="LastActivityDate" SortExpression="LastActivityDate" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:VezaSaBazom %>" DeleteCommand="DELETE FROM [aspnet_Users] WHERE [UserId] = @UserId" InsertCommand="INSERT INTO [aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (@ApplicationId, @UserId, @UserName, @LoweredUserName, @MobileAlias, @IsAnonymous, @LastActivityDate)" ProviderName="<%$ ConnectionStrings:VezaSaBazom.ProviderName %>" SelectCommand="SELECT [ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate] FROM [aspnet_Users]" UpdateCommand="UPDATE [aspnet_Users] SET [ApplicationId] = @ApplicationId, [UserName] = @UserName, [LoweredUserName] = @LoweredUserName, [MobileAlias] = @MobileAlias, [IsAnonymous] = @IsAnonymous, [LastActivityDate] = @LastActivityDate WHERE [UserId] = @UserId">
        <DeleteParameters>
            <asp:Parameter Name="UserId" Type="Object" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ApplicationId" Type="Object" />
            <asp:Parameter Name="UserId" Type="Object" />
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="LoweredUserName" Type="String" />
            <asp:Parameter Name="MobileAlias" Type="String" />
            <asp:Parameter Name="IsAnonymous" Type="Boolean" />
            <asp:Parameter Name="LastActivityDate" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ApplicationId" Type="Object" />
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="LoweredUserName" Type="String" />
            <asp:Parameter Name="MobileAlias" Type="String" />
            <asp:Parameter Name="IsAnonymous" Type="Boolean" />
            <asp:Parameter Name="LastActivityDate" Type="DateTime" />
            <asp:Parameter Name="UserId" Type="Object" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
