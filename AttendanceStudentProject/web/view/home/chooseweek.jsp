<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link rel="stylesheet" href="./styles/style.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
        <style>
            .bootstrap-datetimepicker-widget .datepicker-days table tbody tr:hover {
                background-color: #eee;
            }

        </style>
    </head>
    <body>

        <div class="container">
            <div class="row">
                <div class="col-sm-6 form-group">
                    <form  action="schedule" enctype='multipart/form-data' id='formId'>
                        <div  class="input-group" id="DateDemo">
                            <input autocomplete="off" type="text" id='weeklyDatePicker' value="" name="date"  placeholder="${date}" />
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            $(document).ready(function () {
                var formatDate = "DD-MM-YYYY";
                moment.locale('es', {
                    week: {dow: 1}
                });
                $("#weeklyDatePicker").datetimepicker({
                    format: formatDate
                });
                $('#weeklyDatePicker').on('dp.hide', function (e) {
                    var value = $("#weeklyDatePicker").val();
                    var firstDate = moment(value, formatDate).day(0).format(formatDate);
                    var lastDate = moment(value, formatDate).day(6).format(formatDate);
                    $("#weeklyDatePicker").val(firstDate + "-" + lastDate);
                    $('#formId').submit();
                });
            });
        </script>
    </body>
</html>