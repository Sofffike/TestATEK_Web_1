<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-1.10.1.min.js"></script>

    <style>
        .center {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="center">
            <ul>
                <li><a href="opennotepad://C:/Windows/notepad.exe" class="h2">Запустить</a></li>
                <li><a href="#" id="selectLink" class="h2">Выбрать</a></li>
            </ul>

            <div class="h2" id="divValue"></div>
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="myModalLabel">Уведомление</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Для решения первого задания, было принято решение изменить реестр. <br />
                            Файл .reg будет автоматически скачан при нажатии на кнопку "Установить". <br />
                            Вам необходимо установить данный фаил проигнорировав предупреждения системы безопасности.<br />

                            Если вы используете браузер IE рекомендую установить файл .reg "вручную". <br />
                            (Лежит в папке file)
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Отмена</button>
                            <button type="button" class="btn btn-primary" id="createRegLink">Установить</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script>

        $(document).ready(function () {
            $('#myModal').modal('show');
            var createRegLink = document.getElementById("createRegLink");

            createRegLink.onclick = function () {
                // Формируем содержимое reg файла
                var regContent = 'Windows Registry Editor Version 5.00\n\n';
                regContent += '[HKEY_CLASSES_ROOT\\opennotepad]\n';
                regContent += '@="URL:Open Notepad Protocol"\n';
                regContent += '"URL Protocol"=""\n\n';
                regContent += '[HKEY_CLASSES_ROOT\\opennotepad\\shell]\n\n';
                regContent += '[HKEY_CLASSES_ROOT\\opennotepad\\shell\\open]\n\n';
                regContent += '[HKEY_CLASSES_ROOT\\opennotepad\\shell\\open\\command]\n';
                regContent += '@="\\"C:\\\\Windows\\\\notepad.exe\\""';

                var downloadLink = document.createElement('a');
                downloadLink.href = 'data:text/plain;charset=utf-8,' + encodeURIComponent(regContent);
                downloadLink.download = 'open_notepad.reg';

                document.body.appendChild(downloadLink);
                downloadLink.click();
                document.body.removeChild(downloadLink);

                $('#myModal').modal('hide');
                return false;
            };

            var sendRequest = document.getElementById("selectLink");
            sendRequest.onclick = function () {
                var xhr = new XMLHttpRequest();

                xhr.open("GET", "http://localhost:8080/?i=1&j=2");

                xhr.onload = () => {
                    if (xhr.status != 200) {
                        alert(`Ошибка ${xhr.status}: ${xhr.statusText}`);
                    } else {
                        document.getElementById("divValue").innerHTML = xhr.responseText
                    }
                };
                xhr.send();
            }
        })

    </script>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
