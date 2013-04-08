// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require main
//= require jquery_ujs

jQuery.ajaxSetup({
    'beforeSend': function (xhr) {
        xhr.setRequestHeader("Accept", "text/javascript")
    }
});

jQuery.fn.submitWithAjax = function () {
    this.submit(function () {
        $.post(this.action, $(this).serialize(), null, "script");
        return false;
    });
    return this;
};

$(document).ready(function () {
    var evnts = function () {
        return {
            "event": [
                {"date": "04/05/2013", "title": "1"}
                ,
                {"date": "02/02/2012", "title": "2"}
                ,
                {"date": "03/03/2012", "title": "34"}
                ,
                {"date": "04/04/2012", "title": "123"}
                ,
                {"date": "05/05/2012", "title": "223"}
                ,
                {"date": "06/06/2012", "title": "4"}
                ,
                {"date": "07/07/2012", "title": "5"}
                ,
                {"date": "08/08/2012", "title": "14"}
                ,
                {"date": "09/09/2012", "title": "10"}
                ,
                {"date": "10/10/2012", "title": "10"}
                ,
                {"date": "11/11/2012", "title": "10"}
                ,
                {"date": "12/12/2012", "title": "10"}
            ]
        }
    };

//    $("#new_review").submitWithAjax();
    var glob_current_day = new Date();

    var cal = $('#calendar');
    if (cal) {
        cal.Calendar({ 'events': evnts, 'weekStart': 1 })
            .on('changeDay', function (event) {
                $.post("/schedules/" + event.year.valueOf() + "/" + event.month.valueOf() + "/" + event.day.valueOf());
            })
            .on('onCurrent', function (event) {
                $.post("/schedules/" + glob_current_day.getFullYear().valueOf() + "/" + (glob_current_day.getMonth() + 1).valueOf() + "/" + glob_current_day.getDate().valueOf());
            });
    }

    try {
         $.post("/schedules/" + glob_current_day.getFullYear().valueOf() + "/" + (glob_current_day.getMonth() + 1).valueOf() + "/" + glob_current_day.getDate().valueOf());
    } catch (e) {
        alert(e.message);
    }

});