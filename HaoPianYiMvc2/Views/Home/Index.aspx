<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<PagedList<HaoPianYiMvc2.Models.Flyer>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
   happybuy.vv.cc带给你不一般的体验，是不是实惠由你说了算！
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%=Html.ActionLink("列出所有商家", "Index", "Merchant") %><br />
    <div id="flyer_list">
        <%Html.RenderPartial("IndexFlyerListUserControl"); %>
    </div>
</asp:Content>
