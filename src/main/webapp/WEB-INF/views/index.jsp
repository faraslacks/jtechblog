<%@ page pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Математический блог. Биномиальное распределение: бросаем монетку, ждем динозавра.</title>
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
            margin-top: 20px;
        }
        body, p, span, h1, li {
            font-family: 'PT Serif', serif;
            font-weight: 300;
            line-height: normal;
        }
        p {
            text-indent: 2.5em;
            margin: 0;
            line-height: 1.5;
        }
        ol {
            margin-left: 2.5em;
        }
        h1, h2, h3, h4, h5, h6 {
            font-weight: 300;
        }
        span.blog {
            font-style: italic;
            vertical-align: baseline;
        }
        td, th {
            text-align: center !important;
        }
        blockquote {
            margin: 0.5em 0 0.5em 5em;
        }
        .box-size {
            height: 2em !important;
            -moz-box-sizing: border-box; /* Для Firefox */
            -webkit-box-sizing: border-box; /* Для Safari и Chrome */
            box-sizing: border-box; /* Для IE и Opera */
        }
    </style>
    <script type="text/x-mathjax-config">
        MathJax.Hub.Config({
            jax: ["input/TeX", "output/SVG"],
            tex2jax: {
                inlineMath: [['$','$'], ['\\(','\\)']]
            },
            TeX: {
                equationNumbers: {
                    autoNumber: "AMS"
                }
            }
        });
    </script>
    <script type="text/javascript" src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS_HTML"></script>
</head>
<body>
<div id="wrap">
    <img src="<c:url value='/resources/images/inkblot.png' />" style="position: absolute; left: -35px; top: -35px; z-index: -1" />
    <div id="main" class="container clear-top">
        <div class="row">
            <div class="span7 well">
                <h1>Математический блог</h1>
                <p>Также на этом сайте есть <a href="">блог о программировании</a></p>
                <hr />
                <div>
                    <h2>Биномиальное распределение: бросаем монетку, ждём динозавра.</h2>
                    <span class="blog">31.08.2013</span>
                    <!-- Поместите этот тег туда, где должна отображаться кнопка +1. -->
                    <div style="float: right">
                        <!-- Поместите этот тег туда, где должна отображаться кнопка +1. -->
                        <div class="g-plusone" data-size="tall" data-expandTo="bottom"></div>

                        <!-- Поместите этот тег за последним тегом виджета кнопка +1. -->
                        <script type="text/javascript">
                            window.___gcfg = {lang: 'ru'};

                            (function() {
                                var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
                                po.src = 'https://apis.google.com/js/plusone.js';
                                var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
                            })();
                        </script>
                    </div>
                    <h3>Оглавление</h3>
                    <ol class="content rounded-list">
                        <li><a href="">Немного о вероятностях</a></li>
                        <li><a href="">Откуда берется биномиальное распределение</a></li>
                    </ol>
                    <h3>Немного о вероятностях</h3>
                    <p>Сначала о задаче. Предположим, нам совсем нечем заняться и мы бросаем монетку. Вероятность того, что выпадет орёл примерно 1/2, того, что выпадет решка примерно такая же. Мы рассматриваем такой мир, в котором монетки не бывают идеально сбалансированными (то есть практически такой же мир, как тот в котором мы живем). Всё же верно?</p>
                    <p>Почему вероятности равны? Как мы это посчитали? Мы взяли единицу и поделили её на двойку. Просто потому что это интуитивно понятно, и нам это сошло с рук, потому что мы оказались абсолютно правы. Единица в числителе дроби означает, что мы рассматриваем одно из возможных событий, а двойка в знаменателе, что всего возможных событий два. Всё это берется из определения вероятности:</p>
                    \begin{equation}
                        \label{prob}
                        P(A) = {m \over n}
                    \end{equation}
                    <p>Формула \eqref{prob}.</p>
                    <p>Теперь заметим, что на самом деле, вероятность выпадения орла <em>примерно</em> 1/2, а формула ясно говорит нам, что вероятность будет <em>точно</em> 1/2, и попытаемся понять, какую ошибку в рассуждениях мы допустили.</p>
                    <p>Мы делили 1 на 2 потому что 1 &mdash; это один из возможных исходов, а 2 &mdash; это количество исходов всего. Всё на самом деле не так. $m$ &mdash; это количество исходов благоприятствующих наступлению события, вероятность которого мы <em>хотим измерить</em> (например, выпадению орла), а $n$ &mdash; количество всех возможных исходов (у нас их всего 2 и это, вроде бы, не вызывает сомнений). Мы просто поделили 1 на 2 потому что предположили (хоть и не осознали этого), что вероятности этих двух событий равны, следовательно, поскольку событий два значит в одном из двух случаев будет выпадать орёл, а в другом решка.</p>
                    <p>Рассуждая таким образом, мы получим вероятность 1/2 встретить динозавра на улице (бородатый анекдот, не буду его пересказывать). Всего событий 2: либо встречаем динозавра, либо не встречаем. Ну и далее по тексту.</p>
                    <p>Для того, чтобы <em>измерить</em> вероятность, надо её измерять, то есть заниматься тем, чем мы уже занимаемся: бросать монетку. Например, 100 раз. Потом взять количество выпадений орла и поделить его на 100. Уверяю вас, что ровно 1/2 вы получите далеко не в каждом таком эксперименте. Хотя это тоже возможно.</p>
                    <p>То, что мы описали называется проведением серии независимых испытаний. Смысл в том, что вероятность выпадения орла при каждом новом подбрасывании монетки не зависит от того, выпал орел в предыдущем эксперименте или нет. Она вообще зависит только от монетки и остальных свойств мира.</p>
                    <h3>Откуда берется биномиальное распределение</h3>
                    <p>Несколько слов о том, откуда ему взяться...</p>
                    <br />
                    <span>Теги: <span><a href="">биномиальное распределение</a></span>, <span><a href="">теория вероятностей</a></span></span>
                    <h4>Список литературы:</h4>
                    <ol>
                        <li>Парамонов С.И., Кутергин Б.С. Примеры использования ёжиков в быту. &mdash; 5-е изд. &mdash; Иркутск: Пурга-книга, 1997. &mdash; С. 34.</li>
                        <li>Измайлов В.К. Топология замешательства. &mdash; Омск: Пурга-книга, 1999. &mdash; С. 88.</li>
                        <li>Хвостенко В.В., Каторгин Г.С. Алгебра мещанских пространств. &mdash; 2-е изд. &mdash; Тверь: Пурга-книга, 2012. &mdash; С. 372.</li>
                    </ol>
                    <hr />
                    <span class="blog" style='float: right'><a href="#">Оставить комментарий</a></span>
                    <h3>Комментарии:</h3>
                </div>
            </div>
            <div class="span4 well">
                <form class="form-search">
                    <input style="width: 80%" type="text" class="search-query box-size" placeholder="Поисковый запрос">
                    <button style="width: 18%" type="submit" class="btn box-size">Поиск</button>
                </form>
                <span class="blog">В этом разделе я пишу то, о чём мне нравится размышлять. Цель каждого поста здесь
                    &mdash; рассказать сложные (и не очень) вещи простым человеческим языком, заострив внимание
                на том, что именно означает та или иная математическая абстракция, откуда она выросла
                и какое отношение имеет к реальности. По-возможности, каждый пост снабжается списком
                литературы в которую я заглянул пока писал, симпатичными иллюстрациями и иногда исторической
                справкой.</span>
                <br /><br />
                <h4>Автор оказывает услуги:</h4>
                <ul>
                    <li><a href="#">Разработка и починка сайтов любой сложности.</a></li>
                    <li><a href="#">Написание скриптов переноса данных и автоматизации.</a></li>
                </ul>
                <!-- Реклама от Google -->
                <div style="text-align: center">
                    <script type="text/javascript">
                        <!--
                        google_ad_client = "ca-pub-9454464444967055";
                        /* Блог (справа-сверху) */
                        google_ad_slot = "1770463204";
                        google_ad_width = 250;
                        google_ad_height = 250;
                        //-->
                    </script>
                    <script type="text/javascript" src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
                    </script>
                </div>
                <!-- Реклама от Google -->
                <h4>Последние посты:</h4>
                <ul>
                    <li><a href="#">Булевы функции: пересекаем множества, строим логические цепи</a></li>
                    <li><a href="#">Нормальное распределение: дербаним формулу плотности вероятности</a></li>
                    <li><a href="#">Коэффициент корелляции: корелляция $\neq$ зависимость</a></li>
                    <li><a href="#">Факторный анализ</a></li>
                    <li><a href="#">Метод наименьших квадратов</a></li>
                </ul>
                <h4>Архив постов:</h4>
                <div class="accordion" id="accordion2">
                    <div class="accordion-group">
                        <div class="accordion-heading">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
                                2013 (14)
                            </a>
                        </div>
                        <div id="collapseOne" class="accordion-body collapse in">
                            <div class="accordion-inner">
                                <ol>
                                    <li>Пост номер 1</li>
                                    <li>Пост номер 2</li>
                                    <li>Пост номер 3</li>
                                    <li>Пост номер 4</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-group">
                        <div class="accordion-heading">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">
                                Старые посты (6)
                            </a>
                        </div>
                        <div id="collapseTwo" class="accordion-body collapse">
                            <div class="accordion-inner">
                                <ol>
                                    <li>Пост номер 1</li>
                                    <li>Пост номер 2</li>
                                    <li>Пост номер 3</li>
                                    <li>Пост номер 4</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
                <a style="float: right; text-indent: 0.5em;" href="./portfolio">Портфолио</a>
                <a style="float: right;" href="./summary">Резюме</a>
            </div>
        </div>
    </div>
</div>
<div id="footer">
    <div class="container">
        <div class="row">
            <div class="span12">
                <div class="span2">
                    <ul class="unstyled">
                        <li>Блоги</li>
                        <li><a href="#">Математика</a></li>
                        <li><a href="#">Программирование</a></li>
                    </ul>
                </div>
                <div class="span2">
                    <ul class="unstyled">
                        <li>Статистика</li>
                        <li><a href="#">Посещения</a></li>
                    </ul>
                </div>
                <div class="span2">
                    <ul class="unstyled">
                        <li>Обо мне</li>
                        <li><a href="#">Резюме</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <hr />
        <div class="row-fluid">
            <div class="span12">
                <div class="span8">
                </div>
                <div class="span4">
                    <p class="muted pull-right">© 2013 coffeeonkeyboard.info</p>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
