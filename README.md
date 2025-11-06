# Đồ án Hệ thống Thương mại Điện tử SmartVN

Đây là một dự án thương mại điện tử hoàn chỉnh được xây dựng theo kiến trúc Microservices, bao gồm giao diện cho khách hàng (`smartvn-frontend`) và trang quản trị (`admin-smartVN`).

## 1. Giới thiệu

Hệ thống **SmartVN** mô phỏng một cửa hàng công nghệ, cho phép người dùng xem sản phẩm, quản lý giỏ hàng, đặt hàng và thanh toán. Quản trị viên có thể quản lý sản phẩm, đơn hàng, người dùng và xem thống kê.

### Kiến trúc hệ thống
Dự án được chia thành các dịch vụ (services) độc lập, được quản lý bởi Docker Compose:

* **`mysql-db`**: Dịch vụ cơ sở dữ liệu MySQL.
* **`discovery-service`**: Eureka Server để đăng ký và khám phá dịch vụ.
* **`config-server`**: Spring Cloud Config Server quản lý cấu hình tập trung.
* **`api-gateway`**: Cổng API (Gateway) là điểm vào duy nhất cho tất cả các yêu cầu từ frontend.
* **`user-service`**: Quản lý người dùng và xác thực.
* **`product-service`**: Quản lý sản phẩm, danh mục và tồn kho.
* **`order-service`**: Quản lý giỏ hàng và đơn hàng.
* **`admin-service`**: Cung cấp các API tổng hợp cho trang quản trị.
* **`customer-frontend`**: Giao diện website cho khách hàng (React).
* **`admin-frontend`**: Giao diện trang quản trị (React).

## 2. Công nghệ sử dụng

* **Backend**: Java (Spring Boot, Spring Cloud)
* **Frontend**: React (Vite), TailwindCSS
* **Database**: MySQL 8.0
* **Infrastructure**: Docker, Docker Compose

## 3. Hướng dẫn chạy (Sử dụng Docker Compose)

Toàn bộ hệ thống được thiết kế để chạy đơn giản bằng một lệnh Docker Compose duy nhất.

### 3.1. Yêu cầu hệ thống
* [Docker](https://www.docker.com/get-started)
* [Docker Compose](https://docs.docker.com/compose/install/)

### 3.3. Khởi chạy hệ thống

Sau khi đã tạo file `.env`, mở terminal ở thư mục gốc của dự án và chạy lệnh sau:

```bash
docker-compose up --build -d
````

  * `--build`: Sẽ build (xây dựng) các images cho tất cả các service (backend và frontend) từ `Dockerfile` tương ứng.
  * `-d`: Chạy ở chế độ "detached" (chạy ngầm).

**Quá trình này sẽ tự động:**

1.  Khởi động container `mysql-db`.
2.  Khi `mysql-db` chạy lần đầu, nó sẽ **tự động import** file `dumps/TechShopDB.sql` để tạo database `techshop_db` và dữ liệu mẫu.
3.  Khởi động `discovery-service` và `config-server`.
4.  Khởi động tất cả các microservices backend (user, product, order, admin) và 2 service frontend.

Quá trình build lần đầu có thể mất vài phút.

## 4\. Truy cập ứng dụng

Sau khi tất cả các dịch vụ đã khởi động (bạn có thể kiểm tra bằng `docker-compose ps -a`), bạn có thể truy cập hệ thống qua các cổng sau:

  * **Trang khách hàng (SmartVN)**: [http://localhost:5173](https://www.google.com/search?q=http://localhost:5173)
  * **Trang quản trị (Admin)**: [http://localhost:5174](https://www.google.com/search?q=http://localhost:5174)
  * **API Gateway (Điểm cuối API)**: [http://localhost:8080](https://www.google.com/search?q=http://localhost:8080)
  * **Eureka Dashboard (Service Discovery)**: [http://localhost:8761](https://www.google.com/search?q=http://localhost:8761)
  * **Config Server**: [http://localhost:8888](https://www.google.com/search?q=http://localhost:8888)

## 5\. Dừng ứng dụng

Để dừng và xóa tất cả các container đang chạy:

```bash
docker-compose down
```
