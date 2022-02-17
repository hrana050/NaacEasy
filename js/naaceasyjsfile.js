$(document).ready(function () {
    var getlastcarddiv = "";
 //  ();loder
    //   filelist();
    //$("#meetingnoteimg").attr("src", "../img/notes_selected.svg");
    //$("#smallnotesimg").attr("src", "../img/notes_selected_small.svg");
    //$("#meetingnoteli").addClass("selectedmenu");
    //$("#meetingtoptitlediv").show();
    //$("#meetinglistdiv").show();
    //$("#meetinglistsec").show();
    //$("#lidashboard").addClass("addbackground");
});

function editbutton() {

    var getmetric = $("#metricname").text();
    var getmetric = getmetric.substring(7, 12);
    if (getmetric == "1.1.2" || getmetric == "1.2.2") {

        $("#naac_132_133_div").show();
        $("#naac_113_121_div").hide();
        $("#naac_132_133_div").hide();
        $("#naac_134_div").hide();
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
        $("#naac_132_133_div").show();
        $("#naac_134_div").hide();

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
        $("#naac_132_133_div").hide();
        $("#naac_134_div").hide();

        $("#txtcourseoffered").val("").attr("disabled", false);
        $("#txt_coursecode").val("").attr("disabled", false);
        $("#txt_courseduration").val("").attr("disabled", false);
        $("#txt_year").val("").attr("disabled", false);
        $("#txt_timeoffered").val("").attr("disabled", false);
        $("#txt_stuenrolled").val("").attr("disabled", false);
        $("#txt_completing").val("").attr("disabled", false);

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
        $("#naac_132_133_div").hide();
        $("#naac_134_div").show();
        $("#txtcourseoffered").val("").attr("disabled", false);
        $("#txt_coursecode").val("").attr("disabled", false);
        $("#txt_courseduration").val("").attr("disabled", false);
        $("#txt_year").val("").attr("disabled", false);
        $("#txt_timeoffered").val("").attr("disabled", false);
        $("#txt_stuenrolled").val("").attr("disabled", false);
        $("#txt_completing").val("").attr("disabled", false);

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
    else if (getmetric == "1.1.1" || getmetric == "1.3.1")
    {
        $("#naac_132_133_div").hide();
        $("#naac_113_121_div").hide();
        $("#naac_132_133_div").hide();
        $("#naac_134_div").hide();
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
                if (getmetric == '1.1.2' || getmetric == '1.2.2') {
                    $("#Add_data").show();
                    metricid = $("#metricid").text();
                    getmetricdatalist(metricid, 'list');
                }
               else if (getmetric == '1.3.2' || getmetric == '1.3.3') {
                    $("#Add_data").show();
                    metricid = $("#metricid").text();
                    getmetricdatalist(metricid, 'list');
               }
               else if (getmetric == '1.1.3' || getmetric == '1.2.1') {
                   $("#Add_data").show();
                   metricid = $("#metricid").text();
                   getmetricdatalist(metricid, 'list');
               }
               else if (getmetric == '1.3.4') {
                   $("#Add_data").show();
                   metricid = $("#metricid").text();
                   getmetricdatalist(metricid, 'list');
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
        $("#naac_132_133_div").hide();
        $("#naac_113_121_div").hide();
        $("#fileupload").show();
        $("#datalist").hide();

        $("#txt_112_122_name").val("").attr("disabled", false);
        $("#txt_112_122_code").val("").attr("disabled", false);
        $("#txt_112_122_intro").val("").attr("disabled", false);
        $("#txt_112_122_status").val("0").attr("disabled", false);
        $("#txt_112_122_yearimp").val("0").attr("disabled", false);
        $("#txt_112_122_revision").val("0").attr("disabled", false);
        $("#txt_112_122_content").val("").attr("disabled", false);

       
    }
    else if(getmetricdiv == '1.3.2' || getmetricdiv == '1.3.3')
    {
        $("#Qualitative").hide();
        $("#savedata").show();
        $("#datadiscard").show();
        $("#Add_data").hide();
        $("#naac_112_122_div").hide();
        $("#naac_134_div").hide();
        $("#naac_132_133_div").show();
        $("#naac_113_121_div").hide();
        $("#fileupload").show();
        $("#datalist").hide();

        $("#txtcourseoffered").val("").attr("disabled", false);
        $("#txt_coursecode").val("").attr("disabled", false);
        $("#txt_courseduration").val("").attr("disabled", false);
        $("#txt_year").val("").attr("disabled", false);
        $("#txt_timeoffered").val("").attr("disabled", false);
        $("#txt_stuenrolled").val("").attr("disabled", false);
        $("#txt_completing").val("").attr("disabled", false);

      
     
    }
    else if(getmetricdiv == '1.1.3' || getmetricdiv == '1.2.1')
    {
        $("#Qualitative").hide();
        $("#savedata").show();
        $("#datadiscard").show();
        $("#Add_data").hide();
        $("#naac_112_122_div").hide();
        $("#naac_134_div").hide();
        $("#naac_132_133_div").hide();
        $("#naac_113_121_div").show();
        
        $("#fileupload").show();
        $("#datalist").hide();

        $("#txt_113_121_name").val("").attr("disabled", false);
        $("#txt_113_121_code").val("").attr("disabled", false);
        $("#txt_113_121_intro").val("0").attr("disabled", false);
        $("#txt_113_121_content").val("").attr("disabled", false);

    }
    else if (getmetricdiv == '1.3.4') {
        $("#Qualitative").hide();
        $("#savedata").show();
        $("#datadiscard").show();
        $("#Add_data").hide();
        $("#naac_112_122_div").hide();
        $("#naac_134_div").show();
        $("#naac_132_133_div").hide();
        $("#naac_113_121_div").hide();
        $("#fileupload").show();
        $("#datalist").hide();
        $("#txt_134_name").val("").attr("disabled", false);
        $("#txt_134_code").val("").attr("disabled", false);
        $("#txt_134_student").val("").attr("disabled", false);

    }
    else if (getmetricdiv == '1.1.1' || getmetricdiv == "1.3.1")
    {
        $("#savedata").show();
        $("#datadiscard").show();
        $("#Add_data").hide();
        $("#naac_112_122_div").hide();
        $("#naac_134_div").hide();
        $("#naac_132_133_div").hide();
        $("#naac_113_121_div").hide();
        $("#Qualitative").show();
        $("#fileupload").show();
        $("#datalist").hide();
    }
}
function discardbtn()
{
    $("#savedata").hide();
    $("#datadiscard").hide();
    $("#Add_data").show();
    $("#naac_112_122_div").hide();
    $("#naac_134_div").hide();
    $("#naac_132_133_div").hide();
    $("#naac_113_121_div").hide();
    $("#fileupload").hide();

    var getmetrictitle = $("#metricname").text();
    var getmetric = getmetrictitle.substring(7, 12);
    if (getmetric == '1.1.2' || getmetric == '1.2.2' || getmetric == '1.3.2' || getmetric == '1.3.3' || getmetric == '1.2.1' || getmetric == '1.1.3') {
        metricid = $("#metricid").text();
        getmetricdatalist(metricid,'list');
        $("#datalist").show();
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
    $("#naac_132_133_div").hide();
    $("#naac_113_121_div").hide();
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
    $("#naac_132_133_div").hide();
    $("#naac_113_121_div").hide();
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
    $("#naac_132_133_div").hide();
    $("#naac_113_121_div").hide();
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
    $("#naac_132_133_div").hide();
    $("#naac_113_121_div").hide();
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
    $("#naac_132_133_div").hide();
    $("#naac_113_121_div").hide();
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
    if (getmetric == '1.1.2' || getmetric == '1.2.2') {
        metricid = $("#metricid").text();
        getmetricdatalist(metricid,'list');
    }
    if (getmetric == '1.3.2' || getmetric == '1.3.3') {
        metricid = $("#metricid").text();
        getmetricdatalist(metricid, 'list');
    }
    if (getmetric == '1.1.3' || getmetric == '1.2.1') {
        metricid = $("#metricid").text();
        getmetricdatalist(metricid, 'list');
    }
    if (getmetric == '1.3.4') {
        metricid = $("#metricid").text();
        getmetricdatalist(metricid, 'list');
    }
    else if (getmetric == '1.1.1' || getmetric == "1.3.1") {
        metricid = $("#metricid").text();
        getmetricdatalist(metricid, 'qualitative');
        $("#metricadddiv").text(getmetric);
    }
    $("#metricadddiv").text(getmetric);
    //   $("#naacdatadiv").show();
  //  $("#naac_112_122_div").show();
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

var checkbox;
function dototask(sno) {

    $.ajax({
        type: "POST",
        url: "index.aspx/gettodotask",
        data: '{id:"' + sno + '" }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);
            var customers = xml.find("Table");
            var rows = '';
            $.each(customers, function () {
                $('#tasklist li').remove();
                $('#pendingdiv').show();

                var task = $(this).find("taskname").text();
                var taskstatus = $(this).find("taskstatus").text();
                var assignto = $(this).find("assignto").text();
                var assigndate = $(this).find("assigndate").text();
                var criterianame = $(this).find("Menuname").text();
                var enddate = $(this).find("enddate").text();
                var todoremark = $(this).find("todoremark").text();
                var tasksno = $(this).find("sno").text();

                checkbox = "<label class='form-check-label' style='color:#bd1c1c'><input class='checkbox' type='checkbox' id='filechecked' onclick='ShowHideDiv(" + tasksno + ")'> &nbsp; " + task + "";

                rows += "<li> <div class='form-check'><span class='mytooltip tooltip-effect-5'><span class='tooltip-item'>" + checkbox + "<i class='input-helper'></i><span style='color:green'> (" + criterianame + ")</span></span></label><span class='tooltip-content clearfix'><span class='tooltip-text'><span><b>Task Name :</b> " + task + " </span><br><span><b> Assign To :</b> " + assignto + " </span><br><span><b> Assign Date :</b> " + assigndate + "</span><br><span><b> Enddate : </b>" + enddate + "</span><br><span><b> Reamrk : </b>" + todoremark + "</span></span></span></span></div><span style='color: #337ab7;font-size: 15px;margin-left: auto !important;'>(" + assignto + ")</span><i class='fas fa-edit' style='margin-top: 5px;margin-left: 5px !important; font-size: 10px;' onclick='gettodoedit(" + tasksno + ")'></i><i class='remove mdi mdi-close-circle-outline' style='margin-left:5px !important;' onclick='deletetodo(" + tasksno + ")'></i></li>";
            });
            if (rows == "") {
                $('#tasklist li').remove();
                $('#pendingdiv').hide();
            }
            else {
                $('#tasklist').append(rows);
            }

        },
        error: function (response) {
            var r = jQuery.parseJSON(response.responseText);
            alert("Message: " + r.Message);
        }
    });

}


function deletemeeting(meetingid) {
    var alert = confirm("Are you sure want to delete this meeting?");
    if (alert) {
        var id = $("#criteriaid").text();
        $.ajax({
            type: "POST",
            url: "index.aspx/deletemeeting",
            data: '{id:"' + meetingid + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var result = response.d;
                if (result == "success") {
                    getmeeting(id);

                    dototask(id);
                    getcompetionssr(id);
                    getfaq(id);
                    dotocomtask(id);
                   
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
function deletetodo(meetingid) {
    var alert = confirm("Are you sure want to delete this Task?");
    if (alert) {
        var id = $("#criteriaid").text();
        $.ajax({
            type: "POST",
            url: "index.aspx/deletetodo",
            data: '{id:"' + meetingid + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var result = response.d;
                if (result == "success") {
                    getmeeting(id);
                    dototask(id);
                    getcompetionssr(id);
                    getfaq(id);
                
                    dotocomtask(id);
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
function getmeeting(sno) {

    $.ajax({
        type: "POST",
        url: "index.aspx/getmeetingtask",
        data: '{id:"' + sno + '" }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);
            var customers = xml.find("Table");
            var rows = '';
            $.each(customers, function () {
                $('#meetinglist li').remove();
                $('#notes').show();

                var meetingname = $(this).find("meetingname").text();
                var contactperson = $(this).find("contactperson").text();
                var Menuname = $(this).find("Menuname").text();
                var username = $(this).find("name").text();
                var meetingid = $(this).find("meetingid").text();
                var linksno = $(this).find("sno").text();
                rows += "<li style='border-radius: 7px;color: #004085;border-color: #cce5ff;background-color: #cce5ff;margin-bottom: 5px;'> <div class='form-check'><label class='form-check-label' onclick='getmeetingdetails(" + linksno + ")'>" + meetingname + "<span style='color:green'> (" + Menuname + ") </span><span style='color:green'> (" + username + ") </span></label></div><i class='remove mdi mdi-close-circle-outline' onclick='deletemeeting(" + linksno + ")'></i></li>";
            });
            if (rows == "") {
                $('#meetinglist li').remove();
                $('#notes').hide();
            }
            else {
                $('#meetinglist').append(rows);
            }

        },
        error: function (response) {
            var r = jQuery.parseJSON(response.responseText);
            alert("Message: " + r.Message);
        }
    });

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
            $("#naac_113_121_div").hide();
            $("#naac_132_133_div").hide();
            $("#fileupload").hide();
            $("#deletemetricdata").hide();
            $("#datalist").show();
            $("#update_metricdata").hide();
            $("#Qualitative").hide();
            }
            else if (customers.length > 0 && type == "qualitative") {
                $.each(customers, function () {
                   
                    $("#qualitativequestion").text($(this).find("qualitativequest").text());
                    $("#txt_qualitative").val("");
                    $("#txt_qualitative").val($(this).find("qualitative").text()).attr("disabled", true);
                    var dataid = $(this).find("dataid").text();
                    $("#fileupload").show();
                    $("#Qualitative").show();
                    $("#edit_metricdata").show();
                    $("#update_metricdata").hide();
                    $("#dataid").val($(this).find("dataid").text());
                });
            }
            else {
                $("#datalist").hide();
                $("#savedata").show();
                $("#datadiscard").show();
                $("#fileupload").show();
                var getmetrictitle = $("#metricname").text();
                var getmetric = getmetrictitle.substring(7, 12);
                if (getmetric == '1.1.2' || getmetric == '1.2.2') {
                    $("#naac_112_122_div").show();
                    $("#naac_132_133_div").hide();
                    $("#Qualitative").hide();
                    $("#naac_113_121_div").hide();
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
                    $("#naac_112_122_div").hide();
                    $("#naac_132_133_div").show();
                    $("#Qualitative").hide();
                    $("#naac_113_121_div").hide();
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
                    $("#naac_113_121_div").show();
                    $("#naac_112_122_div").hide();
                    $("#naac_132_133_div").hide();
                    $("#Qualitative").hide();

                    $("#txt_113_121_name").val("").attr("disabled", false);
                    $("#txt_113_121_code").val("").attr("disabled", false);
                    $("#txt_113_121_intro").val("0").attr("disabled", false);
                    $("#txt_113_121_content").val("").attr("disabled", false);
                    $("#dataid").val("0");
                }
                else if (getmetric == '1.3.4') {
                    $("#naac_113_121_div").hide();
                    $("#naac_112_122_div").hide();
                    $("#naac_134_div").show();
                    $("#naac_132_133_div").hide();
                    $("#Qualitative").hide();

                    $("#txt_134_name").val("").attr("disabled", false);
                    $("#txt_134_code").val("").attr("disabled", false);
                    $("#txt_134_student").val("").attr("disabled", false);
                    $("#dataid").val("0");
                }
               
                else if (getmetric == '1.1.1' || getmetric == "1.3.1") {
                    $("#naac_112_122_div").hide();
                    $("#naac_132_133_div").hide();
                    $("#Qualitative").show();
                    $("#naac_113_121_div").hide();
                }
                else {
                    $("#naac_132_133_div").hide();
                    $("#naac_112_122_div").hide();
                    $("#naac_134_div").hide();
                    $("#naac_113_121_div").hide();
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
    loder();
    $("#dataid").val(dataid);
    getmetricuploadlist(dataid);
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
                    }
                    else if (getmetric == '1.1.3' || getmetric == '1.2.1') {
                        $("#naac_113_121_div").show();
                        $("#naac_112_122_div").hide();
                        $("#naac_132_133_div").hide();
                        $("#naac_134_div").hide();
                        $("#Qualitative").hide();

                        $("#txt_113_121_name").val($(this).find("coursename_113").text()).attr("disabled", "disabled");
                        $("#txt_113_121_code").val($(this).find("coursecode_113").text()).attr("disabled", "disabled");
                        $("#txt_113_121_intro").val($(this).find("courseintro_113").text()).attr("disabled", "disabled");
                        $("#txt_113_121_content").val($(this).find("coursecontent_113").text()).attr("disabled", "disabled");
                       
                    }
                    else if (getmetric == "1.3.2" || getmetric == "1.3.3")
                    {
                        $("#txtcourseoffered").val($(this).find("coursename").text()).attr("disabled", "disabled");
                        $("#txt_coursecode").val($(this).find("course_code").text()).attr("disabled", "disabled");
                        $("#txt_courseduration").val($(this).find("durationof_course").text()).attr("disabled", "disabled");
                        $("#txt_year").val($(this).find("yearof_offering").text()).attr("disabled", "disabled");
                        $("#txt_timeoffered").val($(this).find("times_offered").text()).attr("disabled", "disabled");
                        $("#txt_stuenrolled").val($(this).find("enroll_student").text()).attr("disabled", "disabled");
                        $("#txt_completing").val($(this).find("stu_completing").text()).attr("disabled", "disabled");
                        $("#naac_112_122_div").hide();
                        $("#naac_134_div").hide();
                        $("#naac_132_133_div").show();
                        $("#naac_113_121_div").hide();
                    }
                    else if (getmetric == "1.3.4") {
                        $("#txt_134_name").val($(this).find("programname_134").text()).attr("disabled", "disabled");
                        $("#txt_134_code").val($(this).find("programcode_134").text()).attr("disabled", "disabled");
                        $("#txt_134_student").val($(this).find("studentname_134").text()).attr("disabled", "disabled");
                      
                        $("#naac_112_122_div").hide();
                        $("#naac_134_div").show();
                        $("#naac_132_133_div").hide();
                        $("#naac_113_121_div").hide();
                    }
                    else if (getmetric == "1.1.1" || getmetric == "1.3.1")
                    {
                        $("#dataid").val($(this).find("dataid").text());
                        $("#qualitativequestion").text($(this).find("qualitativequest").text());
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
function dotocomtask(sno) {

    $.ajax({
        type: "POST",
        url: "index.aspx/getcomtodotask",
        data: '{id:"' + sno + '" }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);
            var customers = xml.find("Table");
            var rows = '';
            $.each(customers, function () {
                $('#completelist li').remove();
                //$('#completelist li').remove();
                $('#completediv').show();
                var task = $(this).find("taskname").text();
                var taskstatus = $(this).find("taskstatus").text();
                var assignto = $(this).find("assignto").text();
                var tasksno = $(this).find("sno").text();
                var criterianame = $(this).find("Menuname").text();
                if (taskstatus == 1) {
                    //checkbox = "<input type='checkbox' checked='checked' id='filechecked' onclick='ShowHideDiv(" + tasksno + ")' /> <span style='color:green'>" + task + "</span>";
                    checkbox = "<label class='form-check-label_com' style='color:#19661c'><input type='checkbox' checked='checked' id='filechecked' onclick='ShowHideDiv(" + tasksno + ")'> &nbsp; " + task + "";
                }

                rows += "<li> <div class='form-check'>" + checkbox + "<i class='input-helper'></i><span style='color:green'> (" + criterianame + ")</span></label></div><span style='color: #337ab7;font-size: 15px;margin-left: auto !important;'>(" + assignto + ")</span></li>";
            });
            if (rows == "") {
                $('#completelist li').remove();
                $('#completediv').hide();
            }
            else {
                $('#completelist').append(rows);
            }

        },
        error: function (response) {
            var r = jQuery.parseJSON(response.responseText);
            alert("Message: " + r.Message);
        }
    });

}
function ShowHideDiv(checkid) {
    var treesno = document.getElementById("treeid").value;
    var treename = document.getElementById("treename").value;
    var checkbox = document.getElementById('filechecked');
    if (checkbox.checked != false) {
        $.ajax({
            type: "POST",
            url: "index.aspx/updatetodo",
            data: '{id:"' + checkid + '",taskstatus:"' + "1" + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                // alert("Record Update Successfully...!");
                //$("#tasklist").find("li").empty();
                $('#tasklist li').remove();
                $('#completelist li').remove();
                someFunction(treesno, treename);
                $("#home").removeClass("active in");
                $("#hometab").removeClass("naactabul_li");
                $("#todo").addClass("active in");
                $("#todotab").addClass("active");
            },
            error: function (response) {
                var r = jQuery.parseJSON(response.responseText);
                alert("Message: " + r.Message);
            }
        });

    } else {

        $.ajax({
            type: "POST",
            url: "index.aspx/updatetodo",
            data: '{id:"' + checkid + '",taskstatus:"' + "0" + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                //   alert("Record Update Successfully...!");
                $('#completelist li').remove();
                $('#tasklist li').remove();
                someFunction(treesno, treename);
                $("#home").removeClass("active in");
                $("#hometab").removeClass("naactabul_li");
                $("#todo").addClass("active in");
                $("#todotab").addClass("active");
            },
            error: function (response) {
                var r = jQuery.parseJSON(response.responseText);
                alert("Message: " + r.Message);
            }
        });
    }


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
    


    $("#ddl_datacriteria option[value=" + id + "]").attr('selected', 'selected');

    $("#criteriapath").text(text);

    $('#dashboardtab').hide();
   
    dototask(id);
    getmeeting(id);

    dotocomtask(id);
    var hiddendivvalue = $('#hidediv').val();
    if (id != "") {
        if (hiddendivvalue == "") {
            //  $('#welcomdiv').hide();
            $('#' + id + '_div').show();
            $('#' + id + '_divsop').show();
            $('#' + id + '_divguide').show();
            $("#criterianame").text("");
            $("#criterianame").text(text);
            $("#meetingcriterianame").text("");
            $("#meetingcriterianame").text(text);
            $("#criteriaid").text(" ");
            $("#criteriaid").text(id);


        }
        else if (hiddendivvalue == id) {
            //   $('#welcomdiv').hide();
            $('#' + id + '_div').show();
            $('#' + id + '_divsop').show();
            $('#' + id + '_divguide').show();
            $("#criterianame").text("");
            $("#criterianame").text(text);
            $("#meetingcriterianame").text("");
            $("#meetingcriterianame").text(text);
            $("#criteriaid").text(" ");
            $("#criteriaid").text(id);
        }
        else {
            //   $('#welcomdiv').hide();
            $('#' + id + '_div').show();
            $('#' + id + '_divsop').show();
            $('#' + id + '_divguide').show();
            $("#criterianame").text("");
            $("#criterianame").text(text);
            $("#meetingcriterianame").text("");
            $("#meetingcriterianame").text(text);
            $("#criteriaid").text(" ");
            $("#criteriaid").text(id);
            $('#' + hiddendivvalue + '_div').hide();
            $('#' + hiddendivvalue + '_divsop').hide();
            $('#' + hiddendivvalue + '_divguide').hide();
        }
    }
    else {
        var lastdiv = localStorage.getItem("lastopendiv");
        if (lastdiv == null) {
            $('.article').hide();
        }
        else {
            $("#criterianame").text("");
            $("#criterianame").text(text);
            $("#meetingcriterianame").text("");
            $("#meetingcriterianame").text(text);

            $("#criteriaid").text(" ");
            $("#criteriaid").text(id);
            $('#' + hiddendivvalue + '_div').hide();
            $('#' + hiddendivvalue + '_divsop').hide();
            $('#' + hiddendivvalue + '_divguide').hide();

        }
        //  $('#welcomdiv').show();
    }
    $("#hidediv").val(id);

}
function getmetricdetails(metricsno)
{
    $('#filelistshow div').remove();
    $("#metricid").text(metricsno);
    loder();
    $("#faqhidenid").val(metricsno);
    $("#ssrhidenid").val(metricsno);
    $("#savedata").hide();
    $("#datadiscard").hide();
    $("#Add_data").hide();
    $("#naac_112_122_div").hide();
    $("#naac_134_div").hide();
    $("#naac_113_121_div").hide();
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
                if (getmetric == '1.1.2' || getmetric == '1.2.2') {
                    metricid = $("#metricid").text();
                    getmetricdatalist(metricid,'list');
                    $("#metricadddiv").text(getmetric);
                    $("#metrictype").val("list");

                }
                else if (getmetric == '1.3.2' || getmetric == '1.3.3') {
                    metricid = $("#metricid").text();
                    getmetricdatalist(metricid, 'list');
                    $("#metricadddiv").text(getmetric);
                    $("#metrictype").val("list");

                }
                else if (getmetric == '1.1.3' || getmetric == '1.2.1') {
                    metricid = $("#metricid").text();
                    getmetricdatalist(metricid, 'list');
                    $("#metricadddiv").text(getmetric);
                    $("#metrictype").val("list");

                }
                else if (getmetric == '1.3.4' ) {
                    metricid = $("#metricid").text();
                    getmetricdatalist(metricid, 'list');
                    $("#metricadddiv").text(getmetric);
                    $("#metrictype").val("list");

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
                    $("#naac_113_121_div").hide();
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
var wikiid = 0;
$(function () {
    $('[id*=a_btn]').bind('click', function () {
        var row = $(this).closest('tr');
        var id = $(row).find('.rid').html().trim();
        var title = $(row).find('.rtitle').html().trim();
        var wiki = $(row).find('.rwiki').html().trim();
        wikiid = id;
        //   $("#summernote").summernote("code", wiki);
        $("#title").text(title);
        $("#criterianame").text(title);
        $("#meetingcriterianame").text(title);

        $('#exampleModalCenter').modal('show');

    });
});

function showMessage() {
    //alert(wikiid);

    var Details = {};
    //     Details.details = $("#summernote").val();
    Details.wikiid = wikiid;
    var jsonData = JSON.stringify({
        Details: Details
    });

    $.ajax({
        type: "POST",
        url: "index.aspx/adddetails",
        data: jsonData,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: OnSuccess,
        error: OnErrorCall
    });

    function OnSuccess(response) {
        var result = response.d;
        if (result == "success") {

            localStorage.setItem("lastopendiv", $('#hidediv').val());
            //   var divvalue = $('#hidediv').val();
            $('#exampleModalCenter').modal('hide');
            location.reload();
            $('#' + divvalue + '_div').show();
        }

    }
    function OnErrorCall(response) {
        alert("Failed in Updating Details.");
    }
}

function getPath(a) {
    var path = $(a).text();
    var $parent = $(a).parents("li").eq(1).find("a:first");

    if ($parent.length == 1) {
        path = getPath($parent) + " > " + path;
    }

    return path;
}
$(document).ready(function () {
    $("#fileuploadbtn").click(function () {
        var filename = $("#txt_title").val();
        var description = $("#txt_description").val();
        var getcriteriavalue = $('#ddl_datacriteria option:selected').val();
        var fileUpload = $("#FileUpload1").get(0);
        var files = fileUpload.files;
        var id = $("#criteriaid").text();
        //    alert(id);
        var data = new FormData();
        if (files.length > 0) {
            data.append('filepath', files[0]);
        }
        data.append('filename', filename);
        data.append('description', description);
        data.append('getcriteriavalue', getcriteriavalue);
        $.ajax({
            url: "../fileupload.ashx",
            type: "POST",
            data: data,
            contentType: false,
            processData: false,
            success: function (result) {
                alert(result);
              //  filelist(id)
            },
            error: function (err) {
                alert(err.statusText)
            }
        });

        //   evt.preventDefault();
        //   alert(files);
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
                $("#naac_113_121_div").hide();
                $("#naac_132_133_div").hide();
                $("#datalist").show();
                $("#fileupload").hide();
                var getmetrictitle = $("#metricname").text();
                var getmetric = getmetrictitle.substring(7, 12);
                if (getmetric == '1.1.2' || getmetric == '1.2.2') {
                    metricid = $("#metricid").text();
                    getmetricdatalist(metricid,'list');
                }
                else if(getmetric == '1.3.2' || getmetric == '1.3.3')
                {
                    metricid = $("#metricid").text();
                    getmetricdatalist(metricid, 'list');
                }
                else if (getmetric == '1.1.3' || getmetric == '1.2.1') {
                    metricid = $("#metricid").text();
                    getmetricdatalist(metricid, 'list');
                }
                else if (getmetric == '1.3.4') {
                    metricid = $("#metricid").text();
                    getmetricdatalist(metricid, 'list');
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

function uploaddatafile()
{
    var getdataid = $("#dataid").val();
    var metricidget = $("#metricid").text();
    $('.progress-bar-aqua').css('width', '0');
  //  $('.msg').text('');
    var myfile = $('#fuUpload').val();
    if (myfile == '') {
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
            getmetricuploadlist(getdataid);

        }
    });
}

function getmetricuploadlist(dataid)
{
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
                var rowsno = $(this).find("rowno").text();
                
                rows += "<div style='padding-bottom: 5px;'>" + rowsno + ". <a class='btn btn-primary' style='color: white;border-radius: 16PX;' href='../Datametricfiles/" + datafilename + "' target='_blank'><i class='fa fa-view'></i> View Uploaded Document</a><img src='../Img/trash.svg' style='float: right;cursor: pointer;' onclick='deletefile(" + fileid + ")'></div>";
            });
            $('#filelistshow').append(rows);
        
        },
        error: function (response) {
            var r = jQuery.parseJSON(response.responseText);
            alert("Message: " + r.Message);
        }
    });
}

function deletefile(listid) {
    var metricidget = $("#metricid").text();
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
                    getmetriclist(metricidget);
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
