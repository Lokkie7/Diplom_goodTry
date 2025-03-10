  1. Создание облачной инфраструктуры

  Из-за того что, если создавать ключ для доступа к ресурсам через терраформ через сам terraform он будет отображаться чувствительной информацией и у меня не будет к нему доступа, мне пришлось разделить предварительную работу на части - создание сервисного аккаунта, создание secret key вручную с сохранением его данных, создание и настройка бакета для конфигурации на основе созданного ключа, настройка сохранения стейта основной конфигурации сохраняется в бакете.

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

2. Создание Kubernetes кластера

Создание кластера kubernetes выполняется в директории 3-project. После разворачивания инфраструктуры был настроен файл ~/.kube/config командой:

yc managed-kubernetes cluster get-credentials k8s-cluster --external

Пример конфигурационного файла ~/.kube/config представлен в корне текущего репозитория в файле - kubeconfig-example. Чувствительная информация скрыта.

Команда kubectl get pods --all-namespaces отрабатывает без ошибок:

![image](https://github.com/user-attachments/assets/1be3c3cf-9d00-4462-afb5-687362d78d88)

3. Создание тестового приложения

Мной была подготовлена простая конфигурация статического сайта на nginx.

https://github.com/Lokkie7/app-new - репозиторий с файлами приложения
https://hub.docker.com/repository/docker/lokkie7/nginx-app-simple/general - Dockerfile
