<%-- 
    Document   : test
    Created on : 25.05.2015, 2:26:05
    Author     : anya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Тест на честность</title>
    </head>
    <body>
        
        <%
            // приветствие зарегистрированного пользователя
            Object username_o = session.getAttribute("user");
            String username = "не пойми кто";
            if(username_o == null)
            {
                ServletContext context = getServletContext();
                RequestDispatcher dispatcher =
                        context.getRequestDispatcher("/no_login.jsp");
                dispatcher.forward(request, response);
            }
                else {username = username_o.toString();}

            // результаты теста
            String reg_error = new String();
            Object error_reg = request.getAttribute("reg_error");
            if (error_reg != null)
            {
                reg_error = error_reg.toString();
            }
            
        %>

        <form action="TestServlet">
        <p align="right"> Привет, <font color="green"><b><%= username %></b></font>!<br>
            <a href="index.jsp">Выйти</a>
        </p>
        <p align="left">Если Вы хотите посмотреть предыдущие результаты прохождения теста, нажмите на кнопку "Показать".</b></font><br>
        </p>
        <table cellspacing="10" align="left">
            <tr>
                <td></td>
                <td><input type="submit" value="Показать"></td>
            </tr>
            <tr>
                <td></td>
                <td>Ваши предыдущие результаты: <%= reg_error %></td>
            </tr>            
        </table>
        </form>
        <br><br><br><br>
        <form action="ShowServlet">
        <p align="left">Пожалуйта, выберите варианты вашего ответа.</p>
        <ul type="square">
<p><b>Бывает, что я смеюсь над неприличным анекдотом.</b></p>
<p><input type="radio"  name="name1" value="a"> а) Да;<br>
<input type="radio"  name="name1" value="b"> б) Нет.<br>
<p><b>Если ко мне обращаются вежливо, то я тоже всегда отвечаю вежливо.</b></p>
<p><input type="radio"  name="name2" value="a"> а) Да;<br>
<input type="radio"  name="name2" value="b"> б) Нет.<br>
<p><b>У меня бывают денежные затруднения.</b></p>
<p><input type="radio"  name="name3" value="a"> а) Да;<br>
<input type="radio"  name="name3" value="b"> б) Нет.<br>
<p><b>Мне всегда приятно, когда человек, который мне не нравится, добивается заслуженного успеха.</b></p>
<p><input type="radio"  name="name4" value="a"> а) Да;<br>
<input type="radio"  name="name4" value="b"> б) Нет.<br>
<p><b>Бывало, откладывал то, что требовалось сделать немедленно.</b></p>
<p><input type="radio"  name="name5" value="a"> а) Да;<br>
<input type="radio"  name="name5" value="b"> б) Нет.<br>
<p><b>В компании я веду себя не так, как дома. </b></p>
<p><input type="radio"  name="name6" value="a"> а) Да;<br>
<input type="radio"  name="name6" value="b"> б) Нет.<br>
<p><b>Я полностью свободен от всяких предрассудков.</b></p>
<p><input type="radio"  name="name7" value="a"> а) Да;<br>
<input type="radio"  name="name7" value="b"> б) Нет.<br>
<p><b>Я не всегда говорю правду. </b></p>
<p><input type="radio"  name="name8" value="a"> а) Да;<br>
<input type="radio"  name="name8" value="b"> б) Нет.<br>
<p><b>Когда я с кем-нибудь играю, мне всегда хочется победить. </b></p>
<p><input type="radio"  name="name9" value="a"> а) Да;<br>
<input type="radio"  name="name9" value="b"> б) Нет.<br>
<p><b>Иногда я сержусь.</b></p>
<p><input type="radio"  name="name10" value="a"> а) Да;<br>
<input type="radio"  name="name10" value="b"> б) Нет.<br>
<p><b>В свое оправдание я иногда кое-что выдумывал. </b></p>
<p><input type="radio"  name="name11" value="a"> а) Да;<br>
<input type="radio"  name="name11" value="b"> б) Нет.<br>
<p><b>Бывает, что я выхожу из себя. </b></p>
<p><input type="radio"  name="name12" value="a"> а) Да;<br>
<input type="radio"  name="name12" value="b"> б) Нет.<br>
<p><b>В детстве я сразу и без пререканий делал всё, что от меня требовалось. </b></p>
<p><input type="radio"  name="name13" value="a"> а) Да;<br>
<input type="radio"  name="name13" value="b"> б) Нет.<br>
<p><b>Иногда я раздражен чем-нибудь. </b></p>
<p><input type="radio"  name="name14" value="a"> а) Да;<br>
<input type="radio"  name="name14" value="b"> б) Нет.<br>
<p><b>Бывает, что я смехом реагирую на неприличную шутку.</b></p>
<p><input type="radio"  name="name15" value="a"> а) Да;<br>
<input type="radio"  name="name15" value="b"> б) Нет.<br>
<p><b>Бывало, я опаздывал к назначенному времени.</b></p>
<p><input type="radio"  name="name16" value="a"> а) Да;<br>
<input type="radio"  name="name16" value="b"> б) Нет.<br>
<p><b>Я люблю иногда посплетничать. </b></p>
<p><input type="radio"  name="name17" value="a"> а) Да;<br>
<input type="radio"  name="name17" value="b"> б) Нет.<br>
<p><b>Среди тех, кого я знаю, есть такие лица, которые мне очень не нравятся. </b></p>
<p><input type="radio"  name="name18" value="a"> а) Да;<br>
<input type="radio"  name="name18" value="b"> б) Нет.<br>
<p><b>Не помню, чтобы меня особенно опечалили неудачи человека, которого я не могу терпеть. </b></p>
<p><input type="radio"  name="name19" value="a"> а) Да;<br>
<input type="radio"  name="name19" value="b"> б) Нет.<br>
<p><b>Мне случалось опаздывать. </b></p>
<p><input type="radio"  name="name20" value="a"> а) Да;<br>
<input type="radio"  name="name20" value="b"> б) Нет.<br>
<p><b>Мне свойственно иногда прихвастнуть. </b></p>
<p><input type="radio"  name="name21" value="a"> а) Да;<br>
<input type="radio"  name="name21" value="b"> б) Нет.<br>
<p><b>Иногда нет никакого желания чем-либо заняться. </b></p>
<p><input type="radio"  name="name22" value="a"> а) Да;<br>
<input type="radio"  name="name22" value="b"> б) Нет.<br>
<p><b>У меня бывают иногда мысли, о которых стыдно рассказывать другим. </b></p>
<p><input type="radio"  name="name23" value="a"> а) Да;<br>
<input type="radio"  name="name23" value="b"> б) Нет.<br>
<p><b>Иногда я оказывался причиной плохого настроения кого-нибудь из окружающих. </b></p>
<p><input type="radio"  name="name24" value="a"> а) Да;<br>
<input type="radio"  name="name24" value="b"> б) Нет.<br>
<p><b>Бывало, что я говорил неправду. </b></p>
<p><input type="radio"  name="name25" value="a"> а) Да;<br>
<input type="radio"  name="name25" value="b"> б) Нет.<br>
<p><b>Все мои привычки положительны. </b></p>
<p><input type="radio"  name="name26" value="a"> а) Да;<br>
<input type="radio"  name="name26" value="b"> б) Нет.<br>
<p><b>Если я что-то обещал, то всегда сдерживаю слово несмотря ни на что. </b></p>
<p><input type="radio"  name="name27" value="a"> а) Да;<br>
<input type="radio"  name="name27" value="b"> б) Нет.<br>
<p><b>Иногда могу похвастаться. </b></p>
<p><input type="radio"  name="name28" value="a"> а) Да;<br>
<input type="radio"  name="name28" value="b"> б) Нет.<br>
<p><b>Подростком я проявлял интерес к запретным темам. </b></p>
<p><input type="radio"  name="name29" value="a"> а) Да;<br>
<input type="radio"  name="name29" value="b"> б) Нет.<br>
<p><b>Я откладываю иногда на завтра то, что необходимо сделать сегодня. </b></p>
<p><input type="radio"  name="name30" value="a"> а) Да;<br>
<input type="radio"  name="name30" value="b"> б) Нет.<br>
<p><b>У меня бывают мысли, которых следовало бы стыдиться. </b></p>
<p><input type="radio"  name="name31" value="a"> а) Да;<br>
<input type="radio"  name="name31" value="b"> б) Нет.<br>
<p><b>Я иногда спорю о вещах, о которых слишком мало знаю. </b></p>
<p><input type="radio"  name="name32" value="a"> а) Да;<br>
<input type="radio"  name="name32" value="b"> б) Нет.<br>
<p><b>Я люблю не всех своих знакомых. </b></p>
<p><input type="radio"  name="name33" value="a"> а) Да;<br>
<input type="radio"  name="name33" value="b"> б) Нет.<br>
<p><b>Я могу про кого-нибудь сказать плохо.</b></p>
<p><input type="radio"  name="name34" value="a"> а) Да;<br>
<input type="radio"  name="name34" value="b"> б) Нет.<br>
        </ul>
        <table cellspacing="10" align="center">
            <tr>
                <td></td>
                <td><input type="submit" value="Отправить"></td>
            </tr>
        </table>
        <table cellspacing="10" align="center">
        </table>
        </form>
    </body>
</html>