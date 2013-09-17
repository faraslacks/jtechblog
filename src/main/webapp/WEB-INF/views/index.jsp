<%@ page pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Blog template</title>
    <meta charset="utf-8">
    <!-- OpenSans font loaded via CDN -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300,300italic,400,400italic,700,700italic&subset=latin,cyrillic-ext' rel='stylesheet' type='text/css'>
    <link href="<c:url value="/resources/bootstrap/css/bootstrap.min.css" />" rel="stylesheet" media="screen">
    <script type="text/javascript" src="<c:url value="/resources/js/jquery-1.10.2.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/bootstrap/js/bootstrap.js" />"></script>
    <style>
        body {
            background-image: url("<c:url value="/resources/images/inkblot.png" />");
            background-repeat: no-repeat;
            background-position: -25px -35px;
            margin-top: 20px;
        }
        body, p, span, h1, li {
            font-family: 'Open Sans', sans-serif;
            font-weight: 300;
            line-height: normal;
        }
        p {
            text-indent: 2.5em;
            margin: 0em;
            line-height: 1.5;
        }
        ol {
            margin-left: 2.5em;
        }
        h1, h3, h4 {
            font-weight: 300;
        }
        span.blog {
            font-style: italic;
        }
    </style>
    <!-- MathJax loaded via CDN -->
    <script type="text/x-mathjax-config">
        MathJax.Hub.Config({
            jax: ["input/TeX", "output/SVG"],
            tex2jax: {
                inlineMath: [['$','$'], ['\\(','\\)']]
            }
        });
    </script>
    <script type="text/javascript" src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS_HTML"></script>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="span7 well">
            <h1>Математический раздел блога</h1>
            <hr />
            <div>
                <h3>Биномиальное распределение: бросаем монетку, ждём динозавра.</h3>
                <span class="blog">23.08.2013</span>
                <span class="blog" style='float: right'>Оценка: 4</span>
                <br /><br />
                <%=
                    request.getAttribute("text")
                %>
            </div>
        </div>
        <div class="span4 well">
            <span class="blog">В этом разделе я пишу то, о чём мне нравится размышлять. Цель каждого поста здесь
                &mdash; рассказать сложные (и не очень) вещи простым человеческим языком, заострив внимание
            на том, что именно означает та или иная математическая абстракция, откуда она выросла
            и какое отношение имеет к реальности. По-возможности, каждый пост снабжается списком
            литературы в которую я заглянул пока писал, симпатичными иллюстрациями и иногда исторической
            справкой.</span>
            <br /><br />
            <h4>Последние посты:</h4>
            <ul>
                <li>Решето Эратосфена: просто о простом.</li>
                <li>Теорема о причёсывании ежа: только четномерный ёж может быть причёсан.</li>
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
            <a href="/portfolio">Портфолио</a>
        </div>
    </div>
</div>
</body>
</html>