<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<script src='<%=Url.Content("~/swfupload/swfupload.js") %>' type="text/javascript"></script>
<script src='<%=Url.Content("~/swfupload/handlers.js") %>' type="text/javascript"></script>
<script type="text/javascript">
    var swfu;
    window.onload = function () {
        swfu = new SWFUpload({
            // Backend Settings
            upload_url: '<%=Url.Content("~/Utility/upload")%>',
            post_params: {
                "ASPSESSID": "<%=Session.SessionID%>"
            },

            // File Upload Settings
            file_size_limit: "3 MB",
            file_types: "*.jpg",
            file_types_description: "JPG Images",
            file_upload_limit: 0,    // Zero means unlimited

            // Event Handler Settings - these functions as defined in Handlers.js
            //  The handlers are not part of SWFUpload but are part of my website and control how
            //  my website reacts to the SWFUpload events.
            swfupload_preload_handler: preLoad,
            swfupload_load_failed_handler: loadFailed,
            file_queue_error_handler: fileQueueError,
            file_dialog_complete_handler: fileDialogComplete,
            upload_progress_handler: uploadProgress,
            upload_error_handler: uploadError,
            upload_success_handler: uploadSuccess,
            upload_complete_handler: uploadComplete,

            // Button settings
            button_image_url: '<%=Url.Content("~/images/XPButtonNoText_160x22.png")%>',
            button_placeholder_id: "spanButtonPlaceholder",
            button_width: 180,
            button_height: 22,
            button_text: '<span class="button">上传图片<span class="buttonSmall">(小于3M，压缩保存）</span></span>',
            button_text_style: '.button { font-family: Helvetica, Arial, sans-serif; font-size: 14pt; } .buttonSmall { font-size: 10pt; }',
            button_text_top_padding: 1,
            button_text_left_padding: 5,

            // Flash Settings
            flash_url: '<%=Url.Content("~/swfupload/swfupload.swf")%>', // Relative to this file
            flash9_url: '<%=Url.Content("~/swfupload/swfupload_FP9.swf")%>', // Relative to this file

            custom_settings: {
                upload_target: "divFileProgressContainer"
            },

            // Debug Settings
            debug: false

        });
    }
</script>
<div id="swfu_container" style="margin: 0px 10px;">
    <div>
        <span id="spanButtonPlaceholder"></span>
    </div>
    <div id="divFileProgressContainer">
    </div>
    <div id="thumbnails">
    </div>
</div>
