<%@ Page Title="Blog" Language="C#" MasterPageFile="~/glavna.Master" AutoEventWireup="true" CodeBehind="blog.aspx.cs" Inherits="auditorne.blog" %>
<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="ContentCentralniDeo" ContentPlaceHolderID="centralniDeo" runat="server">
<h2>Postovi</h2>
    <table style="width: 100%;" id="postList" runat="server">       
    </table>
</asp:Content>
<asp:Content ID="ContentLevaStrana" ContentPlaceHolderID="levaStrana" runat="server">
Blog strana levi deo
</asp:Content>
