# shri-infrastructure

CI реализован на GitHub Actions.

При добавлении тэга типа v0.0[.0] будет создан релиз, выпущен докер контейнер и запущены автотесты
Результаты исполнения различных шагов отображаются на Я.Трекере

Добавляемый тэг должен быть аннотированным с сообщением, содержащим кодовое имя релиза. :D
Придерживаемся аллитерации, что то вроде "Greedy Gazelle", "Hopless Hippo", "Posh Panther"

shell скрипты, используемые для CI расположены в папке `/scripts`

Настройка Github workflow в папке ```.github/workflows```

Пустое приложение, собираемое в докер контейнер в папке `/app`

-------------------------------------------------------------------

