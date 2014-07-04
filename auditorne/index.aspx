<%@ Page Title="Pocetna" Language="C#" MasterPageFile="~/Glavna.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="aspsajt.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderCenterRight" runat="server">
    <asp:ListView ID="ListViewProizvodi" runat="server" DataSourceID="SqlDataSource1">
        <LayoutTemplate>

            <div id="productsNew">
					<div class="productsTitleBar">
						<div style="float:left;margin-top:5px;margin-left:5px;">NOVI</div>
						<a href="#">Klikni da vidis sve proizvode</a></div>
					<div class="productsSortBar">
						Sortiraj po: 
						PRICE: <select>
							<option value="asc">Ascending</option>
							<option value="desc">Descending</option>
						</select>
						SEX: <select>
							<option value="m">Male</option>
							<option value="f">Female</option>
						</select>
						SIZE: <select>
							<option value="s">S</option>
							<option value="m">M</option>
							<option value="l">L</option>
							<option value="xl">XL</option>
							<option value="xxl">XXL</option>
						</select>
						<span class="filterButton"><a href="#">filter products</a></span>
						<div class="filterSlider"> ovde slajder filter jquery link caroseul</div>
					</div>
                    <div id="itemPlaceHolder" runat="server">
					
					
					

				</div>

                </div>

        </LayoutTemplate>
        <ItemTemplate>
                <div id="itemPlaceHolder">

                    <div class="product">
						<p><%#Eval("Naziv2") %> <%#Eval("Naziv") %></p>
						<a href='proizvod.aspx?proizvod=<%#Eval("IdProizvod") %>'><img src="<%#Eval("MalaUrl") %>"></a><br />
						<span class="buyButton"><a href="#">Add to basket</a></span>
						<span class="priceButton"><%#Eval("Cena") %>din</span>
					</div>

                </div>
        </ItemTemplate>
    </asp:ListView>
    <div style="clear:both"></div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:aspAuditorneConnectionString %>"
         SelectCommand="SELECT * FROM Proizvodi p LEFT OUTER JOIN Kategorije k ON p.IdKategorija = k.IdKategorija LEFT OUTER JOIN Brendovi b ON p.IdBrend = b.IdBrend LEFT OUTER JOIN Slike s ON p.IdProizvod = s.IdProizvod WHERE Glavna = 1">

    </asp:SqlDataSource>
    
    <asp:DataPager ID="dpProizvodi" PageSize="6" PagedControlID="ListViewProizvodi" runat="server">
        <Fields>
            <asp:NextPreviousPagerField  ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"/>
            <asp:NumericPagerField />
            <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
        </Fields>
    </asp:DataPager>

</asp:Content>
