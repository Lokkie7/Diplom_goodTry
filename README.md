  1. Создание облачной инфраструктуры

  Если создавать ключ для доступа к ресурсам через терраформ через сам terraform он будет отображаться чувствительной информацией и у меня не будет к нему доступа, поэтому мне пришлось разделить предварительную работу на части - создание сервисного аккаунта, создание secret key вручную с сохранением его данных, создание и настройка бакета для конфигурации на основе созданного ключа, настройка сохранения стейта основной конфигурации сохраняется в бакете.

  Все этапы кроме создания secret key создаются в моей конфигурации terraform.
  Выполнять конфигурирование terraform следует в следующей очередности:
  1-service-account
    1.1- создать secret key для сервисного аккаунта вручную, использовать его данные для дальнейшей конфигурации terraform
  2-bucket
  3-развертка кластера kubernetes

  Все конфигурации представлены в корне текущего репозитория. Чувствительная информация : ключи, id, имена ресурсов намеренно скрыты.

  После выполнения этих действий - Terraform сконфигурирован и создание инфраструктуры посредством Terraform возможно без дополнительных ручных действий.
Сохранение конфигурации в бакете: 
![image](https://github.com/user-attachments/assets/fe4cdf3f-dcce-4472-947f-ace939be44db)

---
2. Создание Kubernetes кластера

Создание кластера kubernetes выполняется в директории 3-project. После разворачивания инфраструктуры был настроен файл ~/.kube/config командой:

yc managed-kubernetes cluster get-credentials k8s-cluster --external --force

Пример конфигурационного файла ~/.kube/config представлен в корне текущего репозитория в файле - kubeconfig-example. Чувствительная информация скрыта.

Команда kubectl get pods --all-namespaces отрабатывает без ошибок:

![image](https://github.com/user-attachments/assets/1be3c3cf-9d00-4462-afb5-687362d78d88)

---
3. Создание тестового приложения

Мной была подготовлена простая конфигурация статического сайта на nginx.

https://github.com/Lokkie7/app-new - репозиторий с файлами приложения

https://hub.docker.com/repository/docker/lokkie7/nginx-app-simple/general - Dockerfile

---
4. Подготовка cистемы мониторинга и деплой приложения

К сожалению у меня не получилось настроить доступ к приложению и веб интерфейсам через балансировщик, способы сделать это в yandex cloud сбивают меня с толку и множат проблемы буквально на каждом этапе развертки.
Вместо этого я пока просто открыла доступы к веб-интерфейсам через сурвис Nodeport.
Остальная работа выполнена, поэтому считаю дипломную работу полностью завершенной. если в ходе просмотра сможете подсказать как донастроить эту часть буду признательна.

Мною была выполнена установка системы мониторинга через kube-prometheus

![image](https://github.com/user-attachments/assets/602b4b37-a4cd-4f7d-9ad8-d9d515ec7ad0)

grafana-service.yaml

![image](https://github.com/user-attachments/assets/fbc48e59-5784-4a0d-83ab-a1ecdea5bce0)

Дашборды

![image](https://github.com/user-attachments/assets/30999446-7354-4d59-8d1c-99b32c4b6a09)

Я успешно настроила Atlantis для автоматического деплоя конфигурации kubernetes из репозитория github по pull реквесту

Пул реквест на Github
![image](https://github.com/user-attachments/assets/61c7c0de-206d-4be5-91fa-f6cef48f2b6f)

Как это выглядит в Atlantis
![image](https://github.com/user-attachments/assets/55ba39d4-68f4-4863-b485-0aad714e56ba)

---

Настройку CI/CD я выполнила с помощью Teamcity
![image](https://github.com/user-attachments/assets/68fef964-dd5e-4b77-86bf-e0a434521417)

![image](https://github.com/user-attachments/assets/9d310877-a4c1-45c5-a8bd-58c4243e3a05)

![image](https://github.com/user-attachments/assets/00c6a472-7d5d-45ea-952f-1a4fa4045e03)

![image](https://github.com/user-attachments/assets/3387f680-0543-466d-8b57-6e68a8baf619)

![image](https://github.com/user-attachments/assets/ce05a3b8-9800-4ea5-ac8a-4d92dea77668)
