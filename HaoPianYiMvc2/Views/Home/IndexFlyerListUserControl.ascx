<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PagedList<HaoPianYiMvc2.Models.Flyer>>" %>
<div align="center ">
    Ajax Request运行用了<%=new TimeSpan(Performance.GetTickCount() - (long)Context.Items["BeginRequestTickCount"]).TotalMilliseconds%>毫秒！（1秒=1000毫秒）
</div>
<%  foreach (var item in Model)
         Html.RenderPartial("FlyerItem", item);
%>
<%=Ajax.Pager(Model,new PagerOptions{ HorizontalAlign="right", PageIndexParameterName="pageIndex"}, new AjaxOptions{UpdateTargetId="flyer_list"}, null )%>

