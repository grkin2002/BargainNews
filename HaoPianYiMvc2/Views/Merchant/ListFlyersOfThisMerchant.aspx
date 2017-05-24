<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<HaoPianYiMvc2.Models.Flyer>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ListFlyersOfThisMerchant
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        列出商家<%=ViewData["MerchantName"] %>的所有flyer</h2>
    <%
        
       foreach (var item in Model)
      {
          Html.RenderPartial("FlyerItem", item);
      }
    %>
</asp:Content>
