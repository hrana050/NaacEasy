﻿var getcheckboxid = "";
var countCheckedCheckboxes = "";
$(document).ready(function () {
  
    //var fileSelectEle = document.getElementById('mcq_file');
    //fileSelectEle.onclick = charge;
    //function charge() {
    //    document.body.onfocus = checkOnCancel;
    //}
    //function checkOnCancel() {
    //    if (fileSelectEle.value.length == 0) {
    //        if (countCheckedCheckboxes == 4) {
    //            $("#select_1").prop("checked", false);
    //        }
    //        else if (countCheckedCheckboxes == 3) {
    //            $("#select_2").prop("checked", false);
    //        }
    //        else if (countCheckedCheckboxes == 2) {
    //            $("#select_3").prop("checked", false);
    //        }
    //        else if (countCheckedCheckboxes == 1) {
    //            $("#select_4").prop("checked", false);
    //        }

    //        if (getcheckboxid == "1") {

    //            $("#studentchk").prop("checked", false);
    //        }
    //        else if (getcheckboxid == "2") {

    //            $("#teacherchk").prop("checked", false);
    //        }
    //        else if (getcheckboxid == "3") {

    //            $("#employerchk").prop("checked", false);
    //        }
    //        else if (getcheckboxid == "4") {

    //            $("#alumnichk").prop("checked", false);
    //        }

           
    //    }
    //    document.body.onfocus = null;
    //}

    var $checkboxes = $('input[name="chkboxcount"]');

    $checkboxes.change(function () {
        countCheckedCheckboxes = $checkboxes.filter(':checked').length;
        if (countCheckedCheckboxes == 4) {
            $("#select_1").prop("checked", true);
        }
        else if(countCheckedCheckboxes == 3)
        {
            $("#select_2").prop("checked", true);
        }
        else if (countCheckedCheckboxes == 2) {
            $("#select_3").prop("checked", true);
        }
        else if (countCheckedCheckboxes == 1) {
            $("#select_4").prop("checked", true);
        }
        else {
            $("#select_1").prop("checked", false);
            $("#select_2").prop("checked", false);
            $("#select_3").prop("checked", false);
            $("#select_4").prop("checked", false);
        }
    });
   
    //var x = checkboxes.filter(':checked').length;
   
    $("#studentchk").click(function () {
        if (this.checked) {
            getcheckboxid = "1";
            $('#mcq_file').trigger('click');
          
        }
        else {

        }
    });
    $("#teacherchk").click(function () {
        if (this.checked) {
            $('#mcq_file').trigger('click');
            getcheckboxid = "2";
        }
        else {
        }
    });
    $("#employerchk").click(function () {
        if (this.checked) {
            getcheckboxid = "3";
            $('#mcq_file').trigger('click');
        }
        else {
           
        }
    });
    $("#alumnichk").click(function () {
        if (this.checked) {
             getcheckboxid = "4";
            $('#mcq_file').trigger('click');
        }
        else {
         
        }
    });

   
    var getlastcarddiv = "";
 //  ();loder
    //   filelist();
    $("#meetingnoteimg").attr("src", "../img/notes_selected.svg");
    $("#smallnotesimg").attr("src", "../img/notes_selected_small.svg");
    $("#meetingnoteli").addClass("selectedmenu");
    $("#meetingtoptitlediv").show();
    $("#meetinglistdiv").show();
    $("#meetinglistsec").show();
    //$("#lidashboard").addClass("addbackground");
});

function editbutton() {

    var getmetric = $("#metricname").text();
    var getmetric = getmetric.substring(7, 12);
    if (getmetric == "1.1.2" || getmetric == "1.2.2") {

        $("#naac_132_133_div").show();
        $("#naac_113_121_div").hide();
        $("#naac_132_133_div").hide();
        $("#nodata_div").hide();
        
        $("#naac_134_div").hide();
        $("#naac_141").hide();
        $("#txt_112_122_name").attr("disabled", false);
        $("#txt_112_122_code").attr("disabled", false);
        $("#txt_112_122_intro").attr("disabled", false);
        $("#txt_112_122_status").attr("disabled", false);
        $("#txt_112_122_yearimp").attr("disabled", false);
        $("#txt_112_122_revision").attr("disabled", false);
        $("#txt_112_122_content").attr("disabled", false);
        $("#txtcourseoffered").val("").attr("disabled", false);
        $("#txt_coursecode").val("").attr("disabled", false);
        $("#txt_courseduration").val("").attr("disabled", false);
        $("#txt_year").val("").attr("disabled", false);
        $("#txt_timeoffered").val("").attr("disabled", false);
        $("#txt_stuenrolled").val("").attr("disabled", false);
        $("#txt_completing").val("").attr("disabled", false);
        $("#txt_linktodocument").val("").attr("disabled", false);

        $("#txt_113_121_name").val("").attr("disabled", false);
        $("#txt_113_121_code").val("").attr("disabled", false);
        $("#txt_113_121_intro").val("0").attr("disabled", false);
        $("#txt_113_121_content").val("").attr("disabled", false);

        $("#txt_134_name").val("").attr("disabled", false);
        $("#txt_134_code").val("").attr("disabled", false);
        $("#txt_134_student").val("").attr("disabled", false);
    }
    else if (getmetric == "1.3.2" || getmetric == "1.3.3")
    {

        $("#naac_132_133_div").hide();
        $("#naac_113_121_div").hide();
        $("#nodata_div").hide();
        $("#naac_132_133_div").show();
        $("#naac_134_div").hide();
        $("#naac_141").hide();

        $("#txt_linktodocument").val("").attr("disabled", false);
        $("#txt_112_122_name").val("").attr("disabled", false);
        $("#txt_112_122_code").val("").attr("disabled", false);
        $("#txt_112_122_intro").val("").attr("disabled", false);
        $("#txt_112_122_status").val("0").attr("disabled", false);
        $("#txt_112_122_yearimp").val("0").attr("disabled", false);
        $("#txt_112_122_revision").val("0").attr("disabled", false);
        $("#txt_112_122_content").val("").attr("disabled", false);

        $("#txtcourseoffered").attr("disabled", false);
        $("#txt_coursecode").attr("disabled", false);
        $("#txt_courseduration").attr("disabled", false);
        $("#txt_year").attr("disabled", false);
        $("#txt_timeoffered").attr("disabled", false);
        $("#txt_stuenrolled").attr("disabled", false);
        $("#txt_completing").attr("disabled", false);

        $("#txt_113_121_name").val("").attr("disabled", false);
        $("#txt_113_121_code").val("").attr("disabled", false);
        $("#txt_113_121_intro").val("0").attr("disabled", false);
        $("#txt_113_121_content").val("").attr("disabled", false);
        $("#txt_134_name").val("").attr("disabled", false);
        $("#txt_134_code").val("").attr("disabled", false);
        $("#txt_134_student").val("").attr("disabled", false);
    }
    else if (getmetric == "1.1.3" || getmetric == "1.2.1") {

        $("#naac_132_133_div").hide();
        $("#naac_113_121_div").show();
        $("#nodata_div").hide();
        $("#naac_132_133_div").hide();
        $("#naac_134_div").hide();
        $("#naac_141").hide();
        $("#txtcourseoffered").val("").attr("disabled", false);
        $("#txt_coursecode").val("").attr("disabled", false);
        $("#txt_courseduration").val("").attr("disabled", false);
        $("#txt_year").val("").attr("disabled", false);
        $("#txt_timeoffered").val("").attr("disabled", false);
        $("#txt_stuenrolled").val("").attr("disabled", false);
        $("#txt_completing").val("").attr("disabled", false);

        $("#txt_linktodocument").val("").attr("disabled", false);
        $("#txt_112_122_name").val("").attr("disabled", false);
        $("#txt_112_122_code").val("").attr("disabled", false);
        $("#txt_112_122_intro").val("").attr("disabled", false);
        $("#txt_112_122_status").val("0").attr("disabled", false);
        $("#txt_112_122_yearimp").val("0").attr("disabled", false);
        $("#txt_112_122_revision").val("0").attr("disabled", false);
        $("#txt_112_122_content").val("").attr("disabled", false);

        $("#txt_113_121_name").attr("disabled", false);
        $("#txt_113_121_code").attr("disabled", false);
        $("#txt_113_121_intro").attr("disabled", false);
        $("#txt_113_121_content").attr("disabled", false);

        $("#txt_134_name").val("").attr("disabled", false);
        $("#txt_134_code").val("").attr("disabled", false);
        $("#txt_134_student").val("").attr("disabled", false);

    }
    else if (getmetric == "1.3.4") {

        $("#naac_132_133_div").hide();
        $("#naac_113_121_div").hide();
        $("#nodata_div").hide();
        $("#naac_132_133_div").hide();
        $("#naac_134_div").show();
        $("#naac_141").hide();
        $("#txtcourseoffered").val("").attr("disabled", false);
        $("#txt_coursecode").val("").attr("disabled", false);
        $("#txt_courseduration").val("").attr("disabled", false);
        $("#txt_year").val("").attr("disabled", false);
        $("#txt_timeoffered").val("").attr("disabled", false);
        $("#txt_stuenrolled").val("").attr("disabled", false);
        $("#txt_completing").val("").attr("disabled", false);

        $("#txt_linktodocument").val("").attr("disabled", false);
        $("#txt_112_122_name").val("").attr("disabled", false);
        $("#txt_112_122_code").val("").attr("disabled", false);
        $("#txt_112_122_intro").val("").attr("disabled", false);
        $("#txt_112_122_status").val("0").attr("disabled", false);
        $("#txt_112_122_yearimp").val("0").attr("disabled", false);
        $("#txt_112_122_revision").val("0").attr("disabled", false);
        $("#txt_112_122_content").val("").attr("disabled", false);

        $("#txt_113_121_name").val("").attr("disabled", false);
        $("#txt_113_121_code").val("").attr("disabled", false);
        $("#txt_113_121_intro").val("").attr("disabled", false);
        $("#txt_113_121_content").val("").attr("disabled", false);

        $("#txt_134_name").attr("disabled", false);
        $("#txt_134_code").attr("disabled", false);
        $("#txt_134_student").attr("disabled", false);

    }
    else if (getmetric == "1.4.1") {
        $("#naac_132_133_div").hide();
        $("#nodata_div").hide();
        $("#naac_113_121_div").hide();
        $("#naac_132_133_div").hide();
        $("#naac_134_div").hide();
        $("#Qualitative").hide();
    }
    else if (getmetric == "1.1.1" || getmetric == "1.3.1")
    {
        $("#naac_132_133_div").hide();
        $("#nodata_div").hide();
        $("#naac_113_121_div").hide();
        $("#naac_132_133_div").hide();
        $("#naac_134_div").hide();
        $("#naac_141").hide();
        $("#txt_qualitative").attr("disabled", false);
    }

    $("#update_metricdata").show();
    $("#edit_metricdata").hide();
}
function updatebutton()
{
    loder();
    var dataid = $("#dataid").val();
    var metrictype = $("#metrictype").val();

    var vmdatastructureobj = {};
    vmdatastructureobj.dataid = dataid;
        vmdatastructureobj.metricid = $("#metricid").text();
        vmdatastructureobj.programname_112 = $('#txt_112_122_name').val();
        vmdatastructureobj.programcode_112 = $('#txt_112_122_code').val();
        vmdatastructureobj.yearof_introduction_112 = $('#txt_112_122_intro').val();
        vmdatastructureobj.cbcs_ecs_status_112 = $('#txt_112_122_status').val();
        vmdatastructureobj.yearof_cbcs_ecs_imp_112 = $('#txt_112_122_yearimp').val();
        vmdatastructureobj.yearof_revision_112 = $('#txt_112_122_revision').val();
        vmdatastructureobj.contentchangepast_5_112 = $('#txt_112_122_content').val();
        vmdatastructureobj.qualitative = $('#txt_qualitative').val();


        vmdatastructureobj.coursename_132 = $('#txtcourseoffered').val();
        vmdatastructureobj.course_code_132 = $('#txt_coursecode').val();
        vmdatastructureobj.durationof_course_132 = $('#txt_courseduration').val();
        vmdatastructureobj.yearof_offering_132 = $('#txt_year').val();
        vmdatastructureobj.times_offered_132 = $('#txt_timeoffered').val();
        vmdatastructureobj.enroll_student_132 = $('#txt_stuenrolled').val();
        vmdatastructureobj.stu_completing_132 = $('#txt_completing').val();


        vmdatastructureobj.nameofcourse_113 = $('#txt_113_121_name').val();
        vmdatastructureobj.coursecode_113 = $('#txt_113_121_code').val();
        vmdatastructureobj.yearof_intro_113 = $('#txt_113_121_intro').val();
        vmdatastructureobj.contentactivity_113 = $('#txt_113_121_content').val();

        vmdatastructureobj.programcode_134 = $('#txt_134_code').val();
        vmdatastructureobj.programname_134 = $('#txt_134_name').val(); 
        vmdatastructureobj.studentname_134 = $('#txt_134_student').val();

        vmdatastructureobj.metrictype = metrictype;
        vmdatastructureobj.type = "update";
     
        var jsonData = JSON.stringify({
            vmdatastructureobj: vmdatastructureobj,
        });
        $.ajax({
            type: 'POST',
            url: "naaceasy.aspx/insert_data",
            data: jsonData,
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (r) {
                // alert(r.d);
                $("#txt_linktodocument").val("").attr("disabled", false);
                $("#txt_112_122_name").val("").attr("disabled", false);
                $("#txt_112_122_code").val("").attr("disabled", false);
                $("#txt_112_122_intro").val("").attr("disabled", false);
                $("#txt_112_122_status").val("0").attr("disabled", false);
                $("#txt_112_122_yearimp").val("0").attr("disabled", false);
                $("#txt_112_122_revision").val("0").attr("disabled", false);
                $("#txt_112_122_content").val("").attr("disabled", false);

                $("#txtcourseoffered").val("").attr("disabled", false);
                $("#txt_coursecode").val("").attr("disabled", false);
                $("#txt_courseduration").val("").attr("disabled", false);
                $("#txt_year").val("").attr("disabled", false);
                $("#txt_timeoffered").val("").attr("disabled", false);
                $("#txt_stuenrolled").val("").attr("disabled", false);
                $("#txt_completing").val("").attr("disabled", false);

                $("#txt_113_121_name").val("").attr("disabled", false);
                $("#txt_113_121_code").val("").attr("disabled", false);
                $("#txt_113_121_intro").val("0").attr("disabled", false);
                $("#txt_113_121_content").val("").attr("disabled", false);

                var getmetrictitle = $("#metricname").text();
                var getmetric = getmetrictitle.substring(7, 12);
                if (getmetric == '1.1.2' || getmetric == '1.2.2' || getmetric == '1.3.2' || getmetric == '1.3.3' || getmetric == '1.1.3' || getmetric == '1.2.1' || getmetric == '1.3.4') {
                    $("#Add_data").show();
                    metricid = $("#metricid").text();
                    getmetricdatalist(metricid, 'list');
                }
                else if (getmetric == '1.4.1') {
                    metricid = $("#metricid").text();
                    getmetricdatalist(metricid, 'mcq');
                    $("#metricadddiv").text(getmetric);
                }
                else if (getmetric == '1.1.1' || getmetric == "1.3.1") {
                    metricid = $("#metricid").text();
                    getmetricdatalist(metricid, 'qualitative');
                    $("#metricadddiv").text(getmetric);
                }

                stoploader();
            },
            error: function (r) {
                alert(r.responseText);
            }
        })
        return false;
 
}
function showmetricadddiv()
{
    var getmetricdiv = $("#metricadddiv").text();
    if (getmetricdiv == '1.1.2' || getmetricdiv == '1.2.2') {
        $("#Qualitative").hide();
        $("#savedata").show();
        $("#datadiscard").show();
        $("#Add_data").hide();
        $("#naac_112_122_div").show();
        $("#naac_134_div").hide();
        $("#naac_141_div").hide();
        $("#naac_132_133_div").hide();
        $("#naac_113_121_div").hide();
        $("#nodata_div").hide();
        $("#fileupload").show();
        $("#datalist").hide();

        $("#txt_linktodocument").val("").attr("disabled", false);
        $("#txt_112_122_name").val("").attr("disabled", false);
        $("#txt_112_122_code").val("").attr("disabled", false);
        $("#txt_112_122_intro").val("").attr("disabled", false);
        $("#txt_112_122_status").val("0").attr("disabled", false);
        $("#txt_112_122_yearimp").val("0").attr("disabled", false);
        $("#txt_112_122_revision").val("0").attr("disabled", false);
        $("#txt_112_122_content").val("").attr("disabled", false);

        $("#txtcourseoffered").val("").attr("disabled", false);
        $("#txt_coursecode").val("").attr("disabled", false);
        $("#txt_courseduration").val("").attr("disabled", false);
        $("#txt_year").val("").attr("disabled", false);
        $("#txt_timeoffered").val("").attr("disabled", false);
        $("#txt_stuenrolled").val("").attr("disabled", false);
        $("#txt_completing").val("").attr("disabled", false);

        $("#txt_113_121_name").val("").attr("disabled", false);
        $("#txt_113_121_code").val("").attr("disabled", false);
        $("#txt_113_121_intro").val("0").attr("disabled", false);
        $("#txt_113_121_content").val("").attr("disabled", false);

        $("#dataid").val("0");
        $('#filelistshow div').remove();
        $('#linkshow div').remove();
       
    }
    else if(getmetricdiv == '1.3.2' || getmetricdiv == '1.3.3')
    {
        $("#Qualitative").hide();
        $("#savedata").show();
        $("#datadiscard").show();
        $("#Add_data").hide();
        $("#naac_112_122_div").hide();
        $("#naac_134_div").hide();
        $("#naac_141_div").hide();
        $("#naac_132_133_div").show();
        $("#naac_113_121_div").hide();
        $("#nodata_div").hide();
        $("#fileupload").show();
        $("#datalist").hide();

        $("#txt_linktodocument").val("").attr("disabled", false);
        $("#txt_112_122_name").val("").attr("disabled", false);
        $("#txt_112_122_code").val("").attr("disabled", false);
        $("#txt_112_122_intro").val("").attr("disabled", false);
        $("#txt_112_122_status").val("0").attr("disabled", false);
        $("#txt_112_122_yearimp").val("0").attr("disabled", false);
        $("#txt_112_122_revision").val("0").attr("disabled", false);
        $("#txt_112_122_content").val("").attr("disabled", false);

        $("#txtcourseoffered").val("").attr("disabled", false);
        $("#txt_coursecode").val("").attr("disabled", false);
        $("#txt_courseduration").val("").attr("disabled", false);
        $("#txt_year").val("").attr("disabled", false);
        $("#txt_timeoffered").val("").attr("disabled", false);
        $("#txt_stuenrolled").val("").attr("disabled", false);
        $("#txt_completing").val("").attr("disabled", false);

        $("#txt_113_121_name").val("").attr("disabled", false);
        $("#txt_113_121_code").val("").attr("disabled", false);
        $("#txt_113_121_intro").val("0").attr("disabled", false);
        $("#txt_113_121_content").val("").attr("disabled", false);

        $("#dataid").val("0");
        $('#filelistshow div').remove();
        $('#linkshow div').remove();
     
    }
    else if(getmetricdiv == '1.1.3' || getmetricdiv == '1.2.1')
    {
        $("#Qualitative").hide();
        $("#savedata").show();
        $("#datadiscard").show();
        $("#Add_data").hide();
        $("#naac_112_122_div").hide();
        $("#naac_134_div").hide();
        $("#naac_141_div").hide();
        $("#naac_132_133_div").hide();
        $("#naac_113_121_div").show();
        $("#nodata_div").hide();
        
        $("#fileupload").show();
        $("#datalist").hide();

        $("#txt_linktodocument").val("").attr("disabled", false);
        $("#txt_112_122_name").val("").attr("disabled", false);
        $("#txt_112_122_code").val("").attr("disabled", false);
        $("#txt_112_122_intro").val("").attr("disabled", false);
        $("#txt_112_122_status").val("0").attr("disabled", false);
        $("#txt_112_122_yearimp").val("0").attr("disabled", false);
        $("#txt_112_122_revision").val("0").attr("disabled", false);
        $("#txt_112_122_content").val("").attr("disabled", false);

        $("#txtcourseoffered").val("").attr("disabled", false);
        $("#txt_coursecode").val("").attr("disabled", false);
        $("#txt_courseduration").val("").attr("disabled", false);
        $("#txt_year").val("").attr("disabled", false);
        $("#txt_timeoffered").val("").attr("disabled", false);
        $("#txt_stuenrolled").val("").attr("disabled", false);
        $("#txt_completing").val("").attr("disabled", false);

        $("#txt_113_121_name").val("").attr("disabled", false);
        $("#txt_113_121_code").val("").attr("disabled", false);
        $("#txt_113_121_intro").val("0").attr("disabled", false);
        $("#txt_113_121_content").val("").attr("disabled", false);

        $("#dataid").val("0");
        $('#filelistshow div').remove();
        $('#linkshow div').remove();
    }
    else if (getmetricdiv == '1.3.4') {
        $("#Qualitative").hide();
        $("#savedata").show();
        $("#datadiscard").show();
        $("#Add_data").hide();
        $("#naac_112_122_div").hide();
        $("#naac_134_div").show();
        $("#naac_141_div").hide();
        $("#naac_132_133_div").hide();
        $("#naac_113_121_div").hide();
        $("#nodata_div").hide();
        $("#fileupload").show();
        $("#datalist").hide();

        $("#txt_linktodocument").val("").attr("disabled", false);
        $("#txt_112_122_name").val("").attr("disabled", false);
        $("#txt_112_122_code").val("").attr("disabled", false);
        $("#txt_112_122_intro").val("").attr("disabled", false);
        $("#txt_112_122_status").val("0").attr("disabled", false);
        $("#txt_112_122_yearimp").val("0").attr("disabled", false);
        $("#txt_112_122_revision").val("0").attr("disabled", false);
        $("#txt_112_122_content").val("").attr("disabled", false);

        $("#txt_134_name").val("").attr("disabled", false);
        $("#txt_134_code").val("").attr("disabled", false);
        $("#txt_134_student").val("").attr("disabled", false);

        $("#txt_113_121_name").val("").attr("disabled", false);
        $("#txt_113_121_code").val("").attr("disabled", false);
        $("#txt_113_121_intro").val("0").attr("disabled", false);
        $("#txt_113_121_content").val("").attr("disabled", false);

        $("#dataid").val("0");
        $('#filelistshow div').remove();
        $('#linkshow div').remove();
    }
    else if (getmetricdiv == '1.4.1') {
        $("#Qualitative").hide();
        $("#savedata").show();
        $("#datadiscard").show();
        $("#Add_data").hide();
        $("#naac_112_122_div").hide();
        $("#naac_134_div").hide();
        $("#naac_141_div").show();
        $("#naac_132_133_div").hide();
        $("#naac_113_121_div").hide();
        $("#nodata_div").hide();
        $("#fileupload").show();
        $("#datalist").hide();
        $("#dataid").val("0");
        $('#filelistshow div').remove();
        $('#linkshow div').remove();
    }
    else if (getmetricdiv == '1.1.1' || getmetricdiv == "1.3.1")
    {
        $("#savedata").show();
        $("#datadiscard").show();
        $("#Add_data").hide();
        $("#naac_112_122_div").hide();
        $("#naac_134_div").hide();
        $("#naac_141_div").hide();
        $("#naac_132_133_div").hide();
        $("#naac_113_121_div").hide();
        $("#nodata_div").hide();
        $("#Qualitative").show();
        $("#fileupload").show();
        $("#datalist").hide();
        $('#filelistshow div').remove();
        $('#linkshow div').remove();
    }
}
function discardbtn()
{
    $("#savedata").hide();
    $("#datadiscard").hide();
    $("#Add_data").show();
    $("#naac_112_122_div").hide();
    $("#naac_134_div").hide();
    $("#naac_141_div").hide();
    $("#naac_132_133_div").hide();
    $("#naac_113_121_div").hide();
    $("#nodata_div").hide();
    $("#fileupload").hide();

    var getmetrictitle = $("#metricname").text();
    var getmetric = getmetrictitle.substring(7, 12);
    if (getmetric == '1.1.2' || getmetric == '1.2.2' || getmetric == '1.3.2' || getmetric == '1.3.3' || getmetric == '1.2.1' || getmetric == '1.1.3' || getmetric == '1.3.4' ) {
        metricid = $("#metricid").text();
        getmetricdatalist(metricid,'list');
        $("#datalist").show();
    }
    else if (getmetric == '1.4.1') {
        metricid = $("#metricid").text();
        getmetricdatalist(metricid, 'mcq');
        $("#metricadddiv").text(getmetric);
        $("#naac_141_div").show();

    }
    else if (getmetric == '1.1.1' || getmetric == "1.3.1") {
        metricid = $("#metricid").text();
        getmetricdatalist(metricid, 'qualitative');
        $("#metricadddiv").text(getmetric);
        $("#Qualitative").show();
        
    }
}
function manualtab() {

    $("#Add_data").hide();
    $("#edit_metricdata").hide();
    $("#update_metricdata").hide();
    $("#deletemetricdata").hide();
    $("#fileupload").show();
    $("#datalist").hide();
    $("#savedata").hide();
    $("#datadiscard").hide();
    $("#Add_data").hide();
    $("#naacssrdiv").hide();
    $("#naacfaqdiv").hide();
    //   $("#naacdatadiv").hide();
    $("#naac_112_122_div").hide();
    $("#naac_134_div").hide();
    $("#naac_141_div").hide();
    $("#naac_132_133_div").hide();
    $("#naac_113_121_div").hide();
    $("#nodata_div").hide();
    $("#Qualitative").hide();
    $("#naacmanualmaindiv").show();
    $("#naacmaindatadiv").hide();
    $("#naacsopmaindiv").hide();
    $("#hometab").addClass("naactabul_li");
    $("#soptab").removeClass("naactabul_li");
    $("#Guidelinestab").removeClass("naactabul_li");
    $("#competitiontab").removeClass("naactabul_li");
    $("#faqtab").removeClass("naactabul_li");
    $("#datatab").removeClass("naactabul_li");
}
function soptab() {

    $("#Add_data").hide();
    $("#edit_metricdata").hide();
    $("#update_metricdata").hide();
    $("#deletemetricdata").hide();
    $("#fileupload").show();
    $("#datalist").hide();
    $("#savedata").hide();
    $("#datadiscard").hide();
    $("#Add_data").hide();
    $("#naacssrdiv").hide();
    $("#naacfaqdiv").hide();
    // $("#naacdatadiv").hide();
    $("#naac_112_122_div").hide();
    $("#naac_134_div").hide();
    $("#naac_141_div").hide();
    $("#naac_132_133_div").hide();
    $("#naac_113_121_div").hide();
    $("#nodata_div").hide();
    $("#Qualitative").hide();
    $("#naacmanualmaindiv").hide();
    $("#naacmaindatadiv").hide();
    $("#naacsopmaindiv").show();
    $("#hometab").removeClass("naactabul_li");
    $("#soptab").addClass("naactabul_li");
    $("#Guidelinestab").removeClass("naactabul_li");
    $("#competitiontab").removeClass("naactabul_li");
    $("#faqtab").removeClass("naactabul_li");
    $("#datatab").removeClass("naactabul_li");
}
function guidelinetab() {

    $("#Add_data").hide();
    $("#edit_metricdata").hide();
    $("#update_metricdata").hide();
    $("#deletemetricdata").hide();
    $("#fileupload").show();
    $("#datalist").hide();
    $("#savedata").hide();
    $("#datadiscard").hide();
    $("#Add_data").hide();
    $("#naacssrdiv").hide();
    $("#naacfaqdiv").hide();
    // $("#naacdatadiv").hide();
    $("#naac_112_122_div").hide();
    $("#naac_134_div").hide();
    $("#naac_141_div").hide();
    $("#naac_132_133_div").hide();
    $("#naac_113_121_div").hide();
    $("#nodata_div").hide();
    $("#Qualitative").hide();
    $("#naacsopmaindiv").hide();
    $("#naacmanualmaindiv").hide();
    $("#naacmaindatadiv").hide();
    $("#hometab").removeClass("naactabul_li");
    $("#soptab").removeClass("naactabul_li");
    $("#Guidelinestab").addClass("naactabul_li");
    $("#competitiontab").removeClass("naactabul_li");
    $("#faqtab").removeClass("naactabul_li");
    $("#datatab").removeClass("naactabul_li");
}
function ssrtab() {

    $("#Add_data").hide();
    $("#edit_metricdata").hide();
    $("#update_metricdata").hide();
    $("#deletemetricdata").hide();
    $("#fileupload").show();
    $("#datalist").hide();
    $("#savedata").hide();
    $("#datadiscard").hide();
    $("#Add_data").hide();
    $('#ssrcontentarea div').remove();
    $('#ssrfileuploaded div').remove();
    var criteriaid = $("#ssrhidenid").val();

    getcompetionssr(criteriaid);
    $("#naacfaqdiv").hide();
    $("#naacssrdiv").show();
    $("#naacsopmaindiv").hide();
    $("#naacmanualmaindiv").hide();
    $("#naacmaindatadiv").hide();
    //  $("#naacdatadiv").hide();
    $("#naac_112_122_div").hide();
    $("#naac_134_div").hide();
    $("#naac_141_div").hide();
    $("#naac_132_133_div").hide();
    $("#naac_113_121_div").hide();
    $("#nodata_div").hide();
    $("#Qualitative").hide();
    $("#hometab").removeClass("naactabul_li");
    $("#soptab").removeClass("naactabul_li");
    $("#Guidelinestab").removeClass("naactabul_li");
    $("#competitiontab").addClass("naactabul_li");
    $("#faqtab").removeClass("naactabul_li");
    $("#datatab").removeClass("naactabul_li");
}
function faqtab() {

    $("#Add_data").hide();
    $("#edit_metricdata").hide();
    $("#update_metricdata").hide();
    $("#deletemetricdata").hide();
    $("#fileupload").show();
    $("#datalist").hide();
    $("#savedata").hide();
    $("#datadiscard").hide();
    $("#Add_data").hide();
    var criteriaid = $("#faqhidenid").val();
    getfaq(criteriaid);
    $("#naacfaqdiv").show();
    $("#naacssrdiv").hide();
    $("#naacsopmaindiv").hide();
    $("#naacmanualmaindiv").hide();
    $("#naacmaindatadiv").hide();
    $("#hometab").removeClass("naactabul_li");
    $("#soptab").removeClass("naactabul_li");
    $("#Guidelinestab").removeClass("naactabul_li");
    $("#competitiontab").removeClass("naactabul_li");
    $("#faqtab").addClass("naactabul_li");
    $("#datatab").removeClass("naactabul_li");
    //$("#naacdatadiv").hide();
    $("#naac_112_122_div").hide();
    $("#naac_134_div").hide();
    $("#naac_141_div").hide();
    $("#naac_132_133_div").hide();
    $("#naac_113_121_div").hide();
    $("#nodata_div").hide();
    $("#Qualitative").hide();
}
function datatab() {
    $("#Add_data").hide();
    $("#edit_metricdata").hide();
    $("#update_metricdata").hide();
    $("#deletemetricdata").hide();
    $("#fileupload").show();
    var metricid="";
    $("#datalist").hide();
    $("#savedata").hide();
    $("#datadiscard").hide();
    $("#Add_data").hide();
    var getmetrictitle = $("#metricname").text();
    var getmetric = getmetrictitle.substring(7, 12);
    if (getmetric == '1.1.2' || getmetric == '1.2.2' || getmetric == '1.3.2' || getmetric == '1.3.3' || getmetric == '1.1.3' || getmetric == '1.2.1' || getmetric == '1.3.4') {
      
        metricid = $("#metricid").text();
        getmetricdatalist(metricid,'list');
    }
    else if (getmetric == '1.4.1') {
     
        metricid = $("#metricid").text();
        getmetricdatalist(metricid, 'mcq');
        $("#metricadddiv").text(getmetric);
    }
    else if (getmetric == '1.1.1' || getmetric == "1.3.1") {
        metricid = $("#metricid").text();
        getmetricdatalist(metricid, 'qualitative');
        $("#metricadddiv").text(getmetric);
    }
    $("#metricadddiv").text(getmetric);
    $("#naacsopmaindiv").hide();
    $("#naacmanualmaindiv").hide();
    $("#naacmaindatadiv").show();
    $("#hometab").removeClass("naactabul_li");
    $("#soptab").removeClass("naactabul_li");
    $("#Guidelinestab").removeClass("naactabul_li");
    $("#competitiontab").removeClass("naactabul_li");
    $("#faqtab").removeClass("naactabul_li");
    $("#datatab").addClass("naactabul_li");
    $("#naacfaqdiv").hide();
    $("#naacssrdiv").hide();
    
}
function visibledashboard() {
    $("#Add_data").hide();
    $("#edit_metricdata").hide();
    $("#update_metricdata").hide();
    $("#deletemetricdata").hide();
    $("#fileupload").show();
    $("#datalist").hide();
    $("#savedata").hide();
    $("#datadiscard").hide();
    $("#Add_data").hide();
    $("#dashboardimg").attr("src", "../img/home_selected.svg");
    $("#smalldashboardimg").attr("src", "../img/home_selected_small.svg");
    $("#dashboardli").addClass("selectedmenu");
    $("#meetingnoteimg").attr("src", "../img/notes_deselected.svg");
    $("#smallnotesimg").attr("src", "../img/notes_deselected_small.svg");
    $("#meetingnoteli").removeClass("selectedmenu");
    $("#todoimg").attr("src", "../img/todo_deselected.svg");
    $("#smalltodoimg").attr("src", "../img/todo_deselected_small.svg");
    $("#todoli").removeClass("selectedmenu");

    $("#addtododiv").hide();
    $("#todoaddsec").hide();
    $("#Dashboardtab").show();
    $("#meetingtoptitlediv").hide();
    $("#meetinglistdiv").hide();
    $("#meetinglistsec").hide();
    $("#todotasktoptitlediv").hide();
    $("#todotasklistdiv").hide();
    $("#todolistsec").hide();
    $("#meetingaddsec").hide();
    $("#addmeetingdiv").hide();
    $("#keyindicatordiv").hide();
    $("#keymetricdiv").hide();
    $("#keyindicatorname").text("");
    $("#metricdiv").hide();
    $("#navtabsection").hide();
    $("#metricdetailsdiv").hide();
 
}
function visiblemeetingtab() {
    $("#Add_data").hide();
    $("#edit_metricdata").hide();
    $("#update_metricdata").hide();
    $("#deletemetricdata").hide();
    $("#fileupload").show();
    $("#datalist").hide();
    $("#savedata").hide();
    $("#datadiscard").hide();
    $("#Add_data").hide();
    $("#dashboardimg").attr("src", "../img/home_deselected.svg");
    $("#smalldashboardimg").attr("src", "../img/home_deselected_small.svg");
    $("#dashboardli").removeClass("selectedmenu");
    $("#todoimg").attr("src", "../img/todo_deselected.svg");
    $("#smalltodoimg").attr("src", "../img/todo_deselected_small.svg");
    $("#todoli").removeClass("selectedmenu");
    $("#meetingnoteimg").attr("src", "../img/notes_selected.svg");
    $("#smallnotesimg").attr("src", "../img/notes_selected_small.svg");
    $("#meetingnoteli").addClass("selectedmenu");

    $("#keyindicatordiv").hide();
    $("#keymetricdiv").hide();
    $("#keyindicatorname").text("");
    $("#metricdiv").hide();
    $("#navtabsection").hide();
    $("#metricdetailsdiv").hide();
    $("#todoaddsec").hide();
    $("#addtododiv").hide();
    $("#meetingtoptitlediv").show();
    $("#meetinglistdiv").show();
    $("#meetinglistsec").show();
    $("#Dashboardtab").hide();
    $("#todotasktoptitlediv").hide();
    $("#todotasklistdiv").hide();
    $("#todolistsec").hide();
    $("#meetingaddsec").hide();
    $("#addmeetingdiv").hide();
}
function visibletodotab() {
    $("#Add_data").hide();
    $("#edit_metricdata").hide();
    $("#update_metricdata").hide();
    $("#deletemetricdata").hide();
    $("#fileupload").show();
    $("#datalist").hide();
    $("#savedata").hide();
    $("#datadiscard").hide();
    $("#Add_data").hide();
    $("#dashboardimg").attr("src", "../img/home_deselected.svg");
    $("#smalldashboardimg").attr("src", "../img/home_deselected_small.svg");
    $("#dashboardli").removeClass("selectedmenu");
    $("#todoimg").attr("src", "../img/todo_selected.svg");
    $("#smalltodoimg").attr("src", "../img/todo_selected_small.svg");
    $("#todoli").addClass("selectedmenu");
    $("#meetingnoteimg").attr("src", "../img/notes_deselected.svg");
    $("#smallnotesimg").attr("src", "../img/notes_deselected_small.svg");
    $("#meetingnoteli").removeClass("selectedmenu");

    $("#keyindicatordiv").hide();
    $("#keymetricdiv").hide();
    $("#keyindicatorname").text("");
    $("#metricdiv").hide();
    $("#navtabsection").hide();
    $("#metricdetailsdiv").hide();
    $("#addtododiv").hide();
    $("#todoaddsec").hide();
    $("#meetingtoptitlediv").hide();
    $("#meetinglistdiv").hide();
    $("#meetinglistsec").hide();
    $("#Dashboardtab").hide();
    $("#todotasktoptitlediv").show();
    $("#todotasklistdiv").show();
    $("#todolistsec").show();
    $("#meetingaddsec").hide();
    $("#addmeetingdiv").hide();
}
function updatemeeting(meetingid) {
    document.getElementById('light').style.display = 'block';
    document.getElementById('fade').style.display = 'block'


}

function getcompetionssr(criteriaid) {
    loder();
    $.ajax({
        type: "POST",
        url: "naaceasy.aspx/getcompssr",
        data: '{id:"' + criteriaid + '" }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);
            var customers = xml.find("Table");
            var rows = '';
            //   $('#accordion').remove();
           // $("#my_image").attr("src", "../img/chevron.down.svg");
            $('#accordionEx2 div').remove();
            $.each(customers, function () {
                var serialno = $(this).find("rowno").text();
                var ssrsno = $(this).find("sno").text();
                var universityname = $(this).find("universityname").text();
                var criteriadetails = $(this).find("criteiradetails").text();
                var criterianame = $(this).find("criteria").text();
              
                //var src = $("#imgclass").attr("src", "../img/chevron.down.svg");
             
                rows += "<div class='card' id='card_" + ssrsno + "'><div role='tab' id='heading" + ssrsno + "'><a class='collapsed ssrheading' style='cursor: pointer;' data-toggle='collapse' data-parent='#accordionEx2' onclick='getssrdetails(" + ssrsno + ")'>";
                rows += "<h5 class='mb-0' id='h5_" + ssrsno + "'>" + universityname + "</i></h5><img id='imgclass_" + ssrsno + "' src='../img/chevron.down.svg'/></a></div>";
                rows += "</div>";
             
                //  $("#accordion").addClass("loading");
            });

            $('#accordionEx2').append(rows);
            stoploader();
            //$("#accordion").removeClass("loading");
        },
        error: function (response) {
            var r = jQuery.parseJSON(response.responseText);
            alert("Message: " + r.Message);
        }
    });

}

function getmetricdatalist(metricid,type) {

    loder();
    $.ajax({
        type: "POST",
        url: "naaceasy.aspx/getmetricdatalist",
        data: '{id:"' + metricid + '",dataid:"' + 0 + '",metrictype:"' + type + '" }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            var xmlDoc = $.parseXML(data.d);
            var xml = $(xmlDoc);
            var customers = xml.find("Table");
            if (customers.length > 0 && type=="list")
                {
                var rows = '';
                $('#accordionEx2 div').remove();
                $('#accordionEx1 div').remove();
            $('#accordionEx3 div').remove();
            $.each(customers, function () {
                var programname = "";
                var dataid = "";
                var getmetrictytpe = $("#showdatalistbymetric").val();
                if (getmetrictytpe == '1.1.2' || getmetrictytpe == '1.2.2') {
                     programname = $(this).find("programname").text();
                     dataid = $(this).find("dataid").text();
                }
                else if (getmetrictytpe == '1.3.2' || getmetrictytpe == '1.3.3') {
                     programname = $(this).find("coursename").text();
                     dataid = $(this).find("dataid").text();
                }
                else if (getmetrictytpe == '1.3.4') {
                    programname = $(this).find("programname_134").text();
                    dataid = $(this).find("dataid").text();
                }
                else if (getmetrictytpe == '1.1.3' || getmetrictytpe == '1.2.1') {
                     programname = $(this).find("coursename_113").text();
                     dataid = $(this).find("dataid").text();
                }
                rows += "<div class='card'><div role='tab' id='dataheading" + dataid + "'><a class='collapsed ssrheading' style='cursor: pointer;' data-toggle='collapse' data-parent='#accordionEx3' onclick='getmetridatavalue(" + dataid + ")'>";
                rows += "<h5 class='mb-0' id='datah5_" + dataid + "'>" + programname + "</i></h5><img id='dataimgclass_" + dataid + "' src='../img/chevron.down.svg'/></a></div>";
                rows += "</div>";
            });

            $('#accordionEx3').append(rows);
            $("#Add_data").show();
            $("#savedata").hide();
            $("#datadiscard").hide();
            $("#naac_112_122_div").hide();
            $("#naac_134_div").hide();
            $("#naac_141_div").hide();
            $("#naac_113_121_div").hide();
            $("#nodata_div").hide();
            $("#naac_132_133_div").hide();
            $("#fileupload").hide();
            $("#deletemetricdata").hide();
            $("#datalist").show();
            $("#update_metricdata").hide();
            $("#Qualitative").hide();
            
            }
            else if (customers.length > 0 && type == "qualitative") {
                $.each(customers, function () {
                    $("#txt_linktodocument").val("").attr("disabled", false);
                    $("#qualitativequestion").text($(this).find("qualitativequest").text());
                    $("#txt_qualitative").val("");
                    $("#txt_qualitative").val($(this).find("qualitative").text()).attr("disabled", true);
                    var dataid = $(this).find("dataid").text();
                    getmetricuploadlist(dataid);
                    getmetriclinklist(dataid)
                    $("#fileupload").show();
                    $("#Qualitative").show();
                    $("#edit_metricdata").show();
                    $("#update_metricdata").hide();
                    $("#dataid").val($(this).find("dataid").text());
                });
            }
            else if (customers.length > 0 && type == "mcq") {
                $.each(customers, function () {
                    $("#txt_linktodocument").val("").attr("disabled", false);
                    $("#feedbackmcq").text($(this).find("mcqtion").text());
                  //  $("#txt_qualitative").val($(this).find("qualitative").text()).attr("disabled", true);
                    var dataid = $(this).find("dataid").text();
                    getmcqfile(metricid);
                    getmetricuploadlist(dataid);
                    getmetriclinklist(dataid)
                    $("#fileupload").show();
                    $("#naac_141_div").show();
                    $("#edit_metricdata").hide();
                    $("#update_metricdata").hide();
                    $("#dataid").val($(this).find("dataid").text());
                });
            }
            else {
              
                $("#datalist").hide();
                $("#savedata").hide();
                $("#datadiscard").hide();
                $("#fileupload").hide();
            
                
                var getmetrictitle = $("#metricname").text();
                var getmetric = getmetrictitle.substring(7, 12);
                if (getmetric == '1.1.2' || getmetric == '1.2.2') {
                    $("#nodata_div").show();
                    $("#Add_data").show();
                    $("#naac_112_122_div").hide();
                    $("#naac_132_133_div").hide();
                    $("#Qualitative").hide();
                    $("#naac_141_div").hide();
                    $("#naac_113_121_div").hide();
                    $("#txt_linktodocument").val("").attr("disabled", false);
                    $("#txt_112_122_name").val("").attr("disabled", false);
                    $("#txt_112_122_code").val("").attr("disabled", false);
                    $("#txt_112_122_intro").val("").attr("disabled", false);
                    $("#txt_112_122_status").val("0").attr("disabled", false);
                    $("#txt_112_122_yearimp").val("0").attr("disabled", false);
                    $("#txt_112_122_revision").val("0").attr("disabled", false);
                    $("#txt_112_122_content").val("").attr("disabled", false);
                    $("#dataid").val("0");
                }
                else if (getmetric == '1.3.2' || getmetric == '1.3.3') {
                    $("#nodata_div").show();
                    $("#Add_data").show();
                    $("#naac_112_122_div").hide();
                    $("#naac_132_133_div").hide();
                    $("#Qualitative").hide();
                    $("#naac_113_121_div").hide();
                    $("#naac_141_div").hide();
                    $("#txt_linktodocument").val("").attr("disabled", false);
                    $("#txtcourseoffered").val("").attr("disabled", false);
                    $("#txt_coursecode").val("").attr("disabled", false);
                    $("#txt_courseduration").val("").attr("disabled", false);
                    $("#txt_year").val("").attr("disabled", false);
                    $("#txt_timeoffered").val("").attr("disabled", false);
                    $("#txt_stuenrolled").val("").attr("disabled", false);
                    $("#txt_completing").val("").attr("disabled", false);
                    $("#dataid").val("0");
                }
                else if (getmetric == '1.1.3' || getmetric == '1.2.1') {
                    $("#nodata_div").show();
                    $("#Add_data").show();
                    $("#naac_113_121_div").hide();
                    $("#naac_112_122_div").hide();
                    $("#naac_132_133_div").hide();
                    $("#Qualitative").hide();
                    $("#naac_141_div").hide();
                    $("#txt_linktodocument").val("").attr("disabled", false);
                    $("#txt_113_121_name").val("").attr("disabled", false);
                    $("#txt_113_121_code").val("").attr("disabled", false);
                    $("#txt_113_121_intro").val("0").attr("disabled", false);
                    $("#txt_113_121_content").val("").attr("disabled", false);
                    $("#dataid").val("0");
                }
                else if (getmetric == '1.3.4') {
                    $("#nodata_div").show();
                    $("#Add_data").show();
                    $("#naac_113_121_div").hide();
                    $("#naac_112_122_div").hide();
                    $("#naac_134_div").hide();
                    $("#naac_141_div").hide();
                    $("#naac_132_133_div").hide();
                    $("#Qualitative").hide();
                    $("#txt_linktodocument").val("").attr("disabled", false);
                    $("#txt_134_name").val("").attr("disabled", false);
                    $("#txt_134_code").val("").attr("disabled", false);
                    $("#txt_134_student").val("").attr("disabled", false);
                    $("#dataid").val("0");
                }
                else if (getmetric == '1.4.1') {         
                    $("#naac_113_121_div").hide();
                    $("#naac_112_122_div").hide();
                    $("#naac_134_div").hide();
                    $("#naac_141_div").hide();
                    $("#naac_132_133_div").hide();
                    $("#Qualitative").hide();
                    $("#txt_linktodocument").val("").attr("disabled", false);
                }
               
                else if (getmetric == '1.1.1' || getmetric == "1.3.1") {
                    $("#txt_linktodocument").val("").attr("disabled", false);
                    $("#naac_112_122_div").hide();
                    $("#naac_132_133_div").hide();
                    $("#Qualitative").hide();
                    $("#naac_113_121_div").hide();
                    $("#nodata_div").hide();
                    $("#naac_141_div").hide();
                }
                else {
                    $("#naac_132_133_div").hide();
                    $("#naac_112_122_div").hide();
                    $("#naac_134_div").hide();
                    $("#naac_141_div").hide();
                    $("#naac_113_121_div").hide();
                    $("#nodata_div").hide();
                    $("#Qualitative").hide();
                }

            }
            stoploader();
        },
        error: function (response) {
            var r = jQuery.parseJSON(response.responseText);
            alert("Message: " + r.Message);
        }
    });

}

function getmetridatavalue(dataid,type)
{
    $('#filelistshow div').remove();
    $('#linkshow div').remove();
    
    loder();
    $("#dataid").val(dataid);
    getmetricuploadlist(dataid);
    getmetriclinklist(dataid)
    $.ajax({
        type: "POST",
        url: "naaceasy.aspx/getmetricdatalist",
        data: '{id:"' + 0 + '",dataid:"' + dataid + '",metrictype:"list" }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            var xmlDoc = $.parseXML(data.d);
            var xml = $(xmlDoc);
            var customers = xml.find("Table");
            if (customers.length > 0) {
                var rows = '';
                $('#accordionEx2 div').remove();
                $('#accordionEx1 div').remove();
                $('#accordionEx3 div').remove();
                $.each(customers, function () {
                    var getmetric = $("#metricname").text();
                    var getmetric = getmetric.substring(7, 12);
                    if (getmetric == "1.1.2" || getmetric == "1.2.2") {
                        $("#txt_linktodocument").val("").attr("disabled", false);
                        $("#txt_112_122_name").val($(this).find("programname").text()).attr("disabled", "disabled");
                        $("#txt_112_122_code").val($(this).find("programcode").text()).attr("disabled", "disabled");
                        $("#txt_112_122_intro").val($(this).find("yearof_introduction").text()).attr("disabled", "disabled");
                        $("#txt_112_122_status").val($(this).find("cbcs_ecs_status").text()).attr("disabled", "disabled");
                        $("#txt_112_122_yearimp").val($(this).find("yearof_cbcs_ecs_imp").text()).attr("disabled", "disabled");
                        $("#txt_112_122_revision").val($(this).find("yearof_revision").text()).attr("disabled", "disabled");
                        $("#txt_112_122_content").val($(this).find("contentchangepast_5").text()).attr("disabled", "disabled");
                        $("#naac_112_122_div").show();
                        $("#naac_134_div").hide();
                        $("#naac_132_133_div").hide();
                        $("#naac_113_121_div").hide();
                        $("#nodata_div").hide();
                    }
                    else if (getmetric == '1.1.3' || getmetric == '1.2.1') {
                        $("#naac_113_121_div").show();
                        $("#naac_112_122_div").hide();
                        $("#naac_132_133_div").hide();
                        $("#naac_134_div").hide();
                        $("#naac_141_div").hide();
                        $("#Qualitative").hide();
                        $("#nodata_div").hide();
                        $("#txt_linktodocument").val("").attr("disabled", false);
                        $("#txt_113_121_name").val($(this).find("coursename_113").text()).attr("disabled", "disabled");
                        $("#txt_113_121_code").val($(this).find("coursecode_113").text()).attr("disabled", "disabled");
                        $("#txt_113_121_intro").val($(this).find("courseintro_113").text()).attr("disabled", "disabled");
                        $("#txt_113_121_content").val($(this).find("coursecontent_113").text()).attr("disabled", "disabled");
                       
                    }
                    else if (getmetric == "1.3.2" || getmetric == "1.3.3")
                    {
                        $("#txt_linktodocument").val("").attr("disabled", false);
                        $("#txtcourseoffered").val($(this).find("coursename").text()).attr("disabled", "disabled");
                        $("#txt_coursecode").val($(this).find("course_code").text()).attr("disabled", "disabled");
                        $("#txt_courseduration").val($(this).find("durationof_course").text()).attr("disabled", "disabled");
                        $("#txt_year").val($(this).find("yearof_offering").text()).attr("disabled", "disabled");
                        $("#txt_timeoffered").val($(this).find("times_offered").text()).attr("disabled", "disabled");
                        $("#txt_stuenrolled").val($(this).find("enroll_student").text()).attr("disabled", "disabled");
                        $("#txt_completing").val($(this).find("stu_completing").text()).attr("disabled", "disabled");
                        $("#naac_112_122_div").hide();
                        $("#naac_134_div").hide();
                        $("#naac_141_div").hide();
                        $("#naac_132_133_div").show();
                        $("#naac_113_121_div").hide();
                        $("#nodata_div").hide();
                    }
                    else if (getmetric == "1.3.4") {
                        $("#txt_linktodocument").val("").attr("disabled", false);
                        $("#txt_134_name").val($(this).find("programname_134").text()).attr("disabled", "disabled");
                        $("#txt_134_code").val($(this).find("programcode_134").text()).attr("disabled", "disabled");
                        $("#txt_134_student").val($(this).find("studentname_134").text()).attr("disabled", "disabled");
                      
                        $("#naac_112_122_div").hide();
                        $("#naac_134_div").show();
                        $("#naac_141_div").hide();
                        $("#naac_132_133_div").hide();
                        $("#naac_113_121_div").hide();
                        $("#nodata_div").hide();
                    }
                    else if (getmetric == "1.4.1") {

                        $("#txt_linktodocument").val("").attr("disabled", false);
                        $("#dataid").val($(this).find("dataid").text());
                        $("#feedbackmcq").text($(this).find("mcqtion").text());
                    }
                    else if (getmetric == "1.1.1" || getmetric == "1.3.1")
                    {
                        $("#txt_linktodocument").val("").attr("disabled", false);
                        $("#dataid").val($(this).find("dataid").text());
                        $("#qualitativequestion").text($(this).find("mcqtion").text());
                    }
                
                });
                
                $("#savedata").hide();
                $("#datadiscard").hide();
                $("#Add_data").hide();
                $("#edit_metricdata").show();
                $("#update_metricdata").hide();
                $("#deletemetricdata").show();
             
                $("#datalist").hide();
                $("#fileupload").show();
                stoploader();
            }
            else {
                //$("#datalist").hide();
                //$("#savedata").show();
                //$("#datadiscard").show();
                //$("#naac_112_122_div").show();
            }
        },
        error: function (response) {
            var r = jQuery.parseJSON(response.responseText);
            alert("Message: " + r.Message);
        }
    });
}
function getssrdetails(ssrsno) {

    $("#card_" + ssrsno).addClass("ssrcardborder");
    $("#imgclass_" + ssrsno).addClass("logo-img");
    $("#h5_" + ssrsno).addClass("md-0_color");
    $("#getlastcarddiv").val(ssrsno);
    var lastdiv = localStorage.getItem("localstoragediv");
    if (lastdiv == null) {

    }
    else {
        $("#imgclass_" + ssrsno).removeClass("logo-img");
        $("#h5_" + lastdiv).removeClass("md-0_color");
        $("#card_" + lastdiv).removeClass("ssrcardborder");
        localStorage.clear();
    }
    localStorage.setItem("localstoragediv", $('#getlastcarddiv').val());
  
   // alert(getlastcarddiv);
    loder();
    $.ajax({
        type: "POST",
        url: "naaceasy.aspx/getssrdetails",
        data: '{id:"' + ssrsno + '" }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);
            var customers = xml.find("Table");
            var rows = '';
            rows_file = '';
            //   $('#accordion').remove();
            $('#ssrcontentarea div').remove();
            $('#ssrfileuploaded div').remove();
            $.each(customers, function () {

                var serialno = $(this).find("rowno").text();
                var ssrsno = $(this).find("sno").text();
                var universityname = $(this).find("universityname").text();
                var criteriadetails = $(this).find("criteiradetails").text();
                var criterianame = $(this).find("criteria").text();
                var unifileuploaded = $(this).find("ssrfiles").text();
                
                rows += "<div>" + criteriadetails + "</div>";
                rows_file += "<div>" + unifileuploaded + "</div>";
                $("#ssrarea").show();
            });

            $('#ssrcontentarea').append(rows);
            $('#ssrfileuploaded').append(rows_file);
            stoploader();
       
        },
        error: function (response) {
            var r = jQuery.parseJSON(response.responseText);
            alert("Message: " + r.Message);
        }
    });

}
function getfaq(criteriaid) {

    loder();
    $.ajax({
        type: "POST",
        url: "index.aspx/getfaq",
        data: '{id:"' + criteriaid + '" }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);
            var customers = xml.find("Table");
            var rows = '';
            $('#accordionEx1 div').remove();
            $.each(customers, function () {

                var serialno = $(this).find("rowno").text();
                var faqsno = $(this).find("faqsno").text();
                var faqquestion = $(this).find("faqquestion").text();
                var faqanswer = $(this).find("faqanswer").text();
                var criterianame = $(this).find("criteria").text();
                
                rows += "<div class='card' id=" + 'faqcard_' + faqsno + " style='margin-right: 4px;'><div role='tab' id='heading" + faqsno + "'><a class='collapsed faqclass' data-toggle='collapse' onclick='getshadow(" + faqsno + ")' data-parent='#accordionEx1' href='#collapse" + faqsno + "' aria-expanded='false' aria-controls='collapse" + faqsno + "'>";
                rows += "<h5 class='mb-0'>" + faqquestion + "</h5><img src='../img/chevron.down.svg' style='transform: rotate(90deg);' id='imgrotate_" + faqsno + "'></a></div>";
                rows += "<div id='collapse" + faqsno + "' class='collapse' role='tabpanel' aria-labelledby='heading" + faqsno + "'data-parent='#accordionEx1'>";
                rows +="<div class='card-body card_text'>";
                rows += "" + faqanswer + "";
                rows += "</div></div></div>";
            });

            $('#accordionEx1').append(rows);
            stoploader();
        },
        error: function (response) {
            var r = jQuery.parseJSON(response.responseText);
            alert("Message: " + r.Message);
        }
    });

}
function getshadow(faqsno)
{
    
    $("#imgrotate_" + faqsno).addClass("rotate");
    $("#faqcard_" + faqsno).addClass("boxshadowdiv");
    var lastdiv = localStorage.getItem("localfaqid");
    if (lastdiv == null) {

    }
    else {
        $("#imgrotate_" + lastdiv).removeClass("rotate");
        $("#faqcard_" + lastdiv).removeClass("boxshadowdiv");
        localStorage.clear();
    }
    localStorage.setItem("localfaqid", faqsno);
}
$(document).ready(function () {
    $.ajax({
        url: "../naaceasymenu.ashx",
        method: "get",
        dataType: "json",
        success: function (data) {
            var lastdiv = localStorage.getItem("lastopendiv");
            if (lastdiv == null) {
                // $('#welcomdiv').show();
            }
            else {
                //  $('#welcomdiv').hide();
                $('#' + lastdiv + '_div').show();
            }
            localStorage.clear();
            buildmenu_demo($('#menudemo'), data);
        }

    });

    function buildmenu(parent, items) {
        $.each(items, function () {
            var li = $('<li style="cursor:pointer"><a id=' + this.id + ' onclick="return someFunction(this.id,this.text)" style="cursor:pointer">' + this.text + '</a></li>');
            li.appendTo(parent);
            if (this.list && this.list.length > 0) {
                var ul = $('<ul></ul>');
                ul.appendTo(li);
                buildmenu(ul, this.list);
            }
        })
    }
    function buildmenu_demo(parent, items) {
        $.each(items, function () {
            var i = this.menuparentid;
            var l = this.id;
            if (i != 0) {
                if (l == 17)
                {
                    var li = $("<li class='nav-item sidebarlimenu toppadding'><a class='text-truncate criteriamenu leftrightpd' href=" + '#DIVM' + this.id + " id=" + this.id + " onclick='return someFunction(this.id,this.text," + i + ")' data-toggle='collapse'>" + this.text + " <img src='../Img/chevron.right.svg'/> </a>");

                }
                else {
                    var li = $("<li class='nav-item sidebarlimenu'><a class='text-truncate criteriamenu leftrightpd' href=" + '#DIVM' + this.id + " id=" + this.id + " onclick='return someFunction(this.id,this.text," + i + ")' data-toggle='collapse'>" + this.text + " <img src='../Img/chevron.right.svg'/> </a>");

                }
                li.appendTo(parent);
            }
            else {
                var li = $("<li class='nav-item'><a class='nav-link collapsed text-truncate criteriamenu' href=" + '#DIVM' + this.id + " id=" + this.id + " onclick='return someFunction(this.id,this.text," + i + ")' data-toggle='collapse'>" + this.text + " <img src='../Img/chevron.down.svg'/></a>");
                li.appendTo(parent);
            }
            if (this.list && this.list.length > 0) {
                var ul = $("<ul class='flex-column pl-2 nav collapse paddingdiv' id=" + "DIVM" + this.id + " aria-expanded='false'></ul>");
                ul.appendTo(li);
                buildmenu_demo(ul, this.list);
            }
        })
    }
});

function someFunction(id, text, menuparentid) {
    removefile();
    removelink();
    var selectedparent="";
    if (menuparentid == 0)
      {
        selectedparent = localStorage.getItem("setparentidinlocalstorage");
       
    $("#" + id).addClass("criteriaselected");
    if (selectedparent == null) {
       
    }
    else {
        $("#" + selectedparent).removeClass("criteriaselected");
        localStorage.clear();
    }
    }
    if (menuparentid == 0)
        {
    localStorage.setItem("setparentidinlocalstorage", id);
    }

    $("#dashboardimg").attr("src", "../img/home_deselected.svg");
    $("#smalldashboardimg").attr("src", "../img/home_deselected_small.svg");
    $("#dashboardli").removeClass("selectedmenu");
    $("#meetingnoteimg").attr("src", "../img/notes_deselected.svg");
    $("#smallnotesimg").attr("src", "../img/notes_deselected_small.svg");
    $("#meetingnoteli").removeClass("selectedmenu");
    $("#todoimg").attr("src", "../img/todo_deselected.svg");
    $("#smalltodoimg").attr("src", "../img/todo_deselected_small.svg");
    $("#todoli").removeClass("selectedmenu");
    $("#metriclistdiv div").remove();
    $("#addtododiv").hide();
    $("#todoaddsec").hide();
    $("#Dashboardtab").hide();
    $("#meetingtoptitlediv").hide();
    $("#meetinglistdiv").hide();
    $("#meetinglistsec").hide();
    $("#todotasktoptitlediv").hide();
    $("#todotasklistdiv").hide();
    $("#todolistsec").hide();
    $("#meetingaddsec").hide();
    $("#addmeetingdiv").hide();
    $("#hometab").removeClass("naactabul_li");
    $("#soptab").removeClass("naactabul_li");
    $("#Guidelinestab").removeClass("naactabul_li");
    $("#competitiontab").removeClass("naactabul_li");
    $("#faqtab").removeClass("naactabul_li");
    $("#datatab").removeClass("naactabul_li");
    $("#metricdiv").hide();
    $("#navtabsection").hide();
    $("#metricdetailsdiv").hide();
  
    if (menuparentid != "0") {
       
        $("#keyindicatordiv").show();
        $("#keymetricdiv").show();
        $("#keyindicatorname").text(text);
        loder();
            $.ajax({
                type: "POST",
                url: "naaceasy.aspx/getmetriclist",
                data: '{id:"' + id + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                 
                    var xmlDoc = $.parseXML(response.d);
                    var xml = $(xmlDoc);
                    var customers = xml.find("Table");
                    var rows = '';
                  
                    $.each(customers, function () {
                        //$('#todotasklistshow').remove();
                        var metricdetails = $(this).find("metricdetails").text();
                        var manualtype = $(this).find("manualtype").text();
                        var marks = $(this).find("marks").text();
                        var metric = $(this).find("metric").text();
                        var metric = metric.substring(1, 7);
                     
                        var type="";
                        if (metric == "1.1.2" || metric == "1.2.2" || metric == "1.3.2" || metric == "1.3.3") {
                            type = "list";
                         
                        }
                        else if (metric == '1.4.1') {
                            type = "mcq";
                        }
                        else if (metric == '1.1.1' || metric == "1.3.1") {
                            type = "qualitative";
                        }
                        var Benchmark = $(this).find("benchmark").text();
                        var metricsno = $(this).find("metricsno").text();
                        rows += "<div class='col-lg-12' style='padding-bottom: 15px;'><div class='box-footer clearfix'>";
                        rows += "<div class='col-lg-1 divcol1'><span class='divcol1span' style='cursor: pointer;' onclick='getmetricdetails(" + metricsno + ")'>" + metric + "</span></div>";
                        rows += "<div class='col-lg-1'>";
                        rows += "<p class='divcol1p'>" + manualtype + "</p></div>";
                        rows += "<div class='col-lg-4'  style='padding-top:5px'>";
                        rows += "<p class='divcol6p'>" + metricdetails + "</p></div>";
                        rows += "<div class='col-lg-2'><p class='divcol2p'>Marks Worth</p>";
                        rows += "<p class='divcol2pval'> " + marks + "</p></div>";
                        rows += "<div class='col-lg-2'><p class='divcol2p'>Benchmark</p>";
                        rows += "<p class='divcol2pval'>" + Benchmark + "</p></div>";
                        rows += "<div class='col-lg-2'><span class='pull-right'> <button type='button' class='btn divbtn' onclick='getmetricdetails(" + metricsno + ")'> Details</button></span></div></div></div>";
                    });
                 //   stoploader();
                    $('#metriclistdiv').append(rows);
                   stoploader();
                },
                error: function (response) {
                    var r = jQuery.parseJSON(response.responseText);
                    alert("Message: " + r.Message);
                }
            });
    }
}
function getmetricdetails(metricsno)
{
    removefile();
    removelink();

    $('#filelistshow div').remove();
    $('#linkshow div').remove();
    
    $("#metricid").text(metricsno);
    loder();
    $("#faqhidenid").val(metricsno);
    $("#ssrhidenid").val(metricsno);
    $("#savedata").hide();
    $("#datadiscard").hide();
    $("#Add_data").hide();
    $("#naac_112_122_div").hide();
    $("#naac_134_div").hide();
    $("#naac_141_div").hide();
    $("#Qualitative").hide();
    $("#naac_113_121_div").hide();
    $("#nodata_div").hide();
    $("#naac_132_133_div").hide();
    $("#fileupload").hide();
    $("#datalist").hide();
    
    $("#keyindicatordiv").hide();
    $("#keymetricdiv").hide();
    $("#metricdiv").show();
    $("#navtabsection").show();
    $("#metricdetailsdiv").show();
    $("#soptab").removeClass("naactabul_li");
    $("#Guidelinestab").removeClass("naactabul_li");
    $("#competitiontab").removeClass("naactabul_li");
    $("#faqtab").removeClass("naactabul_li");
    $("#datatab").addClass("naactabul_li");
    $("#hometab").removeClass("naactabul_li");
    $("#naacmanualmaindiv").hide();
    $("#naacmaindatadiv").show();
    $("#naacsopmaindiv").hide();
    $("#naacfaqdiv").hide();
    // $("#naacdatadiv").hide();
    $("#naacssrdiv").hide();
    
    $("#naacmanual div").remove();
    $("#naacfiledesc div").remove();
    $("#naacadditional div").remove();
    $("#naacdatareq div").remove();
    $("#sopdetails div").remove();
    $("#Add_data").hide();
    $("#edit_metricdata").hide();
    $("#update_metricdata").hide();
    $("#deletemetricdata").hide();
    $("#fileupload").show();
    var metricid = "";
    $("#datalist").hide();
    $("#savedata").hide();
    $("#datadiscard").hide();
    $("#Add_data").hide();
 
        $.ajax({
            type: "POST",
            url: "naaceasy.aspx/getmetricdetails",
            data: '{id:"' + metricsno + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var xmlDoc = $.parseXML(response.d);
                var xml = $(xmlDoc);
                var customers = xml.find("Table");
                var rows = '';
                var filedesc = '';
                var additional = '';
                var datare = '';
                var sopdetailsrow = '';

                $.each(customers, function () {
                    var metric = $(this).find("metric").text();
                    var wiki = $(this).find("wiki").text();
                    var filedescription = $(this).find("filedescription").text();
                    var datarequirement = $(this).find("datarequirement").text();
                    var additiondetails = $(this).find("additiondetails").text();
                    var sopdetails = $(this).find("sopdetails").text();
                    var manualtype = $(this).find("manualtype").text();
                    var marks = $(this).find("marks").text();
                    var benchmark = $(this).find("benchmark").text();
                    $("#metricname").text(metric);
                    $("#naactype").text(manualtype);
                    $("#markworth").text(marks);
                    $("#benchmark").text(benchmark);
                    filedesc += "<div>" + filedescription + "</div>";
                    additional +="<div>"+ additiondetails + "</div>";;
                    datare +="<div>"+ datarequirement + "</div>";
                    rows += "<div>" + wiki + "</div>";
                    sopdetailsrow += "<div>" + sopdetails + "</div>";
                  
                });
                $('#naacmanual').append(rows);
                $('#naacfiledesc').append(filedesc);
                $('#naacadditional').append(additional);
                $('#naacdatareq').append(datare);
                $('#sopdetails').append(sopdetailsrow);
                getkeymetriclist(metricsno);

                var getmetrictitle = $("#metricname").text();
                var getmetric = getmetrictitle.substring(7, 12);
                $("#showdatalistbymetric").val(getmetric);
                if (getmetric == '1.1.2' || getmetric == '1.2.2' || getmetric == '1.3.2' || getmetric == '1.3.3' || getmetric == '1.1.3' 
                    || getmetric == '1.2.1' || getmetric == '1.3.4') {
                    metricid = $("#metricid").text();
                    getmetricdatalist(metricid,'list');
                    $("#metricadddiv").text(getmetric);
                    $("#metrictype").val("list");

                }
                else if (getmetric == '1.4.1') {
                    metricid = $("#metricid").text();
                    getmetricdatalist(metricid, 'mcq');
                    $("#metrictype").val("mcq");
                    $("#metricadddiv").text(getmetric);
                }
                else if (getmetric == '1.1.1' || getmetric == "1.3.1")
                {
                    metricid = $("#metricid").text();
                    getmetricdatalist(metricid, 'qualitative');
                    $("#metrictype").val("qualitative");
                    $("#metricadddiv").text(getmetric);
                }
                else {
                    $("#Qualitative").hide();
                    $("#naac_112_122_div").hide();
                    $("#naac_134_div").hide();
                    $("#naac_141_div").hide();
                    $("#naac_113_121_div").hide();
                    $("#nodata_div").hide();
                    $("#naac_132_133_div").hide();
                }
                stoploader();
            },
            error: function (response) {
                var r = jQuery.parseJSON(response.responseText);
                alert("Message: " + r.Message);
            }
        });
}
function getkeymetriclist(keyid)
{
    loder()
    $.ajax({
        type: "POST",
        url: "naaceasy.aspx/getkeymetriclist",
        data: '{id:"' + keyid + '" }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);
            var customers = xml.find("Table");
            var rows = '';
            $('#metriclistspanid span').remove();
            $.each(customers, function () {
                var metric = $(this).find("metric").text();
                var wikiid = $(this).find("wikiid").text();
                var metricsno = $(this).find("metricsno").text();
                
                rows += "<span class='meetingptag pull-left' style='margin-left:8px; margin-top:4px;cursor: pointer;' onclick='getmetricdetails(" + metricsno + ")'>" + metric + "</span>";
              
            });
            $('#metriclistspanid').append(rows);
            stoploader();
        },
        error: function (response) {
            var r = jQuery.parseJSON(response.responseText);
            alert("Message: " + r.Message);
        }
    });
}
$(document).ready(function () {
    $("#txt_linktodocument").change(function () {
       
        var getdataid = $("#dataid").val();
        var metricidget = $("#metricid").text();
        var linktext = $("#txt_linktodocument").val();
        if (linktext != "") {
            loder();
        $.ajax({
            url: "naaceasy.aspx/insertlink",
            data: '{dataid:"' + getdataid + '",metricid:"' + metricidget + '",linkval:"' + linktext + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            type: 'POST',
            success: function (data) {
                getmetriclinklist(getdataid);
                stoploader();
                var linktext = $("#txt_linktodocument").val("");
            }
        });
        }
    });


    $('#savedata').on("click", function () {
        loder();
        var vmdatastructureobj = {};
        vmdatastructureobj.metricid = $("#metricid").text();
       // uploaddatafile(vmdatastructureobj.metricid);
        vmdatastructureobj.programname_112 = $('#txt_112_122_name').val();
        vmdatastructureobj.programcode_112 = $('#txt_112_122_code').val();
        vmdatastructureobj.yearof_introduction_112 = $('#txt_112_122_intro').val();
        vmdatastructureobj.cbcs_ecs_status_112 = $('#txt_112_122_status').val();
        vmdatastructureobj.yearof_cbcs_ecs_imp_112 = $('#txt_112_122_yearimp').val();
        vmdatastructureobj.yearof_revision_112 = $('#txt_112_122_revision').val();
        vmdatastructureobj.contentchangepast_5_112 = $('#txt_112_122_content').val();

        vmdatastructureobj.coursename_132 = $('#txtcourseoffered').val();
        vmdatastructureobj.course_code_132 = $('#txt_coursecode').val();
        vmdatastructureobj.durationof_course_132 = $('#txt_courseduration').val();
        vmdatastructureobj.yearof_offering_132 = $('#txt_year').val();
        vmdatastructureobj.times_offered_132 = $('#txt_timeoffered').val();
        vmdatastructureobj.enroll_student_132 = $('#txt_stuenrolled').val();
        vmdatastructureobj.stu_completing_132 = $('#txt_completing').val();

        vmdatastructureobj.nameofcourse_113 = $('#txt_113_121_name').val();
        vmdatastructureobj.coursecode_113 = $('#txt_113_121_code').val();
        vmdatastructureobj.yearof_intro_113 = $('#txt_113_121_intro').val();
        vmdatastructureobj.contentactivity_113 = $('#txt_113_121_content').val();

        vmdatastructureobj.programcode_134 = $('#txt_134_code').val();
        vmdatastructureobj.programname_134 = $('#txt_134_name').val(); 
        vmdatastructureobj.studentname_134 = $('#txt_134_student').val();


        vmdatastructureobj.type = "insert";
        vmdatastructureobj.metrictype = "list";
        var jsonData = JSON.stringify({
            vmdatastructureobj: vmdatastructureobj,
           // files: files
        });
        $.ajax({
            type: 'POST',
            url: "naaceasy.aspx/insert_data",
            data: jsonData,
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (r) {
                alert(r.d);
                $("#txt_linktodocument").val("").attr("disabled", false);
                $("#txt_112_122_name").val("").attr("disabled", false);
                $("#txt_112_122_code").val("").attr("disabled", false);
                $("#txt_112_122_intro").val("").attr("disabled", false);
                $("#txt_112_122_status").val("0").attr("disabled", false);
                $("#txt_112_122_yearimp").val("0").attr("disabled", false);
                $("#txt_112_122_revision").val("0").attr("disabled", false);
                $("#txt_112_122_content").val("").attr("disabled", false);

                $("#txtcourseoffered").val("").attr("disabled", false);
                $("#txt_coursecode").val("").attr("disabled", false);
                $("#txt_courseduration").val("").attr("disabled", false);
                $("#txt_year").val("").attr("disabled", false);
                $("#txt_timeoffered").val("").attr("disabled", false);
                $("#txt_stuenrolled").val("").attr("disabled", false);
                $("#txt_completing").val("").attr("disabled", false);

                $("#txt_113_121_name").val("").attr("disabled", false);
                $("#txt_113_121_code").val("").attr("disabled", false);
                $("#txt_113_121_intro").val("0").attr("disabled", false);
                $("#txt_113_121_content").val("").attr("disabled", false);

                $("#txt_134_name").val("").attr("disabled", false);
                $("#txt_134_code").val("").attr("disabled", false);
                $("#txt_134_student").val("").attr("disabled", false);

                $("#savedata").hide();
                $("#datadiscard").hide();
                $("#Add_data").show();
                $("#edit_metricdata").hide();
                $("#update_metricdata").hide();
                $("#deletemetricdata").hide();
                $("#naac_112_122_div").hide();
                $("#naac_134_div").hide();
                $("#naac_141_div").hide();
                $("#naac_113_121_div").hide();
                $("#nodata_div").hide();
                $("#naac_132_133_div").hide();
                $("#datalist").show();
                $("#fileupload").hide();
                var getmetrictitle = $("#metricname").text();
                var getmetric = getmetrictitle.substring(7, 12);
                if (getmetric == '1.1.2' || getmetric == '1.2.2' || getmetric == '1.3.2' || getmetric == '1.3.3' || getmetric == '1.1.3' || getmetric == '1.2.1' || getmetric == '1.3.4') {
                    metricid = $("#metricid").text();
                    getmetricdatalist(metricid,'list');
                }
                else if (getmetric == '1.4.1') {
                    metricid = $("#metricid").text();
                    getmetricdatalist(metricid, 'mcq');
                    $("#metricadddiv").text(getmetric);
                }
                else if (getmetric == '1.1.1' || getmetric == "1.3.1") {
                    metricid = $("#metricid").text();
                    getmetricdatalist(metricid, 'qualitative');
                    $("#metricadddiv").text(getmetric);
                }
                stoploader();
            },
            error: function (r) {
                alert(r.responseText);
            }
        })
        return false;
    });
});

function uploadmcqfile() {
    loder();
    var formData = new FormData();
    var getdataid = $("#dataid").val();
    var metricidget = $("#metricid").text();
    var myfile = $('#mcq_file').val();
    if (getcheckboxid == "1")
    {

        formData.append('filetitle', "Student");
        $("#studentchk").attr("disabled", true);
    }
    else if (getcheckboxid == "2") {
        formData.append('filetitle', "Teacher");
        $("#teacherchk").attr("disabled", true);
    }
    else if (getcheckboxid == "3") {
        formData.append('filetitle', "Employee");
        $("#employerchk").attr("disabled", true);
    }
    else if (getcheckboxid == "4") {
        formData.append('filetitle', "Alumni");
        $("#alumnichk").attr("disabled", true);
    }
    formData.append('mcq_file', $('#mcq_file')[0].files[0]);
    var id = metricidget;
    formData.append('metricid', id);
    formData.append('dataid', getdataid);
    $.ajax({
        url: "../mcqfilehandler.ashx",
        data: formData,
        processData: false,
        contentType: false,
        type: 'POST',
        success: function (data) {
            getmcqfile(metricidget);
            $("#mcq_file").val("");
            stoploader();
        }
    });

}
function uploaddatafile()
{
    loder();
    var getdataid = $("#dataid").val();
    var metricidget = $("#metricid").text();
    $('.progress-bar-aqua').css('width', '0');
  //  $('.msg').text('');
    var myfile = $('#fuUpload').val();
    if (myfile == '') {
        stoploader();
        alert('Please enter file name and select file');
        return;
       
    }
    var formData = new FormData();
    formData.append('fuUpload', $('#fuUpload')[0].files[0]);
   // $('.msg').text('Uploading in progress...');
    var id = metricidget;
    formData.append('metricid', id);
    formData.append('dataid', getdataid);
    $.ajax({
        url: "../fileupload.ashx",
        data: formData,
        processData: false,
        contentType: false,
        type: 'POST',
        
        // this part is progress bar
        xhr: function () {
            $("#progressreport").show();
            var xhr = new window.XMLHttpRequest();
            xhr.upload.addEventListener("progress", function (evt) {
                if (evt.lengthComputable) {
                    var percentComplete = evt.loaded / evt.total;
                    percentComplete = parseInt(percentComplete * 100);
                    $('.progress-bar-aqua').text(percentComplete + '%');
                    $('.progress-bar-aqua').css('width', percentComplete + '%');
                  
                }
            }, false);
            return xhr;
        },
        success: function (data) {
            $('.progress-bar-aqua').css('width', '0');
            getmetricuploadlist(getdataid);
            stoploader();
            $("#fuUpload").val("");

        }
    });
}

function getmetricuploadlist(dataid)
{
    loder();
    $.ajax({
        type: "POST",
        url: "naaceasy.aspx/filelist",
        data: '{id:"' + dataid + '" }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);
            var customers = xml.find("Table");
            var rows = '';
            $('#filelistshow div').remove();
            $.each(customers, function () {
           
                var datafilename = $(this).find("datafilename").text();
                var dataid = $(this).find("dataid").text();
                var fileid = $(this).find("fileid").text();
                var filename = $(this).find("filetitle").text();
                var rowsno = $(this).find("rowno").text();
                
                rows += "<div style='padding-bottom: 5px;'>" + rowsno + ". <a class='btn btn-primary' style='color: white;border-radius: 16PX;' href='../Datametricfiles/" + datafilename + "' target='_blank'><i class='fa fa-view'></i>" + filename + "</a><img src='../Img/trash.svg' style='float: right;cursor: pointer;' onclick='deletefile(" + fileid + ")'></div>";
            });
            $('#filelistshow').append(rows);
            stoploader();
        },
        error: function (response) {
            var r = jQuery.parseJSON(response.responseText);
            alert("Message: " + r.Message);
        }
    });
}

function getmetriclinklist(dataid) {
    loder();
    $.ajax({
        type: "POST",
        url: "naaceasy.aspx/filelinklist",
        data: '{id:"' + dataid + '" }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);
            var customers = xml.find("Table");
            var rows = '';
            $('#linkshow div').remove();
            $.each(customers, function () {

                var datafilename = $(this).find("filelink").text();
                var dataid = $(this).find("dataid").text();
                var fileid = $(this).find("fileid").text();
                var rowsno = $(this).find("rowno").text();
                rows += "<div style='padding-bottom: 5px;'>" + rowsno + ". <a class='btn btn-primary' style='color: white;border-radius: 16PX;' href='" + datafilename + "' target='_blank'><i class='fa fa-view'></i> View Link </a><img src='../Img/trash.svg' style='float: right;cursor: pointer;' onclick='deletelink(" + fileid + ")'></div>";
            });
            $('#linkshow').append(rows);
            stoploader();
        },
        error: function (response) {
            var r = jQuery.parseJSON(response.responseText);
            alert("Message: " + r.Message);
        }
    });
}

function deletefile(listid) {
    var metricidget = $("#dataid").val();
    var alert = confirm("Are you sure want to delete this...?");
    if (alert) {
        var id = listid;
        $.ajax({
            type: "POST",
            url: "naaceasy.aspx/deletefile",
            data: '{id:"' + id + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var result = response.d;
                if (result == "success") {
                    getmetricuploadlist(metricidget);
                }
            },
            error: function (response) {
                var r = jQuery.parseJSON(response.responseText);
                alert("Message: " + r.Message);
            }
        });
    }
    else {

        return false;

    }
}

function deletelink(listid) {

    var metricidget = $("#dataid").val();
    var alert = confirm("Are you sure want to delete this...?");
    if (alert) {
        var id = listid;
        $.ajax({
            type: "POST",
            url: "naaceasy.aspx/deletelink",
            data: '{id:"' + id + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var result = response.d;
                if (result == "success") {
                    getmetriclinklist(metricidget);
                }
            },
            error: function (response) {
                var r = jQuery.parseJSON(response.responseText);
                alert("Message: " + r.Message);
            }
        });
    }
    else {

        return false;

    }
}
function removefile() {
        $.ajax({
            type: "POST",
            url: "naaceasy.aspx/removefile",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
               
            },
            error: function (response) {
                var r = jQuery.parseJSON(response.responseText);
                alert("Message: " + r.Message);
            }
        });
   
}
function getmcqfile(metricid)
{
   
    $.ajax({
        type: "POST",
        url: "naaceasy.aspx/getmcqlist",
        data: '{id:"' + metricid + '",title:"non" }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);
            var customers = xml.find("Table");
            var sturow = '';
            var techrow = '';
            var emprow = '';
            var alurow = '';
            $('#stulink a').remove();
            $('#stulink img').remove();
            $('#teachlink a').remove();
            $('#teachlink img').remove();
            $('#emplink a').remove();
            $('#emplink img').remove();
            $('#alumlink a').remove();
            $('#alumlink img').remove();
            $.each(customers, function () {
                if (customers.length > 0) {
                    loder();
                    if (customers.length == 1) {
                        $("#select_4").prop("checked", true);
                    }
                    else if(customers.length == 2)
                    {
                        $("#select_3").prop("checked", true);
                    }
                    else if(customers.length == 3){
                        $("#select_2").prop("checked", true);
                    }
                    else if(customers.length == 4)
                        {
                        $("#select_1").prop("checked", true);
                    }
                    var filename = $(this).find("filename").text();
                    var filetitle = $(this).find("filetitle").text();
                    var mcqid = $(this).find("mcqid").text();
                    var titleno = $(this).find("titleno").text();
                    
                    if (filetitle == "Student") {
                        $("#studentchk").prop("checked", true);
                        $("#studentchk").attr("disabled", true);
                        $('#stulink a').remove();
                        $('#stulink img').remove();
                        sturow += "<a style='color: #2a85ff;font-size: 17px;text-decoration: underline;cursor: pointer;border-radius: 16PX;' href='../mcqfileupload/" + filename + "' target='_blank'><i class='fa fa-view'></i> View File </a><img src='../Img/trash.svg' style='float: right;cursor: pointer;width: 18px;' onclick='deletemcq(" + mcqid + "," + titleno + ")'>";
                        $('#stulink').append(sturow);

                    }
                    else if (filetitle == "Teacher") {
                        $("#teacherchk").prop("checked", true);
                        $("#teacherchk").attr("disabled", true);
                        $('#teachlink a').remove();
                        $('#teachlink img').remove();
                        techrow += "<a style='color: #2a85ff;font-size: 17px;text-decoration: underline;cursor: pointer;border-radius: 16PX;' href='../mcqfileupload/" + filename + "' target='_blank'><i class='fa fa-view'></i> View File </a><img src='../Img/trash.svg' style='float: right;cursor: pointer;width: 18px;' onclick='deletemcq(" + mcqid + "," + titleno + ")'>";
                        $('#teachlink').append(techrow);
                     }
                     
                    else if (filetitle == "Employee") {
                        $("#employerchk").prop("checked", true);
                        $("#employerchk").attr("disabled", true);
                        $('#emplink a').remove();
                        $('#emplink img').remove();
                        emprow += "<a style='color: #2a85ff;font-size: 17px;text-decoration: underline;cursor: pointer;border-radius: 16PX;' href='../mcqfileupload/" + filename + "' target='_blank'><i class='fa fa-view'></i> View File </a><img src='../Img/trash.svg' style='float: right;cursor: pointer;width: 18px;' onclick='deletemcq(" + mcqid + "," + titleno + ")'>";
                        $('#emplink').append(emprow);
                    }
                   
                    else if (filetitle == "Alumni") {
                        $("#alumnichk").prop("checked", true);
                        $("#alumnichk").attr("disabled", true);
                        $('#alumlink a').remove();
                        $('#alumlink img').remove();
                        alurow += "<a style='color: #2a85ff;font-size: 17px;text-decoration: underline;cursor: pointer;border-radius: 16PX;' href='../mcqfileupload/" + filename + "' target='_blank'><i class='fa fa-view'></i> View File </a><img src='../Img/trash.svg' style='float: right;cursor: pointer;width: 18px;' onclick='deletemcq(" + mcqid + "," + titleno + ")'>";
                        $('#alumlink').append(alurow);
                    }
                    stoploader();
                }
                else {
                  
                }
            });
          
           
        },
        error: function (response) {
            var r = jQuery.parseJSON(response.responseText);
            alert("Message: " + r.Message);
        }
    });
}
function removelink() {
    $.ajax({
        type: "POST",
        url: "naaceasy.aspx/removelink",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {

        },
        error: function (response) {
            var r = jQuery.parseJSON(response.responseText);
            alert("Message: " + r.Message);
        }
    });

}

function deletemcq(id,title)
{
   
    var metricidget = $("#metricid").text();
    var alert = confirm("Are you sure want to delete this...?");
    if (alert) {
        loder();
        $.ajax({
            type: "POST",
            url: "naaceasy.aspx/getmcqlist",
            data: '{id:"' + id + '",title:"0" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                if (title == "1") {
                    $("#studentchk").prop("checked", false);
                    $("#studentchk").attr("disabled", false);
                  
                }
                else if (title == "2") {
                    $("#teacherchk").prop("checked", false);
                    $("#teacherchk").attr("disabled", false);
                  
                }
                else if (title == "3") {
                    $("#employerchk").prop("checked", false);
                    $("#employerchk").attr("disabled", false);
                  
                }
                else if (title == "4") {
                    $("#alumnichk").prop("checked", false);
                    $("#alumnichk").attr("disabled", false);
                    
                }
                if (countCheckedCheckboxes == 4) {
                        $("#select_1").prop("checked", true);
                }
                else if (countCheckedCheckboxes == 3) {
                        $("#select_2").prop("checked", true);
                }
                else if (countCheckedCheckboxes == 2) {
                        $("#select_3").prop("checked", true);
                }
                else if (countCheckedCheckboxes == 1) {
                        $("#select_4").prop("checked", true);
                }
                else {
                    $("#select_1").prop("checked", false);
                    $("#select_2").prop("checked", false);
                    $("#select_3").prop("checked", false);
                    $("#select_4").prop("checked", false);
                }
                    getmcqfile(metricidget);
              
            },
            error: function (response) {
                var r = jQuery.parseJSON(response.responseText);
                alert("Message: " + r.Message);
            }
        });
        stoploader();
    }
   
    else {

        return false;

    }
}
