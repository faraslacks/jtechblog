<%@ page pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <title>Admin part of blog</title>
    <meta charset="utf-8">
    <!-- CDNs resources -->
    <link href="http://fonts.googleapis.com/css?family=PT+Serif:400,400italic&subset=latin,cyrillic" rel="stylesheet" type="text/css" media="screen">
    <link href="http://cdn.jsdelivr.net/select2/3.4.2/select2.css" rel="stylesheet" type="text/css" media="screen" />
    <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="screen">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
    <script src="http://cdn.jsdelivr.net/select2/3.4.2/select2.min.js"></script>
    <!-- Local resources -->
    <link href="<c:url value='/resources/css/style.css' />" rel="stylesheet" type="text/css" media="screen">
    <style>
        body {
            background-image: url("<c:url value='/resources/images/greyzz.png' />");
        }
        body, p, span {
            font-family: 'PT Serif', serif;
            font-weight: 300;
            line-height: normal;
        }
        p {
            text-indent: 2.5em;
            margin: 0;
            line-height: 1.5;
        }
        /*div.left-panel {*/
            /*text-align: center;*/
        /*}*/
        div.row-fluid {
            margin-top: 20px;
        }
        /*.left {*/
            /*text-align: left;*/
        /*}*/
        /*.top-margin {*/
            /*margin-top: 20px;*/
        /*}*/
        h1, h2, h3, h4, h5, h6 {
            font-weight: 300;
        }
        .box-size {
            -moz-box-sizing: border-box; /* Для Firefox */
            -webkit-box-sizing: border-box; /* Для Safari и Chrome */
            box-sizing: border-box; /* Для IE и Opera */
        }
    </style>
    <script type="text/x-mathjax-config">
        MathJax.Hub.Config({
            jax: ["input/TeX", "output/HTML-CSS"],
                tex2jax: {
                inlineMath: [['$','$'], ['\\(','\\)']]
            }
        });
    </script>
    <script type="text/javascript" src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS_HTML"></script>
</head>
<body>
<img src="<c:url value='/resources/images/inkblot.png' />" style="position: absolute; left: -35px; top: -35px; z-index: -1" />
<div class="container-fluid">
    <div class="navbar navbar-inverse">
        <div class="navbar-inner collapse">
            <div class="container">
                <a class="brand box-size" style="padding: 6px 20px 10px" href="./">Coffee on keyboard</a>
                <ul class="nav">
                    <li class="divider-vertical"></li>
                    <li class="active">
                        <a href="">Посты</a>
                    </li>
                    <li class="">
                        <a href="">Комментарии</a>
                    </li>
                    <li class="divider-vertical"></li>
                    <li class="">
                        <a href="">Статистика</a>
                    </li>
                    <li class="">
                        <a href="">Пользователи</a>
                    </li>
                </ul>
                <form class="navbar-form pull-right">
                    <button type="submit" class="btn btn-warning">Выход</button>
                </form>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span6 well">
            <h4>Разделы блога</h4>
            <ul>
                <li>Русскоязычный раздел
                    <ul>
                        <li>Математика
                            <ul>
                                <li>Биномиальное распределение: бросаем монетку, ждем динозавра <span class="pull-right">(23.08.2013)</span></li>
                                <li>Нормальное распределение: дербаним формулу плотности вероятности <span class="pull-right">(12.09.2013)</span></li>
                            </ul>
                        </li>
                        <li>Программирование
                            <ul>
                                <li>Нормальные формы: все здравомыслящие специалисты остановятся на третьей <span class="pull-right">(20.09.2013)</span></li>
                                <li>Классификация языков программирования: in progress... <span class="pull-right">(22.09.2013)</span></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li>Англоязычный раздел
            </ul>
        </div>
        <div class="span6 well">
            <div style="margin-bottom: 0" class="accordion" id="accordion">
                <div class="accordion-group">
                    <div class="accordion-heading">
                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#rules">
                            <h4>Правила оформления постов</h4>
                        </a>
                    </div>
                    <div id="rules" class="accordion-body collapse in">
                        <div class="accordion-inner">
                            <p>Для форматирования постов используется язык разметки <a href="">Textile</a>, расширенный функциями форматирования графиков.</p>
                            <ol>
                                <li>Формулы необходимо включать в $\LaTeX$-скобки.</li>
                                <li>Каждый новый раздел поста начинается с 'h3.'.</li>
                                <li>Абзац начинается с 'p.'.</li>
                                <li>Исходный код нужно пердварять 'bc.(языковой код)'.</li>
                                <li>Для вставки графика нужно добавить в текст его JSON-описание. Пример:
<pre>{
    type: "historgam",
    width: "320px",
    height: "200px",
    label_x: "Количество выпавших орлов",
    label_y: "Вероятность",
    data: {
        x: [1, 2, 3, 4, 5],
        y: [1, 2, 4, 6, 4]
    }
}</pre>
                                </li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span6 well">
            <input class="box-size" type="text" placeholder="Название поста" style="width: 49.5%; height: 2em" />
            <input class="box-size" type="text" placeholder="URL (можно оставить пустым)" style="width: 49.5%; height: 2em" />
            <textarea style="width: 100%; height: 600px" class="box-size">h3. Заголовок</textarea>
        </div>
        <div class="span6 well">
        </div>
    </div>
</div>
<script>
    (function($) {
        $('select').select2();
    })(jQuery);
</script>
</body>
</html>
