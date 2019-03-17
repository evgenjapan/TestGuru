# README

Ruby ver. 2.5.1 Rails ver. 5.2.2.1

<h2>Непутёвые заметки о структуре данных</h2>
<h3>Модель User:</h3>
    username <br/>
    name <br/>
    surname <br/>
    email <br/>
    password <br/>
    registration_date # Дата регистрации на сайте <br/>
    rating # Рейтинг основанный на кол-во пройденных тестов <br/>
    tests_passed # Related field указывающий на пройденные тесты <br/>
    wishes # Related field указывающий на планируемые тесты <br/>
    permission # Не уверен, что permission level задается в Rails в модели, но пока пусть будет тут
    (Возможно есть смысл создать отдельную связанную модель Role, узнаю,
     когда пойму как работать с пермишенами в Рельсах, т.к. сейчас ориентируюсь на Django) <br/>
    
<h3>Модель Test: </h3>
    name <br/>
    description <br/>
    author # Related field указывающийна автора<br/>
    publish_date # Дата публикации теста<br/>
    timer # Время отведённое на прохождение<br/>
    questions # Related field указывающий на вопросы к тесту <br/>
    score # Кол-во очков, которое получит юзер за прохождение (поднимает рейтинг) <br/>
    min_percent # (Не очень правильное название) Минимальный процент правильных ответов для завершения теста <br/>

<h3>Модель Question: </h3>
    content # Сам вопрос <br/>
    answers #Integer field с параметром choice, в котором указан content ответа и его так сказать локальный id
     (тоже не уверен, что в Rails делается так, опираюсь на свой опыт Django,
      если так сделать нельзя, то я бы сделал еще одну модель answer )<br/>
    right_answer # Related field указывающий на правильный ответ<br/>
