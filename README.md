1. Скачать standalone selenium-server: http://www.seleniumhq.org/download/
2. Создать папку и переместить туда jar:
`mkdir /var/selenium/`
`mv selenium-server-standalone-your-version.jar /var/selenium/server.jar`
3. Убедиться, что тестовая БД существует и содержит точно такие же данные, как и dev БД
4. Убедиться, что на машине установлена программа java (java -version)
5. Убедиться, что на машине установлен браузер Firefox
6. Выполнить сиды RAILS_ENV=test rake db:seed
