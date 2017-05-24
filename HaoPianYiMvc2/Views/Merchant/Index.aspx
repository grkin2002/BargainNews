<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<HaoPianYiMvc2.ViewModels.MerchantViewModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Merchant List 商家列表</h2>
    <% foreach (var item in Model)
       { %>
              <div style="font: italic bold 12px/30px Georgia,serif;">
              <%=item.letter%> --
              </div>
             <%foreach (var merchant in item.merchants)
               { %>
                     <div style="margin:5px 25px;">                                
                    <%=Html.ActionLink(merchant.MerchantName, "ListFlyersOfThisMerchant", "Merchant", new { id=merchant.MerchantId }, null)%>
                    </div>
            <% }
        } %>
</asp:Content>
