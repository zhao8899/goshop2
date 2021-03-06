<#assign S_URL=request.contextPath />
<!DOCTYPE html>
<html>
<head>
    <meta content="IE=edge;chrome=1" http-equiv="X-UA-Compatible">
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
    <title>店铺分类</title>

    <script src="${S_URL}/static/scripts/jquery/jquery.js"></script>
    <script src="${S_URL}/static/scripts/jquery/jquery-browser.js"></script>
    <script src="${S_URL}/static/scripts/jquery/waypoints.js"></script>
    <script src="${S_URL}/static/scripts/jquery/jquery.validation.js"></script>
    <script src="${S_URL}/static/scripts/jquery-ui/jquery.ui.js"></script>
    <script src="${S_URL}/static/scripts/utils/area_array.js"></script>
    <script src="${S_URL}/static/scripts/shop/common.js"></script>
    <script src="${S_URL}/static/scripts/admincp.js"></script>
    <link id="cssfile2" type="text/css" rel="stylesheet" href="${S_URL}/static/styles/skin_0.css">
    <script type="text/javascript">
        SITEURL = '${S_URL}';
    </script>
</head>
<body>
<div id="append_parent"></div>
<div id="ajaxwaitid"></div>

<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>店铺分类</h3>
            <ul class="tab-base">
                <li><a href="${S_URL}/cms_article_class/index"><span>管理</span></a></li>
                <li><a href="${S_URL}/cms_article_class/save"><span>新增</span></a></li>
                <li><a class="current" href="JavaScript:void(0);"><span>编辑</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form method="post" id="store_class_form" action="${S_URL}/cms_article_class/update">
        <input type="hidden" value="${P_CLASS.parentId!''}" name="parentId" id="parentId">
        <input type="hidden" value="${RequestParameters['sc_id']}" name="classId" id="classId">
        <table class="table tb-type2">
            <tbody>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="required" colspan="2"><label for="className" class="validation">分类名称:</label></td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform"><input type="text" class="txt" id="className" name="className" value="${P_CLASS.className}"></td>
                <td class="vatop tips"></td>
            </tr>
            <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="required" colspan="2"><label for="sort">排序:</label></td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform"><input type="text" class="txt" id="classSort" name="classSort" value="${P_CLASS.classSort}"></td>
                <td class="vatop tips">数字范围为0~255，数字越小越靠前</td>
            </tr>
            </tbody>
            <tfoot>
            <tr class="tfoot">
                <td colspan="15"><a id="submitBtn" class="btn" href="JavaScript:void(0);"><span>提交</span></a></td>
            </tr>
            </tfoot>
        </table>
    </form>
</div>
<script>
    //按钮先执行验证再提交表单
    $(function(){$("#submitBtn").click(function(){
        if($("#store_class_form").valid()){
            $("#store_class_form").submit();
        }
    });
    });
    //
    $(document).ready(function(){
        $('#store_class_form').validate({
            errorPlacement: function(error, element){
                error.appendTo(element.parent().parent().prev().find('td:first'));
            },

            rules : {
                className : {
                    required : true,
                    remote   : {
                        url :'check_class_name?for=json',
                        type:'get',
                        data:{
                            className : function(){
                                return $('#className').val();
                            },
                            parentId : function() {
                                return $('#parentId').val();
                            },
                            classId : function(){
                                return $('#classId').val();
                            }
                        }
                    }
                },
                classSort : {
                    number   : true
                }
            },
            messages : {
                className : {
                    required : '分类名称不能为空',
                    remote   : '该分类名称已经存在了，请您换一个'
                },
                classSort  : {
                    number   : '分类排序仅能为数字'
                }
            }
        });
    });
</script>

</body></html>