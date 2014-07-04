<%@ Page Title="" Language="C#" MasterPageFile="~/administrator/administrator.Master" AutoEventWireup="true" CodeBehind="slajder.aspx.cs" Inherits="auditorne.administrator.slajder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderCenter" runat="server">
    Dodaj slike za slajder<br />
    Naziv: <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br />
    <asp:FileUpload ID="FileUpload1" runat="server" /><br />
    <asp:Button ID="Button1" runat="server" Text="Dodaj" OnClick="Button1_Click" />
</asp:Content>
