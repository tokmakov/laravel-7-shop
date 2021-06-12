jQuery(document).ready(function($) {
    /*
     * Общие настройки ajax-запросов, отправка на сервер csrf-токена
     */
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    /*
     * Автоматическое создание slug при вводе name (замена кириллицы на латиницу)
     */
    $('input[name="name"]').on('input', function() {
        var map = {
            'А': 'A', 'Б': 'B', 'В': 'V', 'Г': 'G', 'Д': 'D', 'Е': 'E', 'Ё': 'Yo', 'Ж': 'Zh',
            'З': 'Z', 'И': 'I', 'Й': 'J', 'К': 'K', 'Л': 'L', 'М': 'M', 'Н': 'N', 'О': 'O',
            'П': 'P', 'Р': 'R', 'С': 'S', 'Т': 'T', 'У': 'U', 'Ф': 'F', 'Х': 'H', 'Ц': 'C',
            'Ч': 'Ch', 'Ш': 'Sh', 'Щ': 'Sh', 'Ъ': '', 'Ы': 'Y', 'Ь': '', 'Э': 'E', 'Ю': 'Yu',
            'Я': 'Ya',
            'а': 'a', 'б': 'b', 'в': 'v', 'г': 'g', 'д': 'd', 'е': 'e', 'ё': 'yo', 'ж': 'zh',
            'з': 'z', 'и': 'i', 'й': 'j', 'к': 'k', 'л': 'l', 'м': 'm', 'н': 'n', 'о': 'o',
            'п': 'p', 'р': 'r', 'с': 's', 'т': 't', 'у': 'u', 'ф': 'f', 'х': 'h', 'ц': 'c',
            'ч': 'ch', 'ш': 'sh', 'щ': 'sh', 'ъ': '', 'ы': 'y', 'ь': '', 'э': 'e', 'ю': 'yu',
            'я': 'ya',
        };
        var text = $(this).val();
        for (var k in map) {
            text = text.replace(RegExp(k, 'g'), map[k]);
        }
        text = text.replace(/[^- _a-zA-Z0-9]/g, '');
        text = text.replace(/\s+/g, '-');
        text = text.replace(/-+/g, '-');
        $('input[name="slug"]').val(text);
    });
    /*
     * Подключение wysiwyg-редактора для редактирования контента страницы
     */
    $('textarea[id="editor"]').summernote({
        lang: 'ru-RU',
        height: 300,
        callbacks: {
            /*
             * При вставке изображения загружаем его на сервер
             */
            onImageUpload: function(images) {
                for (var i = 0; i < images.length; i++) {
                    uploadImage(images[i], this);
                }
            },
            /*
             * При удалении изображения удаляем его на сервере
             */
            onMediaDelete: function(target) {
                removeImage(target[0].src);
            }
        }
    });
    /*
     * Загружает на сервер вставленное в редакторе изображение
     */
    function uploadImage(image, textarea) {
        var data = new FormData();
        data.append('image', image);
        $.ajax({
            data: data,
            type: 'POST',
            url: '/admin/page/upload/image',
            cache: false,
            contentType: false,
            processData: false,
            dataType: 'json',
            success: function(data) {
                $(textarea).summernote('insertImage', data.image, function ($img) {
                    $img.css('max-width', '100%');
                });
            },
            error: function (reject) {
                $.each(reject.responseJSON.errors, function (key, value) {
                    alert(value);
                });
            }
        });
    }
    /*
     * Удаляет на сервере удаленное в редакторе изображение
     */
    function removeImage(src) {
        $.ajax({
            data: {'image': src, '_method': 'DELETE'},
            type: 'POST',
            url: '/admin/page/remove/image',
            cache: false,
            success: function(data) {
                console.log(data);
            }
        });
    }
});
